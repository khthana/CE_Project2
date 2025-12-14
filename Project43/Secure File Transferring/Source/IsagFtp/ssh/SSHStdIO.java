package IsagFtp.ssh;

import java.io.*;
import java.awt.*;
import java.awt.datatransfer.*;

import IsagFtp.terminal.*;
import IsagFtp.security.*;

public final class SSHStdIO implements TerminalListener,  SSHConsole {

  static public class CtrlDPressedException extends IOException {
  }

  static public class SSHExternalMessage extends IOException {
    public SSHExternalMessage(String msg) {
      super(msg);
    }
  }

  static Toolkit toolkit;
  BufferedReader br;


  Container            ownerContainer;
  SSHChannelController controller;
  SSHInteractiveClient client;
  //
  // !!! Changed this to TerminalWin instead of Terminal, we were
  // almost asuming it anyway (theoretical performance gain too! :-)
  //
  Terminal             term;

  Cipher               sndCipher;
  String               ownerName;

  boolean              selectionAvailable = false;

  boolean              escapeForced = false;

  Boolean readLineLock;
  boolean pressedCtrlD;
  boolean isReadingLine;
  boolean echoStar;
  String  readLineStr;

  protected boolean isConnected;

  // The clipboard now is shared with all instances
  //
  static Clipboard localClipboard = null;

  public SSHStdIO() {
    this.readLineLock   = new Boolean(false);
    this.controller     = null;
    this.sndCipher      = null;
    this.isConnected    = false;

  }

  public boolean isConnected() {
    return isConnected;
  }

  public void setTerminal(TerminalWin term) {
    this.term = term;
    if(term != null) {
	  System.out.println("setTerminal : term !=null");
      term.addTerminalListener(this);
    }
  }

  public void setClient(SSHInteractiveClient client) {
    this.client = client;
  }

  public void setOwnerContainer(Container ownerContainer) {
    this.ownerContainer = ownerContainer;
    if(toolkit == null)
	toolkit = Toolkit.getDefaultToolkit();
  }

  public void setOwnerName(String ownerName) {
    this.ownerName = ownerName;
  }




  public void wantCommandShell() {
    escapeForced = true;
  }

  SSHExternalMessage extMsg = null;
  public void breakPromptLine(String msg) {
    if(isReadingLine) {
      synchronized(readLineLock) {
	extMsg = new SSHExternalMessage(msg);
	readLineLock.notify();
      }
    }
  }

  public String readLine(String defaultVal) {
    synchronized(readLineLock) {
      if(defaultVal != null) {
	readLineStr   = defaultVal;
	term.write(defaultVal);
      } else {
	readLineStr   = "";
      }
      isReadingLine = true;
      try {
	readLineLock.wait();
      } catch (InterruptedException e) {
	// !!!
      }
      isReadingLine = false;
    }
    return readLineStr;
  }

  public String promptLine(String prompt, String defaultVal, boolean echoStar) throws IOException {
    String line = null;
    pressedCtrlD = false;
	  br = new BufferedReader(new InputStreamReader(System.in));
      System.out.print(prompt);
      line = br.readLine();
	 
      // !!! kludge, winlost doesn't give empty input with ^D, this is a kludgy thing
      //  anyway since we're not sure that ^D is EOF in the shell...
      //
      if(line == null || (line.length() > 0 && line.charAt(0) == (char)4))
	pressedCtrlD = true;
  //  }
    if(extMsg != null) {
      SSHExternalMessage msg = extMsg;
      extMsg = null;
      throw msg;
    }

    
	return line;
  }

  public void updateTitle() {
    int rows = 0;
    int cols = 0;

    if(term == null || ownerContainer == null)
      return;

    String title = null;


    if(title == null) {


	if(client.isOpened()) {
	    title = client.propsHandler.getProperty("usrname");
	    title += "@" + client.propsHandler.getProperty("server");
	    title += " <" + client.getServerVersion() + ">";
	} else {
	    title = ownerName;
	}

	title += " [" + cols + "x" + rows + "]";

	if(!client.activateTunnels) {
	    title += " (CLONE)";
	}
    }

    if(ownerContainer instanceof Frame)
      ((Frame)ownerContainer).setTitle(title);
  }

