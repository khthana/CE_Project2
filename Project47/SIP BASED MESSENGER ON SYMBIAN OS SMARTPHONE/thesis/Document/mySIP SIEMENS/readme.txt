
Siemens Communication Systems (SCS) Sip Proxy Service - version 1.0.0.2 rel - 2 July 2004

Copyright (c) 2001-2004, Siemens Switzerland Ltd.
All rights reserved.


DESCRIPTION
-----------

The SCS Sip Proxy Service is a very easy-to-use SIP proxy.


OVERVIEW
--------

General
  - Configurations changes are done on-the-fly
  - Can run as a standalone application or as a NT service

Registrar
  - Support for max 100 bindings
  - optional recording of registered users in MS Access Database (see 'Database Configuration' below)
  
Proxy modes
  - Both 'Redirect' and 'StateLess' proxy mode are supported

Routing
  - Both 'Loose' and 'Strict' routing modes are supported
  - DNS processing can be activated to forward SIP requests that don't match any rules defined in the routing table
  
Authentication
  - Support for Digest, client to proxy, and client to registrar authentication
  - Support for Siemens IMS Schema
  
NAT 'friendliness'
  - adds 'received' param, where appropriate, to top-most Via header, and ensures
    that SIP Responses are routed back to that address
    
Database Usage
  - Use of MS Access is optional. If cancelled, the SCS Proxy Service will continue to function as normal.
  - Database usage records merely a copy of current Registrations (i.e. 'written', not 'read').
  
Database Configuration: the following MS Access Database and Driver must be available
  - ODBC Control Panel: User DNS: MS Access Database
  - ODBC Control Panel: Microsoft Access Driver (*.mdb), 4.00.6200.00, ODBCJT32.DLL, 19.06.2003 (or better)
  - supplied Database must be avaiable: filename: 'SCSSipProxy.mdb' (ensure copy is writable)
  - path to database file location: working directory expected; otherwise user will be prompted for location via dialog box

Limitation:
  - Missing support of TCP/TLS
  - Compliant only with SIP URIs
  - Automatically uses the first (i.e. default) Ethernet adapter

The SCS Sip Proxy Service technology is based on and complies to RFC 3261.


INSTALLATION
------------

The SCS Sip Proxy Service needs no real installation. The application
can be started as a standalone application or installed as a NT service.

usage:

 SCSProxy_xx_xx_xx.exe                   Start the application in standalone mode
 
 SCSProxy_xx_xx_xx.exe /CreateService    Register the application as a NT service
 
 SCSProxy_xx_xx_xx.exe /DeleteService    Remove the application from the NT service list


KNOWN ISSUES
-----------

- none


PROBLEMS
--------

Please contact <shaun.baker@siemens.com> to report any
bugs, grammar mistakes or just give your opinion about the Proxy.
Any comments are welcome, especially relating to scenarios where
the Proxy is in use.


SUPPORT 
-------

The SCS Sip Proxy is currently not an official product of Siemens
Switzerland Ltd. We therefore cannot supply any support. Visit the
SCS Sip Proxy and SCS Client homepage <http://www.mysip.ch> for
information and updated versions.



Copyright 2002 Siemens Switzerland Ltd., All rights reserved.
Internet: http://www.mysip.ch
Email: shaun.baker@siemens.com
