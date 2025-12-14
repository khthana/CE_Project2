del *.java~*
del *.class
set classpath=.;C:\Docume~1\KTACK\jbproject\mobileagent\classes;C:\aglets-2.0.2\lib\aglets-2.0.2.jar
cd ..
call compile.bat
cd temp
javac SendingSMS.java
if not errorlevel 1 java SendingSMS
pause