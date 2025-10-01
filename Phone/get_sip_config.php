<?php
/* <---------------------------------- Start VoipIran -----------------------------------> */
require_once "../libs/paloSantoDB.class.php";
require_once "../libs/misc.lib.php";
// خواندن رمز دیتابیس MySQL از فایل تنظیمات Issabel
$rootpw = trim(shell_exec("sed -ne 's/.*mysqlrootpwd=//gp' /etc/issabel.conf"));
if (empty($rootpw)) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'MySQL root password not found in /etc/issabel.conf']);
    exit;
}
// تنظیمات دیتابیس
define("servername", "localhost");
define("username", "root");
define("password", $rootpw);
define("dbname", "asterisk");
// بررسی وجود کاربر لاگین‌شده
session_start();
if (!isset($_SESSION['issabel_user'])) {
    header('HTTP/1.1 401 Unauthorized');
    echo json_encode(['error' => 'User not authenticated']);
    exit;
}
// دریافت اطلاعات از دیتابیس SQLite (settings.db)
$pDB = new paloDB('sqlite3:////var/www/db/settings.db');
$ip = get_key_settings($pDB, 'ip');
$port = get_key_settings($pDB, 'port');
// دریافت داخلی کاربر از دیتابیس SQLite (acl.db)
$pAC = new paloDB('sqlite3:////var/www/db/acl.db');
$user = $_SESSION['issabel_user'];
$userExtension = get_user_extension($pAC, $user);
// اتصال به دیتابیس MySQL (asterisk)
$conn = new mysqli(servername, username, password, dbname);
if ($conn->connect_error) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Connection to MySQL failed: ' . $conn->connect_error]);
    exit;
}
// دریافت اطلاعات وب‌فون از جدول webphones
$user = json_encode($user);
$sql = "SELECT * FROM webphones WHERE user=$user";
$result = $conn->query($sql);
$auth_user = null;
$cid_name = null;
$enable = 0;
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $auth_user = $row['auth_user'];
        $cid_name = $row['cid_name'];
        $enable = $row['enable'];
    }
}
// دریافت رمز عبور SIP از جدول sip
$password = null;
if ($auth_user && $enable) {
    $sql = "SELECT data FROM sip WHERE id='$auth_user' AND keyword='secret'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $password = $row['data'];
        }
    }
}
// بستن اتصال
$conn->close();
// بررسی کامل بودن اطلاعات
if (!$ip || !$port || !$auth_user || !$password || !$enable) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Incomplete SIP configuration']);
    exit;
}
// ارسال پاسخ JSON
header('Content-Type: application/json');
echo json_encode([
    'wssServer' => $ip,
    'WebSocketPort' => $port,
    'ServerPath' => '/ws',
    'SipDomain' => $ip,
    'SipUsername' => $auth_user,
    'SipPassword' => $password,
    'profileName' => $cid_name ?: 'VOIZ User'
]);
?>