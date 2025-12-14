rem SET CLASSPATH for compile
set classpath=c:\aglets-2.0.2\public
cd \aglets-2.0.2\public
rem COMPILE
del SimpleAglet.class
javac -classpath c:\aglets-2.0.2\public;c:\aglets-2.0.2\lib\aglets-2.0.2.jar c:\aglets-2.0.2\public\SimpleAglet.java
cd testAglet
rem del AgletRMIServerImpl*.class
javac -classpath c:\aglets-2.0.2\public;c:\aglets-2.0.2\lib\aglets-2.0.2.jar c:\aglets-2.0.2\public\testAglet\AgletRMIServerImpl.java
rem START RMI REGISTRY
start rmiregistry
rem RUN
java -Djava.security.policy=policy.all -classpath c:\aglets-2.0.2\public;c:\aglets-2.0.2\lib\aglets-2.0.2.jar testAglet.AgletRMIServerImpl
