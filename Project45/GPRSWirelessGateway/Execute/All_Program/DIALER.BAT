@echo off

if _%1==_ goto DIALER

if %1==h goto HANGUP
if %1==H goto HANGUP
goto SYNTERR

:HANGUP
termin 0x60
echo Connection closed
goto END

:SYNTERR
echo Syntax error, call as DIALER or DIALER H
goto END

:DIALER
epppd
if not errorlevel 0 goto CONNERR
if exist currconn.cfg del currconn.cfg
copy myisp.dat currconn.cfg
echo Connection succesful
goto END

:CONNERR
echo Connection failed...

:END