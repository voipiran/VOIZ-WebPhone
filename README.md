# Browser Phone
A fully featured browser based WebRTC SIP phone for Asterisk

# Installation


### Description
This web application is designed to work with Asterisk PBX. Once loaded application will connect to Asterisk PBX on its web socket, and register an extension. Calls are made between contacts, and a full call detail is saved. Audio Calls can be recorded. Video Calls can be recorded, and can be saved with 5 different recording layouts and 3 different quality settings. This application does not use any cloud systems or services, and is designed to be stand-alone. Additional libraries will be downloaded at run time (but can also be saved to the web server for a complete off-line solution).

## Browser Phone v4.0
> [!IMPORTANT]
> The Browser Phone project version 4.0 will be developed under Siperb (https://www.siperb.com/). Siperb is already hosted and offers a mobile version, **and the necessary SIP proxy** to connect to your PBX. Siperb offers much more, including: Hosting, Provisioning, Transcoding (from DTLS to regular RTP), and a complete history of calls and conversations. Try it out: https://www.siperb.com/phone/.

> [!WARNING]
> Siperb Browser Phone is in __beta phase__, but we are moving fast to become the best **WebRTC Browser Phone on the market**.

> [!NOTE]
> We are looking for Beta testers for Siperb. Please see here: https://www.siperb.com/kb/article/welcome-to-the-siperb-beta-program/ 

![Buddy Stream](https://github.com/InnovateAsterisk/Browser-Phone/blob/master/Screenshots/Buddy_Stream.jpg)

### Hosted versions/samples
- https://www.innovateasterisk.com/phone/ *(Default Layout - contains a welcome screen)*
- https://www.innovateasterisk.com/phone/responsive.html *(Responsive Sample Layout - contains ads)*
- https://www.innovateasterisk.com/phone/popup.html *(Popup Sample Layout - contains ads)*

### Docker
Browser Phone now offers a [Dockerfile](https://github.com/InnovateAsterisk/Browser-Phone/blob/master/Dockerfile). It is by far "The easiest way to kick the tires on WebRTC". It comes fully configured with 3 users, and the SSL certificate needed to run your tests. It may take a while to build, but it's literally a 1, 2, 3 process.

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

## JavaScript Dependencies
- sip-0.20.0                    : WebRTC and SIP signalling library
- jquery-3.3.1                  : JavaScript toolkit
- jquery.md5                    : Md5 Hash plug-in (unused)
- Chart-2.7.2                   : Graph and Chart UI
- jquery-ui                     : Windowing & UI Library
- fabric-2.4.6                  : Canvas Editing Library
- moment-2.24.0                 : Date & Time Library
- croppie-2.6.4                 : Profile Picture Crop Library
- strophe-1.4.1                 : XMPP Library

> Note: These files will load automatically from CDN.

## StyleSheet Dependencies
- normalize-v8.0.1              : CSS Normalising Stylesheet
- roboto                        : Roboto Font
- font-awesome-4.7              : Icon Font library
- jquery-ui                     : For jQuery UI
- croppie-2.6.4                 : For Croppie

> Note: These files will load automatically from CDN.
