# Browser Phone
A fully featured browser based WebRTC SIP phone for Asterisk

# Installation
```
sudo git clone https://github.com/voipiran/VOIZ-WebPhone /tmp/VOIZ-WebPhone && sudo mv /tmp/VOIZ-WebPhone/Phone /var/www/html/phone && sudo bash /tmp/VOIZ-WebPhone/install.sh
```

### Description
This web application is designed to work with Asterisk PBX. Once loaded application will connect to Asterisk PBX on its web socket, and register an extension. Calls are made between contacts, and a full call detail is saved. Audio Calls can be recorded. Video Calls can be recorded, and can be saved with 5 different recording layouts and 3 different quality settings. This application does not use any cloud systems or services, and is designed to be stand-alone. Additional libraries will be downloaded at run time (but can also be saved to the web server for a complete off-line solution).

## Browser Phone v4.0
> [!IMPORTANT]
> The Browser Phone project version 4.0 will be developed under Siperb (https://www.siperb.com/). Siperb is already hosted and offers a mobile version, **and the necessary SIP proxy** to connect to your PBX. Siperb offers much more, including: Hosting, Provisioning, Transcoding (from DTLS to regular RTP), and a complete history of calls and conversations. Try it out: https://www.siperb.com/phone/.

### Hosted versions/samples
- https://www.innovateasterisk.com/phone/ *(Default Layout - contains a welcome screen)*
- https://www.innovateasterisk.com/phone/responsive.html *(Responsive Sample Layout - contains ads)*
- https://www.innovateasterisk.com/phone/popup.html *(Popup Sample Layout - contains ads)*

### Docker
Browser Phone now offers a [Dockerfile]([https://github.com/voipiran/VOIZ-WebPhone/blob/master/Dockerfile). It is by far "The easiest way to kick the tires on WebRTC". It comes fully configured with 3 users, and the SSL certificate needed to run your tests. It may take a while to build, but it's literally a 1, 2, 3 process.

## Features v0.3.x
- SIP Audio Calling
- SIP Video Calling
- XMPP Messaging 
- Call Transfer (Both Blind & Attended)
- 3rd Party Conference Call
- Call Detail Records
- Call Recording (Audio & Video)
- Screen Share during Video Call
- Scratchpad Share during Video Call
- Video/Audio File Share during Video Call
- SIP (text/plain) Messaging
- SIP Message Accept Notification (not delivery)
- Buddy (Contact) Management
- Useful debug messages sent to console.
- Works on: Chrome (all features work), Edge (same as Chrome), Opera (same as Chrome), Firefox (Most features work), Safari (Most feature work)
- Asterisk SFU - Including talker notification and Caller ID
- Dark Mode & Light Mode - System Setting Detects

## XMPP Features v0.2.x
- User Login & Auth (Use SIP credentials)
- Buddy List (Roster) Saved on Server
- Buddy vCard
- Buddy Picture Upload
- Message Typing Indication
- Message Delivery & Read Notification
- Offline Message History (If supported by server)
- Tested to work with Openfire

## Server; Requires
- Asterisk PBX version 13|16|17|18 (with Websockets and Text Messaging, chan_sip or chan_pjsip)

## Server; Optional
- Openfire XMPP Server

