#!/bin/bash

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
