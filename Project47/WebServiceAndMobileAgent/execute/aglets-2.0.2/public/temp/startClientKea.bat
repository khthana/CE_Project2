@echo off
del *.java~*
del *.class
rem set _tempClassPath=C:/aglets-2.0.2/public
rem set _tempClassPath=%USERPROFILE%/jbproject/mobileagent/classes;testAglet
rem set CLASSPATH=%_tempClassPath%;.
rem set AGLET_EXPORT_PATH=%_tempClassPath%
javac -classpath "%USERPROFILE%/jbproject/mobileagent/classes;." AgletRMIClientKea.java
if not errorlevel 1 invokeClientKea.bat
pause