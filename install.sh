#!/bin/bash

clear
# Colorize output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
BOLD='\033[1m'
NC='\033[0m' # No color
echo -e "${MAGENTA}###############################################################${NC}"
echo -e "${CYAN}██╗   ██╗ ██████╗ ██╗██████╗ ██╗██████╗  █████╗ ███╗   ██╗${NC}"
echo -e "${CYAN}██║   ██║██╔═══██╗██║██╔══██╗██║██╔══██╗██╔══██╗████╗  ██║${NC}"
echo -e "${CYAN}██║   ██║██║   ██║██║██████╔╝██║██████╔╝███████║██╔██╗ ██║${NC}"
echo -e "${CYAN}╚██╗ ██╔╝██║   ██║██║██╔═══╝ ██║██╔══██╗██╔══██║██║╚██╗██║${NC}"
echo -e "${CYAN} ╚████╔╝ ╚██████╔╝██║██║     ██║██║  ██║██║  ██║██║ ╚████║${NC}"
echo -e "${CYAN}  ╚═══╝   ╚═════╝ ╚═╝╚═╝     ╚═╝╚══╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝${NC}"
echo -e "${MAGENTA}###############################################################${NC}"
echo -e "${MAGENTA}                    https://voipiran.io                    ${NC}"
echo -e "${MAGENTA}###############################################################${NC}"

echo "Install VOIPIRAN WebPhone"
echo "VOIPIRAN.io"
echo "VOIPIRAN WebPhone 1.0"
sleep 1

issabel-menumerge /tmp/VOIZ-WebPhone/phone.xml

# اضافه کردن تنظیمات به انتهای فایل sip_custom.conf
cat <<EOF >> /etc/asterisk/sip_custom.conf

websocket_enabled=true
maxcallbitrate=5120
accept_outofcall_message=yes
auth_message_requests=no
outofcall_message_context=messages
EOF


cat <<EOF >> /etc/asterisk/extensions_custom.conf

[messages]
;;VOIPIRAN.io
exten => _.,1,NoOp(SMS receiving dialplan invoked)
exten => _.,n,NoOp(To \${MESSAGE(to)})
exten => _.,n,NoOp(From \${MESSAGE(from)})
exten => _.,n,NoOp(Body \${MESSAGE(body)})
exten => _.,n,Set(ACTUALTO=\${CUT(MESSAGE(to),@,1)})
exten => _.,n,MessageSend(\${ACTUALTO},\${MESSAGE(from)})
exten => _.,n,NoOp(Send status is \${MESSAGE_SEND_STATUS})
exten => _.,n,GotoIf([\\"\${MESSAGE_SEND_STATUS}\\" != \\"SUCCESS\\"]?sendfailedmsg)
exten => _.,n,Hangup()
;exten => h,1,Hangup()
; Handle failed messaging
exten => _.,n(sendfailedmsg),Set(MESSAGE(body)="[\${STRFTIME(\${EPOCH},,%d%m%Y-%H:%M:%S)}] Your message to \${EXTEN} has failed. Retry later.")
exten => _.,n,Set(ME_1=\${CUT(MESSAGE(from),<,2)})
exten => _.,n,Set(ACTUALFROM=\${CUT(ME_1,@,1)})
exten => _.,n,MessageSend(\${ACTUALFROM},ServiceCenter)
exten => _.,n,Hangup()
exten => h,1,Hangup()
EOF


service asterisk reload
