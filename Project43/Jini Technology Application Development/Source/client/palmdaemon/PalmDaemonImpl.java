package project.client.palmdaemon;

import project.common.*;

import java.io.*;
import java.net.*;
import java.rmi.*;
import java.rmi.activation.*;
import java.rmi.server.*;
import java.util.*;
import net.jini.discovery.*;
import net.jini.core.lookup.*;

public class PalmDaemonImpl{
	private Hashtable palms = new Hashtable();
	private static int port;
		
	public static void main(String[] args){

		if (args.length <1){
			System.err.println("DAEMON: error->main(): Please Specify port number");
			System.exit(0);
		}
		port = Integer.parseInt(args[0]);
		PalmDaemonImpl daemon = new PalmDaemonImpl();
        ServerSocketListener serverSocketListener = new ServerSocketListener(daemon,port);
        serverSocketListener.start();
		System.out.println("PalmDaemon V1.0 Starting Complete");
	}
    
    public void removeClient(int id){
        PalmProxy tempProxy = (PalmProxy)palms.get(new Integer(id));
        tempProxy.stop();
        tempProxy = null;
        palms.remove(new Integer(id));
    }
    
    public void addClient(int id,PalmProxy proxy){
        this.palms.put(new Integer(id), proxy);
    }
}