  // SSHConsole interface
  //
  public Terminal getTerminal() {
    return term;
  }
  public void stdoutWriteString(byte[] str) {
    if(isConnected)
      print(new String(str));
  }
  public void stderrWriteString(byte[] str) {
    if(isConnected)
      print(new String(str));
  }
  public void print(String str) {
    if(term != null) {
      term.write(str);
    } else {
      System.out.print(str);
    }
  }
  public void println(String str) {
    if(term != null) {
      term.write(str + "\n\r");
    } else {
      System.out.println(str);
    }
  }
  public void serverConnect(SSHChannelController controller, Cipher sndCipher) {
    this.controller  = controller;
    this.sndCipher   = sndCipher;
    isConnected      = true;
  }
  public void serverDisconnect(String reason) {
    this.controller  = null;
    this.sndCipher   = null;
    isConnected      = false;
    println(reason);
  }

  // TerminalListener interface
  //
  public void typedChar(char c) throws IOException {
    if(isConnected) {

	client.stdinWriteChar(c);
      
    } else {
      synchronized(readLineLock) {
	if(isReadingLine) {
          if(c == (char)4 ) {
	    // !!! We are not interested in ctrl-d for other things than entering the command-shell
	    // Pressed ctrl-d
	    pressedCtrlD = true;
	    readLineLock.notify();
	  } else if(c == (char)127 || c == (char)0x08) {
	    if(readLineStr.length() > 0) {
		boolean ctrlChar = false;
		if(readLineStr.charAt(readLineStr.length() - 1) < ' ') {
		    ctrlChar = true;
		}
	      readLineStr = readLineStr.substring(0, readLineStr.length() - 1);
	      term.write((char)8);
	      if(ctrlChar) term.write((char)8);
	      term.write(' ');
	      if(ctrlChar) term.write(' ');
	      term.write((char)8);
	      if(ctrlChar) term.write((char)8);
	    } else
	      term.doBell();
	  } else if(c == '\r') {
	    //	    readLineStr = readLineStr + "\r";
	    readLineLock.notify();
	    term.write("\n\r");
	  } else {
	    readLineStr = readLineStr + c;
	    if(echoStar)
	      term.write('*');
	    else
	      term.write(c);
	  }
	}
      }
    }
  }
  public void sendBytes(byte[] b) throws IOException {
    if(isConnected) {
      client.stdinWriteString(b);
    } else {
      for(int i = 0; i < b.length; i++)
	typedChar((char)b[i]);
    }
  }
  public void signalWindowChanged(int rows, int cols, int vpixels, int hpixels) {
    if(isConnected) {
      client.signalWindowChanged(rows, cols, vpixels, hpixels);
    } else {
      // !!!
    }
    updateTitle();
  }
  public void setSelection(String selection) {
    Clipboard cb = getClipboard();
    if(cb == null || term == null)
      return;
    if(selection == null)
      selection = "";
    StringSelection sl = new StringSelection(selection);
    cb.setContents(sl, sl);
  }
  public String getSelection() {
    Clipboard cb = getClipboard();
    String    sl = null;
    if(cb == null || term == null)
      return sl;
    Transferable t = cb.getContents(this);
    if(t != null) {
      try {
	sl = (String) t.getTransferData(DataFlavor.stringFlavor);
      } catch (Exception e) {
        try {
	  toolkit.beep();
	} catch (Throwable ee) {
	  // !!! Could not beep, we are probably an unpriviliged applet
	}
      }
    } else
      try {
        toolkit.beep();
      } catch (Throwable e) {
	// !!! Could not beep, we are probably an unpriviliged applet
      }
    return sl;
  }
  public void selectionAvailable(boolean val) {
    selectionAvailable = val;
  }

  static synchronized Clipboard getClipboard() {
    if(SSH.NETSCAPE_SECURITY_MODEL) {
/*      try {
	netscape.security.PrivilegeManager.enablePrivilege("UniversalSystemClipboardAccess");
      } catch (netscape.security.ForbiddenTargetException e) {
	// !!!
      }
	  */
    }

    Clipboard cb;
    if(localClipboard == null) {
      try {
	cb = toolkit.getSystemClipboard();
      } catch (Throwable e) {
	cb = localClipboard = new Clipboard("IsagFTP-local-clipboard");
      }
    } else {
      cb = localClipboard;
    }
    return cb;
  }

}
