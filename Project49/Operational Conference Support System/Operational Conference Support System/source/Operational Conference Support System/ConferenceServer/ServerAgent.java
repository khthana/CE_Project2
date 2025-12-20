import java.net.*;
import java.util.*;
import java.io.*;

public class ServerAgent extends Thread {
  	private ServerSocket server;
  	private Socket sock;
  	private int numberclient = 1;
  	private Vector clients = new Vector();
  	// Constructer
  	public ServerAgent() {
    	try { server = new ServerSocket(6213); }
    	catch (IOException e) { e.printStackTrace(); }
  	}
  	// get information to main thread
  	public String getInformation() {
    	String tmp = "";
    	try {
      	InetAddress host = InetAddress.getLocalHost();
      	tmp = "   ชื่อเซิร์ฟเวอร์ :: " + host.getHostName().toString() + "\n";
      	tmp += "   IP Address ของเซิร์ฟเวอร์:: " + host.getHostAddress().toString();
    	} catch(Exception e) {}
    	return tmp;
  	}
  	// main method for thread
  	public void run() {
    	try {
      	ConferenceServer.setLogMessage("รอคอยการเข้าใช้งานของผู้ใช้.....");
      	while(numberclient < 20) {
        		sock = server.accept();
        		ServerThread c = new ServerThread(sock,clients);
        		synchronized (clients) {
          	clients.addElement(c);
          	c.start();
        		}
      	}
    	} catch (Exception e) { e.printStackTrace(); }
  	}
  	// return vector to main class
} //End of class