package socket;
import javax.microedition.midlet.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import java.io.*;


public class   Auther implements Runnable, CommandListener {
    private SocketMIDlet parent;
    private Display display;
    private Form f;
    private StringItem si,si2,si3,si4;
    private TextField tf;
    private boolean stop;
    private Command sendCommand = new Command("Send", Command.ITEM, 1);
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    InputStream is;
    OutputStream os;
    SocketConnection sc;
    Sender sender;

    public Auther(SocketMIDlet m) {
        parent = m;
        display = Display.getDisplay(parent);
        f = new Form("Socket Client");
        si = new StringItem("Result:", " ");
		 si2 = new StringItem("Book Name:", " ");
		  si3 = new StringItem("Status:", " ");
		  si4 = new StringItem("Expect Return:", " ");

        tf = new TextField("Send:", "", 30, TextField.ANY);
        f.append(tf);
		f.append(si);
	//	f.append(si2);
//		f.append(si3);
//		f.append(si4);
      
        f.addCommand(exitCommand);
        f.addCommand(sendCommand);
        f.setCommandListener(this);
        display.setCurrent(f);
    }

    /**
     * Start the client thread
     */
    public void start() {
        Thread t = new Thread(this);
        t.start();
    }

    public void run() {
        try {
            sc = (SocketConnection) Connector.open("socket://localhost:12345");
        //    si.setText("Connected to server");
            is = sc.openInputStream();
            os = sc.openOutputStream();

            // Start the thread for sending messages - see Sender's main
            // comment for explanation
            sender = new Sender(os);

            // Loop forever, receiving data
            while (true) {
                StringBuffer sb = new StringBuffer();
				
                int c = 0;

                while (((c = is.read()) != '\n') && (c != -1)) {
                    sb.append((char) c);
                }

                if (c == -1) {
                    break;
                }

			    String test = sb.toString();
    String buff = "";
    for (int i=0; i<test.length(); i++) {
            // value of ‘\u0E01’ is 3585
            if (test.charAt(i) > 127 && (int)test.charAt(i) < 3424)
                    buff += (char)(test.charAt(i) + 3424);
            else buff += test.charAt(i);
    }

    test = buff;

                // Display message to user
               si.setText( test);
            }
         
        //    si.setText(sb.toString());
	//		si2.setText("Test");
	//		si3.setText("Test");
//			si4.setText("Test");
			   stop();
            f.removeCommand(sendCommand);
        } catch (ConnectionNotFoundException cnfe) {
            Alert a = new Alert("Client", "Please run Server MIDlet first",
                    null, AlertType.ERROR);
            a.setTimeout(Alert.FOREVER);
            a.setCommandListener(this);
            display.setCurrent(a);
        } catch (IOException ioe) {
            if (!stop) {
                ioe.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void commandAction(Command c, Displayable s) {
        if (c == sendCommand && !parent.isPaused()) {
          String temp = tf.getString();
		    String buff = "";
    for (int i=0; i<temp.length(); i++) {
		//System.out.println((int)test.charAt(i));
            // value of ‘\u0E01’ is 3585

			// Êè§ÀÒÉÒä·Â ¨Ò¡Á×Í¶×Í
            if ((int)temp.charAt(i) > 3552)
                    buff += (char)(temp.charAt(i) - 3424);
            else buff += temp.charAt(i);
    }

    temp = buff;			
			sender.send(temp+" "+"1");
        }

        if ((c == Alert.DISMISS_COMMAND) || (c == exitCommand)) {
            parent.notifyDestroyed();
            parent.destroyApp(true);
        }
    }

    /**
     * Close all open streams
     */
    public void stop() {
        try {
            stop = true;

            if (sender != null) {
                sender.stop();
            }

            if (is != null) {
                is.close();
            }

            if (os != null) {
                os.close();
            }

            if (sc != null) {
                sc.close();
            }
        } catch (IOException ioe) {}
    }
}
