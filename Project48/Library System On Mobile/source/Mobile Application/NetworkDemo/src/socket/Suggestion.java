package socket;
import javax.microedition.midlet.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import java.io.*;

public class Suggestion implements Runnable, CommandListener {
    private SocketMIDlet parent;
    private Display display;
    private Form f,f2;
    private TextField tf;
    private boolean stop;
    private StringItem si;
    private Command sendCommand = new Command("Send", Command.ITEM, 1);
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
   private Command mainCommand = new Command("Main", Command.EXIT, 1);
    InputStream is;
    OutputStream os;
    SocketConnection sc;
    Sender sender;

    public Suggestion(SocketMIDlet m) {
        parent = m;
        display = Display.getDisplay(parent);
        f = new Form("Send Suggestion");
		f2 = new Form("Send Suggestion  Complet ");
    
         si = new StringItem("Status:", " ");
        tf = new TextField("Send:", "", 30, TextField.ANY);
        f.append(tf);
        f2.append(si);
	
      
        f.addCommand(exitCommand);
        f.addCommand(sendCommand);
        f.setCommandListener(this);

		   f2.addCommand(exitCommand);
		    f2.addCommand(mainCommand);
          f2.setCommandListener(this);

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

     
            }
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
       if(c==mainCommand){		
		//  display.setCurrent(f);
	   }
		
		if (c == sendCommand && !parent.isPaused()) {
            sender.send(tf.getString());

		       si.setText("Thank you of  Suggestion");
		  
		  display.setCurrent(f2);
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

