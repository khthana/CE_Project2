/*
 * @(#)Client.java	1.10 04/09/14
 *
 * Copyright (c) 2000-2004 Sun Microsystems, Inc. All rights reserved. 
 * PROPRIETARY/CONFIDENTIAL
 * Use is subject to license terms
 */
package datagram;

import javax.microedition.midlet.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import java.io.*;

public class Client implements Runnable, CommandListener {

    private DatagramMIDlet parent;
    private Display display;
    private Form f;
    private StringItem si;
    private TextField tf;

    private Command sendCommand = new Command("Send", Command.ITEM, 1);
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    Sender sender;

    public Client(DatagramMIDlet m) {
        parent = m;
        display = Display.getDisplay(parent);
        f = new Form("Datagram Client");
        si = new StringItem("Status:", " ");
        tf = new TextField("Send:", "", 30, TextField.ANY);
        f.append(si);
        f.append(tf);
        f.addCommand(sendCommand);
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

            DatagramConnection dc = (DatagramConnection)
		    Connector.open("datagram://localhost:5555");

            si.setText("Connected to server");

            sender = new Sender(dc);

            while (true) {
                Datagram dg = dc.newDatagram(100);
                dc.receive(dg);
                // Have we actually received something or
		// is this just a timeout ?
                if (dg.getLength() > 0) {
                    si.setText("Message received - " +
                        new String(dg.getData(), 0, dg.getLength()));
                }
            }

        } catch (ConnectionNotFoundException cnfe) {
            Alert a = new Alert("Client", "Please run Server MIDlet first",
                                null, AlertType.ERROR);
            a.setTimeout(Alert.FOREVER);
            display.setCurrent(a);
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
    }

    public void commandAction(Command c, Displayable s) {
        if (c == sendCommand && !parent.isPaused()) {
            sender.send(null, tf.getString());
        }
        if (c == exitCommand) {
            parent.destroyApp(true);
            parent.notifyDestroyed();
        }
    }

    public void stop() {
    }

}

