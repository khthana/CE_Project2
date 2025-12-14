jChatBox 2.6
Copyright JavaZOOM 1999-2004
http://www.javazoom.net

==========================================================
jChatBox support page :
http://www.javazoom.net/jzservlets/jchatbox/jchatbox.html

jChatBox Add-ons/Plugins page : 
http://www.javazoom.net/jzservlets/jchatbox/jchatboxtools.html

JSP Forums :
http://www.javazoom.net/services/forums/index.jsp
==========================================================

* Open documentation/index.html for instructions *


01/07/2004 : v2.6
-----------------
 - Pluggable ChatroomListener API added :
     It allows any custom plugin to get notified about chatroom events such as new user in the 
     chatroom, new message, chatroom cleared, chatroom closed, ... A ChatroomTimerListener provides
     time-based event feature too.
 - Manual "Add IP Address" to blacklist added.
 - Client applet improved :
    userid, chatroomid and hideuserid parameters added for "SmartLogin" feature.
    Bug fixed for login usernames (such as ones including space characters).
    Bug fixed on "Enter" key for JDK 1.3+.
    Bug fixed in unsupported languages loading.
 - Multilanguage support improved :
    Dutch resource added.
    Swedish resource added.
    Non-ISO support added for administration features (moderators, room name/subject, ...)
    Bug fixed in private messages for non-ISO usernames.
    Bug fixed (key missing) on XML resources loading.
 - Misc :
    Chatrooms are sorted by ID (order by creation).
    Filter API improved (eprocess method added).
    Custom parameters (Hashtable) added to UserParams.
    UserLogin service loads HTTP parameters into these custom UserParams.
    Log files include both user's bound and unbound traces.
    UTF-8 support bug fixed in XML Connector service.

 - Load Test/Benchmark (CPU/RAM/Bandwidth) available.
 - Documentation updated.

 - Add-ons :
    WebCam2K skin added.
    Censor Filter added.
    Cyrillization (russian) multilanguage pack added.
    Simplified (gb2312) and Traditional (big5) chinese multilanguage pack added.
    JAASAuth (authentication) added.
    DBAuth (Oracle/MySQL authentication) updated.
    Self Opening&Closing service added : 
      It allows to create a default chatroom (if not available) by any end-user.
      Empty chatrooms are automatically closed after 10 minutes.

 + Tomcat 5.0.16 support added.


01/06/2003 : v2.5
-----------------
 - Multilanguage support improved :
    Multilanguage HTML/CSS/JavaScript skin added.
    Multilanguage Applet client added.
    Language feature added to each chatroom.
    Language feature added to XML and TEXT transcripts.
    Languages list and resources given a language added to XMLConnector.
    English, Spanish, German, Portuguese, Danish and French resources are included.

 - Packaging improved :
    conf/ folder moved into $JCHATBOX_HOME/WEB-INF/ folder.
    Automatic log folder and backup file setup added (through AUTOCONF).
    InitServlet added (configureme.jsp and jspDestroy() call removed).
    ZIP and TAR.GZ archives are now WAR compliant.
    EAR archive available.

 - Client applets improved :
    # separator replaced by | separator.
    Chatroom's name label added to chat panel.
    Resources added to jcbskin.xml.

 - Documentation updated.

 + WebSphere 5.0 support added.
 + WebLogic 7.0 support added.
 + SunOne 7.0 support added.
 + Tomcat 4.1.18 support added.


06/03/2002 : v2.4.1
-------------------
 - Transcript API added :
    TextDump implemented.
    XMLDump implemented.
 - Bug Fixes :
    Moderators loading (random) bug fixed.
    Flash6MX support added to jcbClient.fla
    Netscape6 login and scroll bugs fixed in HTML skins.
 + JRun4 support added.
 + Resin 2.1.1 support added.

 + Two more jChatBox Add-Ons :
    X-Chat 1.0.1 : Flash5 and Flash6MX client using jChatBox XML Connector Service.
    XMLTranscriptor : XML Transcript sample using jChatBox Transcript API.
    http://www.javazoom.net/jzservlets/jchatbox/jchatboxtools.html


05/06/2002 : v2.4
-----------------
 - Moderators added :
    - jchatboxusers.xml added.
    - Admin panel updated.
 - Commands feature added : /help, /time, /kick ...
 - Documentation updated :
    - User Guide.
    - Administration Guide.
 + WebSphere 4.0.2 AE/AEs support added.
 + WebSphere 6.1 support added.
 + Tomcat 4.0.3 support added.
 + Orion 1.5.2 support added.


12/03/2001 : v2.3
-----------------
 - Applet Client added (including three skins : Comics, Manga and ExtremeSUN).
 - XMLConnector API updated (newonly parameter added to get only new messages since the last access)
 - FLASH5 script and API for FLASH5 clients.
 - Documentation updated.


11/05/2001 : v2.2.1
-------------------
 - WAR archive available.
 - USERSESSIONID added to jchatbox.xml (to avoid "user" HttpSession conflict).
 - COOKIEID parameter deprecated (not needed anymore).
 + WebSphere 3.5.3 support added.
 + Tomcat 4.0.1 support added.


09/02/2001 : v2.2
-----------------
 - XML Connector Service added !
 - Clear feature added to admin panel and to jChatBox API.
 - JVM 1.1.8 support added.

 + Websphere Test Environment 3.5.3 added.

More jChatBox Add-Ons : http://www.javazoom.net/jzservlets/jchatbox/jchatboxtools.html
  Chinese Skin : This Add-On is an HTML/JavaScript Skin that supports gb2312 charset.
  LDAPAuth : This Add-On provides LDAP authentication for jChatBox users.


07/02/2001 : v2.1.1
-------------------
jChatBox Add-Ons are available at : http://www.javazoom.net/jzservlets/jchatbox/jchatboxtools.html
  Emoticons : This Add-On is an HTML filter that converts smiley signs into images.
  DBAuth : This Add-On provides a database authentication for jChatBox users.
Bug Fixes :
 - Filter ambiguous class error (Servlets 2.3 API only).

+ WebLogic 6.0 SP2+ support added.
+ Tomcat 4.0b support added.


05/02/2001 : v2.1
-----------------
QUIT feature added to avoid to invalidate HttpSession when user leaves a chatroom.
API improved :
 - Filter API finalized.
 - Filter classes loaded at Runtime to allow developers to add their own filters to jChatBox.
   (Filters are now included in jchatbox.xml)
 - xxxLogin and xxxProcessor have moved to jChatBox.Service package.
Registration message added to "Manage jChatBox" admin section.
Xerces migration to 1.3.1.

+ ServletExec 3.1 support added.
+ Weblogic 5.1 support added.
+ WebAppCabaret.com support added.

Bug Fixes :
 - Apache+Tomcat+IE admin panel mess fixed.
 - Session loss in buffered-framed mode fixed.
 - XML file CRLF loss fixed.
 - JavaScript bug fix under Netscape for Buffered-Framed mode chatrooms,
   (sometimes chatroom's content was blank), css style removed.


04/02/2001 : v2.0
-----------------
jChatBox, 100% JSP Chat Application.
Multiple chatrooms supported.
Filters features (HTML, URL Converter).
HTML/JavaScript skins (mIRC, Classic, j-TV).

+ Tomcat 3.x support.
+ JRun 3.01 support.
+ Resin 1.2.3 support.