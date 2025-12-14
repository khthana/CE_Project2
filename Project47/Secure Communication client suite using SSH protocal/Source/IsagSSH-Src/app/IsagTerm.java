
package app;

import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.Socket;

import java.awt.*;
import java.awt.event.*;

import jca.security.SecureRandom;

import ssh2.SSH2Transport;
import ssh2.SSH2SimpleClient;
import ssh2.SSH2ConsoleRemote;
import ssh2.SSH2Preferences;
import ssh2.SSH2TerminalAdapterImpl;
import ssh2.SSH2StreamFilterFactory;
import ssh2.SSH2StreamSniffer;
import ssh2.SSH2FTPProxyFilter;
import ssh2.SSH2HostKeyVerifier;

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

public final class IsagTerm extends WindowAdapter
    implements TerminalMenuListener, Runnable
{
    private Frame              frame;
    private TerminalWin        terminal;
    private SSH2Transport      transport;
    private SSH2SimpleClient   client;
    private SSH2ConsoleRemote  console;
    private Properties         props;
    private LineReaderTerminal lineReader;
    private int                exitStatus;
    private String             host;
   	private int    				port;
   	private String 				username;
   	private String				password;
    private String 				title = "IsagTerm2547";

    /**
     * @param prompt SSH2 protocol properties.
     */
    public IsagTerm(Properties props){//,String host,int port,String username,String password) {
	this.props      = props;
	this.exitStatus = 1;
    }

 
     
    public void run() {
	try {
	    

	  

	    frame =  new Frame();
	    terminal = new TerminalWin(frame, new TerminalXTerm(), props);

	    RandomSeed seed = new RandomSeed();
	    seed.addEntropyGenerator(terminal);

	    frame.setLayout(new BorderLayout());
	    frame.add(terminal.getPanelWithScrollbar(), BorderLayout.CENTER);

	    TerminalFrameTitle frameTitle =
		new TerminalFrameTitle(frame, getTitle());
	    frameTitle.attach(terminal);

	   
	    frame.addWindowListener(this);

	    frame.pack();
	    frame.show();

	    lineReader = new LineReaderTerminal(terminal);
	
	   	//terminal.write("\n\r");
	   	terminal.write("\n\r");
		terminal.write("\tIsagTerm2547");
		terminal.write("\n\r");
		//terminal.write("\n\r");
		
	    	
	    host = props.getProperty("server");
	    port = getPort(props.getProperty("port"));
	    username = props.getProperty("username");

	    if(host == null) {
		host = lineReader.promptLine("\r\nssh2 server[:port]: ",
					     null, false);
	    }

	    int i = host.indexOf(':');
	    if(i != -1) {
		port = getPort(host.substring(i + 1));
		host = host.substring(0, i);
	    }

	    if(username == null) {
		username = lineReader.promptLine(host + " login: ", null, false);
	    }

	    SSH2Preferences prefs = new SSH2Preferences(props);
	    //prefs.setPreference(SSH2Preferences.CIPHERS_C2S, "blowfish-cbc");
	    //prefs.setPreference(SSH2Preferences.CIPHERS_S2C, "blowfish-cbc");

	    
	    SecureRandomAndPad secureRandom = new SecureRandomAndPad(new
		SecureRandom(seed.getBytesBlocking(20, false)));

	    /*
	     * Open the TCP connection to the server and create the
	     * SSH2Transort object. No traffic will be sent yet.
	     */
	    transport = new SSH2Transport(new Socket(host, port), prefs,
					  secureRandom);

	    
	    String fingerprint = props.getProperty("fingerprint." +
						   host + "." + port);

	    if(fingerprint != null) {
		transport.setEventHandler(new SSH2HostKeyVerifier(fingerprint));
	    }

	    client = null;

	    
	    String auth = props.getProperty("auth-method");
	    if("publickey".equals(auth)) {
		String keyFile   = props.getProperty("private-key");
		String keyPasswd = props.getProperty("passphrase");
		client = new SSH2SimpleClient(transport, username, keyFile,
					      keyPasswd);
	    } else {
		String password = props.getProperty("password");
		//System.out.print(password);
		if(password ==  null) {
		    password = lineReader.promptLine(username + "@" + host +
						   "'s password: ", null, true);
		}
		client = new SSH2SimpleClient(transport, username, password);
	    }

	    // This class will not interact with the user anymore.
	    lineReader.detach();

	    // Start any portforwards defined in the preferences.
	    //startForwards();

	    /*
	     * Create the remote console to use for command execution.
	     */
	    console = new SSH2ConsoleRemote(client.getConnection());

	    SSH2TerminalAdapterImpl termAdapter =
		new SSH2TerminalAdapterImpl(terminal);

	    if(!console.terminal(termAdapter)) {
		throw new Exception("Couldn't start terminal!");
	    }

	    exitStatus = console.waitForExitStatus();

	} catch (LineReaderTerminal.ExternalMessageException e) {
	    // ignore
	} catch (Exception e) {
	    System.out.println("An error occured: " + e.getMessage());
	} finally {
	    if(frame != null) {
		frame.dispose();
	    }
	}
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
/*
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

	    IsagTerm ssh2 = new IsagTerm(props);
		ssh2.run();
		System.exit(ssh2.getExitStatus());
    }
*/

}
