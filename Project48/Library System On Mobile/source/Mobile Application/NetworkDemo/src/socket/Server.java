/*
 * @(#)Server.java	1.7 04/01/27
 *
 * Copyright (c) 2000-2004 Sun Microsystems, Inc. All rights reserved. 
 * PROPRIETARY/CONFIDENTIAL
 * Use is subject to license terms
 */
package socket;
import javax.microedition.midlet.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import java.io.*;


public class Server implements Runnable, CommandListener {
    private SocketMIDlet parent;
    private Display display;
    private Form f;
    private StringItem si;
    private TextField tf;
    private boolean stop;
    private Command sendCommand = new Command("Send", Command.ITEM, 1);
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    InputStream is;
    OutputStream os;
    SocketConnection sc;
    ServerSocketConnection scn;
    Sender sender;

    public Server(SocketMIDlet m) {
        parent = m;
        display = Display.getDisplay(parent);
        f = new Form("Socket Server");
        si = new StringItem("Status:", " ");
        tf = new TextField("Send:", "", 30, TextField.ANY);
        f.append(si);
        f.append(tf);
        f.addCommand(exitCommand);
        f.setCommandListener(this);
        display.setCurrent(f);
    }

    public void start() {
        Thread t = new Thread(this);
        t.start();
    }

    public void run() {
        try {
            si.setText("Waiting for connection");
            scn = (ServerSocketConnection) Connector.open("socket://:5000");

            // Wait for a connection.
            sc = (SocketConnection) scn.acceptAndOpen();
            si.setText("Connection accepted");
            is = sc.openInputStream();
            os = sc.openOutputStream();
            sender = new Sender(os);

            // Allow sending of messages only after Sender is created
            f.addCommand(sendCommand);

            while (true) {
                StringBuffer sb = new StringBuffer();
                int c = 0;

                while (((c = is.read()) != '\n') && (c != -1)) {
                    sb.append((char) c);
                }

                if (c == -1) {
                    break;
                }
                si.setText("Message received - " + sb.toString());
            }
            stop();
            si.setText("Connection is closed");
            f.removeCommand(sendCommand);
        } catch (IOException ioe) {
            if (ioe.getMessage().equals("ServerSocket Open")) {
                Alert a = new Alert("Server", "Port 5000 is already taken.",
                        null, AlertType.ERROR);
                a.setTimeout(Alert.FOREVER);
                a.setCommandListener(this);
                display.setCurrent(a);
            } else {
                if (!stop) {
                    ioe.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void commandAction(Command c, Displayable s) {
        if (c == sendCommand && !parent.isPaused()) {
            sender.send(tf.getString());
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

            if (is != null) {
                is.close();
            }

            if (os != null) {
                os.close();
            }

            if (sc != null) {
                sc.close();
            }

            if (scn != null) {
                scn.close();
            }
        } catch (IOException ioe) {}
    }
}
