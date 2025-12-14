javac -classpath c:\axis-1_1\lib\axis-ant.jar;c:\axis-1_1\lib\axis.jar;c:\axis-1_1\lib\commons-discovery.jar;c:\axis-1_1\lib\commons-logging.jar;c:\axis-1_1\lib\jaxrpc.jar;c:\axis-1_1\lib\log4j-1.2.8.jar;c:\axis-1_1\lib\saaj.jar;c:\axis-1_1\lib\wsdl4j.jar;. WSAgletClient.java
if errorlevel 1 goto end
java -classpath c:\axis-1_1\lib\axis-ant.jar;c:\axis-1_1\lib\axis.jar;c:\axis-1_1\lib\commons-discovery.jar;c:\axis-1_1\lib\commons-logging.jar;c:\axis-1_1\lib\jaxrpc.jar;c:\axis-1_1\lib\log4j-1.2.8.jar;c:\axis-1_1\lib\saaj.jar;c:\axis-1_1\lib\wsdl4j.jar;. WSAgletClient
pause
:end
