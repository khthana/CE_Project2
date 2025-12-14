/*
 * @(#)Server.java	1.10 04/09/14
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

public class Server implements Runnable, CommandListener {

    private DatagramMIDlet parent;
    private Display display;
    private Form f;
    private StringItem si;
    private TextField tf;

    private Command sendCommand = new Command("Send", Command.ITEM, 1);
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    Sender sender;

    private String address;

    public Server(DatagramMIDlet m) {
        parent = m;
        display = Display.getDisplay(parent);
        f = new Form("Datagram Server");
        si = new StringItem("Status:" , " ");
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

            si.setText("Waiting for connection");
            DatagramConnection dc = (DatagramConnection)
                  Connector.open("datagram://:5555");

            sender = new Sender(dc);

            while (true) {
                Datagram dg = dc.newDatagram(100);
                dc.receive(dg);
                address = dg.getAddress();

                si.setText("Message received - " +
                                new String(dg.getData(), 0, dg.getLength()));

            }

        } catch (IOException ioe) {
            Alert a = new Alert("Server", "Port 5000 is already taken.",
                                null, AlertType.ERROR);
            a.setTimeout(Alert.FOREVER);
            a.setCommandListener(this);
            display.setCurrent(a);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void commandAction(Command c, Displayable s) {
        if (c == sendCommand && !parent.isPaused()) {
            if (address == null) {
                si.setText("No destination address");
            } else {
                sender.send(address, tf.getString());
            }
        }
        if (c == Alert.DISMISS_COMMAND || c == exitCommand) {
            parent.destroyApp(true);
            parent.notifyDestroyed();
        }       
    }

    public void stop() {
    }

}

