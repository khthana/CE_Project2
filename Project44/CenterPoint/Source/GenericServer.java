import java.io.*;
import java.net.*;
import java.util.Hashtable;

public class GenericServer extends Thread {
	protected ServerSocket server;
	protected Hashtable routes;
	
	public GenericServer (int port) throws IOException {
		super ("GenericServer");
		server = new ServerSocket (port);
		routes = new Hashtable ();
	}
	
	public void run () {
		try {
			while (!Thread.interrupted ()) {
				Socket socket = server.accept ();
				System.out.println ("Accepted from " + socket.getInetAddress ());
				GenericHandler handler = new GenericHandler
					(routes, socket.getInputStream (), socket.getOutputStream ());
				handler.start ();
			}
		} catch (IOException ex) {
			ex.printStackTrace ();
		}
	}
	
	public static void main (String[] args) throws IOException {		
		GenericServer server = new GenericServer (6667);
		server.start ();
	}
}
