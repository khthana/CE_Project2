c:
cd \aglets-2.0.2\public\testAglet
javac -classpath c:\aglets-2.0.2\public;c:\aglets-2.0.2\lib\aglets-2.0.2.jar AgletRMIClientmain.java
java -Djava.security.policy=policy.all -classpath c:\aglets-2.0.2\public;c:\aglets-2.0.2\lib\aglets-2.0.2.jar testAglet.AgletRMIClientmain
