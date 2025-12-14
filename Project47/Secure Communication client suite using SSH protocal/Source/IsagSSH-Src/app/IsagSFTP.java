
package app;

import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.Socket;

import java.awt.*;
import java.awt.event.*;

import jca.security.SecureRandom;

import ssh2.SSH2Transport;
import ssh2.SSH2SimpleSFTPShell;
import ssh2.SSH2ConsoleRemote;
import ssh2.SSH2Preferences;
import ssh2.SSH2Connection;
import ssh2.SSH2TerminalAdapterImpl;
import ssh2.SSH2StreamFilterFactory;
import ssh2.SSH2StreamSniffer;
import ssh2.SSH2FTPProxyFilter;
import ssh2.SSH2HostKeyVerifier;
import ssh2.SSH2AuthModule;
import ssh2.SSH2Authenticator;
import ssh2.SSH2AuthPassword;
import ssh2.SSH2FatalException;
import ssh2.*;
import terminal.TerminalWin;
import terminal.TerminalXTerm;
import terminal.TerminalFrameTitle;
import terminal.TerminalMenuHandler;
import terminal.TerminalMenuListener;
import terminal.LineReaderTerminal;
import terminal.GlobalClipboard;

import gui.AWTConvenience;

import util.SecureRandomAndPad;
import util.RandomSeed;

public final class IsagSFTP extends WindowAdapter
    implements TerminalMenuListener, Runnable
{
    private Frame              frame;
    private TerminalWin        terminal;
    private SSH2Transport      transport;
    private SSH2Connection	   connection;
    private SSH2SimpleSFTPShell   client;
    private SSH2ConsoleRemote  console;
    private Properties         props;
    private LineReaderTerminal lineReader;
    private int                exitStatus;
    private String             host;
   	private int    				port=22;
   	private String 				username;
   	private String				password;
    private String 				title = "IsagSFTP2547";
	
    /**
     * @param prompt SSH2 protocol properties.
     */
    public IsagSFTP(Properties props){//,String host,int port,String username,String password) {
	this.props      = props;
	
	//this.transport= transport;
	//this.host = host;
//	this.port = port;
//	this.username = username;
//	this.password = password;
	this.exitStatus = 1;
    }


     
	public void run() {
		try {

			
	    
	    	frame = new Frame();
			terminal = new TerminalWin(frame, new TerminalXTerm(),props);
			RandomSeed seed = new RandomSeed();
	    	seed.addEntropyGenerator(terminal);		


	    	frame.setLayout(new BorderLayout());
	    	frame.add(terminal.getPanelWithScrollbar(), BorderLayout.CENTER);

	    	TerminalFrameTitle frameTitle =	new TerminalFrameTitle(frame, getTitle());
	    	frameTitle.attach(terminal);

	    	//terminal.write("\n\r");
	    	terminal.write("\n\r");
			terminal.write("\tIsagSFTP2547");
		   	terminal.write("\n\r");
	    	//terminal.write("\n\r");
	    	
	    	
	    	frame.addWindowListener(this);

	    	frame.pack();
	    	frame.show();

	   	 	lineReader = new LineReaderTerminal(terminal);

			//System.out.println(props.toString());
		    host = props.getProperty("server");
		    //port = getPort(props.getProperty("port"));
		    username = props.getProperty("username");
		    //System.out.println(host+" "+username);
		    if(host == null) {
			host = lineReader.promptLine("\r\nsftp server : ",
						     null, false);
		    }
	
		    if(username == null) {
			username = lineReader.promptLine(host + " login: ", null, false);
		    }
		
		    password = lineReader.promptLine(username + "@" + host +
						   "'s password: ", null, true);
	
		    SSH2Preferences prefs = new SSH2Preferences(props);


			SecureRandomAndPad secureRandom = new SecureRandomAndPad(new SecureRandom(seed.getBytesBlocking(20, false)));
			Socket socket  = new Socket(host, port);
			SSH2Transport transport =   new SSH2Transport(socket, prefs ,secureRandom);
			
			initsftp(transport, username, new SSH2AuthPassword(password));      
			client = new SSH2SimpleSFTPShell(connection, title);
	    	frame.setVisible(false);
	    	// This class will not interact with the user anymore.
		    lineReader.detach();
	
		    // Start any portforwards defined in the preferences.
		    //startForwards();
	
		    ///*
		     // Create the remote console to use for command execution.
		    ////
		    console = new SSH2ConsoleRemote(connection);
	
		    SSH2TerminalAdapterImpl termAdapter =	new SSH2TerminalAdapterImpl(terminal);

	    	if(!console.terminal(termAdapter)) {
				throw new Exception("Couldn't start terminal!");
	    	}

	    	exitStatus = console.waitForExitStatus();

		} catch (LineReaderTerminal.ExternalMessageException e) {
	    	// ignore
		} catch (Exception e) {
	    	System.out.println("An error occured: " + e.getMessage()); 
	    }
		finally {
	    	if(frame != null) {
				//frame.dispose();
	    	}
		}
	}
    

    private void initsftp(SSH2Transport transport,
		      String username, SSH2AuthModule authModule)
	throws SSH2Exception
    {
	SSH2Authenticator authenticator = new SSH2Authenticator(username);
	authenticator.addModule(authModule);
	initsftp(transport, authenticator);
    }

   
    
    private void initsftp(SSH2Transport transport, SSH2Authenticator authenticator)
	throws SSH2Exception
    {
	this.transport = transport;

	transport.boot();

	if(!transport.waitForKEXComplete()) {
	    throw new SSH2FatalException("Key exchange failed: " +
					 transport.getDisconnectMessage());
	}

	SSH2UserAuth userAuth = new SSH2UserAuth(transport, authenticator);
	if(!userAuth.authenticateUser("ssh-connection")) {
	    throw new SSH2FatalException("Permission denied");
	}

	connection = new SSH2Connection(userAuth, transport);
	transport.setConnection(connection);
	authenticator.clearSensitiveData();

	int alive = transport.getOurPreferences().getIntPreference("alive");
	transport.enableKeepAlive(alive);
    }
    
 	public int getExitStatus() {
		return exitStatus;
    }
    //Get the port number, Defaults to 22
    private static int getPort(String port) 
    {
		int p;
		try {
		    p = Integer.parseInt(port);
		} catch (Exception e) {
		    p = 22;
		}
		return p;
    }
    
    private String getTitle() {
		return title;
    }
    
 
    public void windowClosing(WindowEvent e) {
		doClose();
    }

    public void close(TerminalMenuHandler originMenu) {
		doClose();
    }

    public void doClose() {
		if(lineReader != null) {
		    lineReader.breakPromptLine("");
		}
		if(console != null) {
		    console.close();
		}
		if(transport != null) {
		    transport.normalDisconnect("User disconnects");
		}
    }

    public void update() {
    }
///*
    public static void main(String[] argv) {
		Properties props = new Properties();
		if(argv.length > 0) {
		    String propsFile = argv[0];
		    try {
			props.load(new FileInputStream(propsFile));
		    } catch (Exception e) {
			System.out.println("Error loading properties: " +  e.getMessage());
		    }
		}

	    IsagSFTP ssh2 = new IsagSFTP(props);
		ssh2.run();
		System.exit(ssh2.getExitStatus());
    }
//*/

}
