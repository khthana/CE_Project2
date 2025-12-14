package IsagFtp.application;

import java.io.*;
import java.util.NoSuchElementException;
import java.util.Properties;
import java.util.Hashtable;
import java.util.Enumeration;

import IsagFtp.ssh.*;
import IsagFtp.security.*;

public class IsagFTP implements Runnable {

  static Properties paramTermProps = new Properties();
  static Properties paramSSHProps  = new Properties();

  public static String javaVersion = "<unknown>";
  public static String javaVendor  = "<unknown>";
  public static String osName      = "<unknown>";
  public static String osArch      = "<unknown>";
  public static String osVersion   = "<unknown>";

  SSHInteractiveClient client;
  SSHInteractiveClient sshClone;
  SSHStdIO             console;
  Thread               clientThread;

  Properties sshProps;
  Properties termProps;

  String[]   cmdLineArgs;

  String  commandLine = null;
  String  sshHomeDir  = null;
  String  propsFile   = null;

  boolean usePopMenu = false;
  boolean haveMenus  = true;
  boolean haveGUI    = false;
  boolean cmdsh      = false;
  boolean quiet      = true;
  int     firstArg     = 0;

  boolean autoSaveProps = true;
  boolean autoLoadProps = true;

  static Hashtable terminals = new Hashtable();


  public IsagFTP() {
    super();
    this.sshProps  = paramSSHProps;
    this.termProps = paramTermProps;
  }

  public IsagFTP(Properties sshProps, Properties termProps) {
    this.sshProps  = sshProps;
    this.termProps = termProps;
  }

  public static void main(String[] argv) {
    IsagFTP controller    = new IsagFTP(paramSSHProps, paramTermProps);
    controller.cmdLineArgs = argv;
    
    try {
      controller.getApplicationParams();
    } catch (Exception e) {
	System.out.println("Error: " + e.getMessage());
	System.exit(1);
    }

    try {
      controller.run();
    } catch (Exception e) {
      System.out.println("Error, please mail below stack-trace to s0010058@ce.kmitl.ac.th");
      e.printStackTrace();
    }
  }


  public void run() {
    try {

	  SSHPropertyHandler propsHandler = new SSHPropertyHandler(sshProps);	 

	  client = new SSHInteractiveClient(quiet, cmdsh, propsHandler);
      
	  console = (SSHStdIO)client.getConsole();
   
      client.printCopyright();

      client.getPropertyHandler().setSSHHomeDir(sshHomeDir);
      client.getPropertyHandler().setAutoSaveProps(autoLoadProps);
      client.getPropertyHandler().setAutoLoadProps(autoSaveProps);
	try {
	  clientThread = new Thread(client);
	  clientThread.start();
	  clientThread.join();
	} catch(InterruptedException e) {
	  // !!!
	}
      

    } catch (IllegalArgumentException ae) {
      System.out.println(ae.getMessage());
    } catch (Exception e) {
      System.out.println("Error: " + e.getMessage());
      if(SSH.DEBUGMORE) {
	System.out.println("Please send the below stack-trace to s0010058@ce.kmitl.ac.th");
	e.printStackTrace();
      }
    }

  }

  
  public void getApplicationParams() throws Exception {
    String    name;
    String    value;
    int       numOfOpts;
    int       i;

    // First we check the IsagFTP options (i.e. not the ssh/terminal-properties)
    //
    try {
      for(i = 0; i < cmdLineArgs.length; i++) {
	String arg = cmdLineArgs[i];
	if(!arg.startsWith("--"))
	  break;
	switch(arg.charAt(2)) {
	case '?':
	  printHelp();
	  System.exit(0);
	default:
	  throw new Exception("unknown parameter '" + arg + "'");
	}
      }
    } catch (Exception e) {
      //printHelp();
      throw e;
    }

    getDefaultParams();

    numOfOpts = i;
    for(i = numOfOpts; i < cmdLineArgs.length; i += 2) {
      name = cmdLineArgs[i];
      if((name.charAt(0) != '-') || ((i + 1) == cmdLineArgs.length))
	break;
      name  = name.substring(1);
      value = cmdLineArgs[i + 1];
      if(SSHPropertyHandler.isProperty(name))
	paramSSHProps.put(name, value);
      else
	System.out.println("Unknown property '" + name + "'");
    }

    if(i < cmdLineArgs.length) {
      firstArg = i;
      commandLine = "";
      for(; i < cmdLineArgs.length; i++) {
	commandLine += cmdLineArgs[i] + " ";
      }
      commandLine = commandLine.trim();
    }
  }

  void printHelp() {
    System.out.println("usage: java IsagFtp.application.IsagFTP [options]");
    System.out.println("Options:");
	  System.out.println("   -server <servername>");
	  System.out.println("   -usrname <user name>");
	  System.out.println("   -cipher <idea|des|3des|rc4|blowfish>");
      System.out.println("   --?       Help; display this help.");
  }


  void getDefaultParams() {
    try {
      if(sshHomeDir == null) {
	String hDir = System.getProperty("user.home");
	if(hDir == null)
	  hDir = System.getProperty("user.dir");
	if(hDir == null)
	  hDir = System.getProperty("java.home");
	sshHomeDir = (hDir + File.separator + "Isagftp" + File.separator);
      }
    } catch (Throwable t) {
      // !!!
    }
  
    try {
      if(!quiet)
	paramSSHProps.put("usrname", System.getProperty("user.name", ""));
    } catch (Throwable t) {
      // !!!
    }
    try {
      javaVersion = System.getProperty("java.version");
      javaVendor  = System.getProperty("java.vendor");
      osName      = System.getProperty("os.name");
      osArch      = System.getProperty("os.arch");
      osVersion   = System.getProperty("os.version");
    } catch (Throwable t) {
      // !!!
    }

  }



}

