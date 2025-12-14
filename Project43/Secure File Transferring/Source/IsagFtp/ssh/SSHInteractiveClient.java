package IsagFtp.ssh;

import java.util.Properties;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.net.UnknownHostException;

import IsagFtp.security.*;
import IsagFtp.ftp.*;


public final class SSHInteractiveClient extends SSHClient
  implements Runnable, SSHInteractor {

  public static final boolean expires  = false;
  public static final boolean licensed = false;

  public static final String licenseMessage = "This copy of isagftp is licensed to ";
  public static final String licensee       = "nobody";

  public static final long validFrom = 965157940452L; // 000801/21:25
  public static final long validTime = (33L * 24L * 60L * 60L * 1000L);

  public static boolean wantHelpInfo       = true;
  public static String  customStartMessage = null;
  public static int    localForwardPort    ; 

  Thread dumbConsoleThread;

  SSHStdIO           sshStdIO;
  SSHPropertyHandler propsHandler;
  sftp               secure;

  public boolean quiet;
  boolean        initQuiet;

  static public class DumbConsoleThread implements Runnable {

	SSHPropertyHandler   prop;
	sftp				 secure;
	int				     localForwardPort;

    public DumbConsoleThread(SSHPropertyHandler prop,int localForwardPort) {

	  this.prop       = prop;
	  this.secure     = new sftp();
	  this.localForwardPort = localForwardPort;
    }

    public void run() {

      String line;
      try {
      secure.connect("127.0.0.1",localForwardPort);
	  secure.setUsername(prop.getUsername());
	  secure.setPassword(prop.getPassword());
	  Thread.sleep(400);
	  secure.Authentication();
	while(true) {
	  secure.userCommand();
	  Thread.sleep(400);
	}
      } catch (Exception e) {
    System.out.println(e.getMessage());
      }
    }
  }

  public static String copyright() {
    return "Copyright (c) 2000-2001 by ISAG";
  }

  public SSHInteractiveClient(boolean quiet, boolean cmdsh, SSHPropertyHandler propsHandler) {
    super(propsHandler, propsHandler);

    this.propsHandler = propsHandler;
    this.interactor   = this; // !!! OUCH

    propsHandler.setInteractor(this);
    propsHandler.setClient(this);

    this.quiet     = quiet;
    this.initQuiet = quiet;

    setConsole(new SSHStdIO());
    sshStdIO = (SSHStdIO)console;
    sshStdIO.setClient(this);


	this.secure = new sftp();
  }

//  public void setMenus(SSHMenuHandler menus) {
//    this.menus = menus;
//  }

  public SSHPropertyHandler getPropertyHandler() {
      return propsHandler;
  }

//  public void updateMenus() {
//    if(menus != null)
//      menus.update();
//  }

  public void printCopyright() {
    console.println(copyright());

    if(licensed) {
	console.println(licenseMessage + licensee);
    }

    if(customStartMessage != null) {
	console.println(customStartMessage);
    }
  }

  void printHelpInfo() {
    if(!wantHelpInfo)
      return;

    if(propsHandler.getSSHHomeDir() != null)
      console.println("isagftp home: " + propsHandler.getSSHHomeDir());

 //   if(sshStdIO.hasCommandShell()) {
 //     console.println("\tpress <ctrl> + 'D' to enter local command shell");
 //     if(isDumb())
//	console.println("\t(...you might have to press ENTER also...)");
 //   }
//    if(menus != null && menus.havePopupMenu) {
//      console.println("\tpress <ctrl> + <mouse-" + menus.getPopupButton() + "> for main-menu");
//    }
    console.println("");
  }

  boolean hasExpired() {
    boolean expired = false;
    long now = System.currentTimeMillis();

    if(licensed)
      return false;

    if(expires) {
      int daysRemaining = (int)((validTime - (now - validFrom)) / (1000L * 60L * 60L * 24L));
      if(daysRemaining <= 0) {
	console.println("This is a demo version of isagftp, it has expired!");
	console.println("Please go to http://www.IsagFtp.se/mindterm/ to get a copy");
	expired = true;
      } else {
	console.println("");
	console.println("This is a demo version of isagftp, it will expire in " + daysRemaining + " days");
	console.println("");
      }
    } else {
      int daysOld = (int)((now - validFrom) / (1000L * 60L * 60L * 24L));
      console.println("");
      console.println("This is a demo version of isagftp, it is " + daysOld + " days old.");
      console.println("Please go to http://www.IsagFtp.se/mindterm/");
      console.println("\tto check for new versions now and then");
      console.println("");
    }
    return expired;
  }


  

  public void run() {

    boolean gotExtMsg;

//    initRandomSeed();

/*    if(NETSCAPE_SECURITY_MODEL) {
      try {
	netscape.security.PrivilegeManager.enablePrivilege("TerminalEmulator");
	console.println("Full network access granted, can do tunneling and connect to any host");
      } catch (netscape.security.ForbiddenTargetException e) {
	console.println("Full network access denied, normal applet security applies");
      }
      console.println("");
    }
*/
 /*   if(hasExpired()) {
      while(true) {
	try {
	  Thread.sleep(100000);
	} catch (InterruptedException e) {
	}
      }
    }
*/
    boolean keepRunning = true;
    while(keepRunning) {      
      gotExtMsg      = false;
      try {
	console.println("");
	printHelpInfo();

	// This starts a connection to the sshd and all the related stuff...
	//
	bootSSH(true);

     


	 startDumbConsole();

   System.out.println("start console...");
	// Join main receiver channel thread and wait for session to end
	//
	controller.waitForExit();

  	stopDumbConsole();

	if(sshStdIO.isConnected()) {
	  // Server died on us without sending disconnect
	  sshStdIO.serverDisconnect("\n\r\n\rServer died or connection lost");
	}

	// !!! Wait for last session to close down entirely (i.e. so
	// disconnected gets a chance to be called...)
	//
	Thread.sleep(1000);

	try {
	    propsHandler.checkSave();
	} catch (IOException e) {
//	    alert("Error saving settings!");
	}

      } catch(SSHClient.AuthFailException e) {
	console.println("");
	console.println(e.getMessage());
	propsHandler.clearPasswords();

      } catch(SSHStdIO.CtrlDPressedException e) {

      } catch(SSHStdIO.SSHExternalMessage e) {
	gotExtMsg = true;
	console.println("");
	console.println(e.getMessage());

      } catch(UnknownHostException e) {
	  String host = e.getMessage();
	  if(propsHandler.getProperty("proxytype").equals("none")) {
	      console.println("Unknown host: " + host);
	  } else {
	      console.println("Unknown proxy host: " + host);
	  }
	  propsHandler.clearServerSetting();

      } catch(FileNotFoundException e) {
	console.println("File not found: " + e.getMessage());

      } catch(Exception e) {
	String msg = e.getMessage();
	if(msg == null || msg.trim().length() == 0)
	  msg = e.toString();
	console.println("");
	console.println("Error connecting to " + propsHandler.getProperty("server") + ", reason:");
	console.println("-> " + msg+"(Maybe hasn't secure shell on "+propsHandler.getProperty("server")+")");
	console.println("Switch to normal FTP");
	console.println("Warning : insecure Mode.");
    try
	{
    sftp sec = new sftp();
    String remoteHost=propsHandler.getProperty("server");
	String user = promptLine(remoteHost+" login: ",null);
	sec.prompt = "insecure FTP> ";
	sec.connect(remoteHost,21);
    sec.setUsername(user);
	sec.setPassword(promptPassword(user+"@"+remoteHost+"\'s password: "));	
	sec.Authentication();
	while(true) {
	//  line = console.promptLine("", "", false);
	//  stdinPdu = new SSHPduOutputStream(SSH.CMSG_STDIN_DATA, console.sndCipher);
	//  stdinPdu.writeString(line + "\n");
	//  controller.transmit(stdinPdu);
	   sec.userCommand();
	//  Thread.sleep(400);
	}
	}
	catch (IOException ex) { System.out.println(ex.getMessage());}


	if(SSH.DEBUGMORE) {
	  System.out.println("If an error occured, please send the below stacktrace to s0010058@ce.kmitl.ac.th");
	  e.printStackTrace();
	}

      } catch(ThreadDeath death) {
	if(controller != null)
	  controller.killAll();
	controller = null;
	throw death;
      }

      propsHandler.passivateProperties();
      activateTunnels = true;
      propsHandler.currentPropsFile = null;

      if(!propsHandler.savePasswords || usedOTP) {
	  propsHandler.clearPasswords();
      }

      if(!gotExtMsg) {
	  if(!propsHandler.autoLoadProps) {
	      propsHandler.clearPasswords();
	      initQuiet = false;
	  }
	  quiet = false;
      }

      controller = null;

  //    TerminalWin t = getTerminalWin();
  //    if(t != null)
//	t.setTitle(null);

    }
  }

  public boolean isDumb() {
    return (console.getTerminal() == null);
  }

 // public TerminalWin getTerminalWin() {
 //   Terminal term = console.getTerminal();
 //   if(term != null && term instanceof TerminalWin)
 //     return (TerminalWin)term;
 //   return null;
 // }

  public void startDumbConsole() {
    Runnable dumbConsole = new DumbConsoleThread(propsHandler,super.localForwardPort);
    dumbConsoleThread = new Thread(dumbConsole);
    dumbConsoleThread.start();
  }
  public void stopDumbConsole() {
    dumbConsoleThread.stop();
  }

  public void updateTitle() {
    sshStdIO.updateTitle();
  }

  //
  // SSHInteractor interface
  //
//  public void propsStateChanged(SSHPropertyHandler props) {
//      updateMenus();
//  }

  public void startNewSession(SSHClient client) {
      // !!! REMOVE
      // Here we can have a login-dialog with proxy-info also (or configurable more than one method)
      // !!!
  }

  public void sessionStarted(SSHClient client) {
      quiet = initQuiet;
  }

//  public boolean quietPrompts() {
//      return (commandLine != null || quiet);
//  }

  public boolean isVerbose() {
      return wantHelpInfo;
  }

  public String promptLine(String prompt, String defaultVal) throws IOException {
    return sshStdIO.promptLine(prompt, defaultVal, false);
  }

  public String promptPassword(String prompt) throws IOException {
      return sshStdIO.promptLine(prompt, "", true);
  }

//  public boolean askConfirmation(String message, boolean defAnswer) {
//    boolean confirm = false;
//    try {
//      confirm = askConfirmation(message, true, defAnswer);
//    } catch (IOException e) {
	// !!!
 //   }
 //   return confirm;
 // }

//  public boolean askConfirmation(String message, boolean preferDialog, boolean defAnswer) throws IOException {
//    boolean confirm = false;
//    if(menus != null && preferDialog) {
//      confirm = menus.confirmDialog(message, defAnswer);
//    } else {
//     /* String answer = promptLine(message + (defAnswer ? " ([yes]/no) " : "(yes/[no]) "), "");
//      if(answer.equalsIgnoreCase("yes") || answer.equals("y")) {
//	confirm = true;
//      } else if(answer.equals("")) {
//	confirm = defAnswer;
 //     }  */
	//  confirm = true;
   // }
   // return confirm;
//  }

  public void connected(SSHClient client) {
//      updateMenus();
      if(wantHelpInfo) {
	  console.println("Connected to server running " + srvVersionStr);
//	  if(sshStdIO.hasCommandShell())
//	      console.println("(command shell escape-sequence is '" + sshStdIO.commandShell.escapeString() + "')");
//	  console.println("");
      }
  }

  public void open(SSHClient client) {
//      updateMenus();
//      updateTitle();
  }

  public void disconnected(SSHClient client, boolean graceful) {
      sshStdIO.breakPromptLine("Login aborted by user");
  //    updateMenus();
   //   updateTitle();
  }

  public void report(String msg) {
      console.println(msg);
      console.println("");
  }

//  public void alert(String msg) {
//      if(menus != null) {
//	  if(msg.length() < 35)
//	      menus.alertDialog(msg);
//	  else
//	      menus.textDialog("isagftp - Alert", msg, 4, 38, true);
  //    } else {
	//  report(msg);
     // }
 // }

}
