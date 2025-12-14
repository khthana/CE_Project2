package project.client.palmdaemon;

import java.net.*;
import java.io.*;

public class ServerSocketListener implements Runnable{
	private PalmDaemonImpl daemon;	
	private int usePort;
	protected Thread myThread;
	private int palmID;

	ServerSocket serverSocket = null;
	Socket newClientSocket = null;
	
	ServerSocketListener(PalmDaemonImpl d,int p){
		this.daemon = d;
		this.usePort = p;
		this.palmID = 1;
		//Create Server Socket for listen the request from user
		try { this.serverSocket = new ServerSocket(this.usePort);}
		catch(IOException e){
			System.err.println("DAEMON: error->Could not listen on port: "+this.usePort);
			System.exit(1);
		}
	}

	public void run() {
		while(true){
			Socket clientSocket = null;
			PalmProxy proxy = null;
			try { 
				clientSocket = serverSocket.accept();
			    proxy = new PalmProxy(daemon,clientSocket,palmID);
			    System.out.println("DAEMON: PalmProxy has been created for palm ID "+palmID);
			}
			catch(IOException e){
				System.err.println("DAEMON: Accept Failed");
			}
			//Start thread for maintain client socket connection
			proxy.start();
		    daemon.addClient(palmID,proxy);
		    palmID++;			
		}	
	}
	
	public void start(){
		myThread = new Thread(this);
		myThread.start();
	}
}