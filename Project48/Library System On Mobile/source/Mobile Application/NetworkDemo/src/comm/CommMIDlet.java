/*
 * %W% %E%
 *
 * Copyright (c) 2000-2004 Sun Microsystems, Inc. All rights reserved. 
 * PROPRIETARY/CONFIDENTIAL
 * Use is subject to license terms
 */
package comm;

import java.io.*;
import java.util.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;


public class CommMIDlet extends MIDlet implements Runnable, CommandListener{

    private Display display;
    private Form f;
    private TextField tf;
    private StringItem si;
    private ChoiceGroup cg;
    private boolean isPaused;

    private Command openCommand = new Command("Open", Command.ITEM, 1);
    private Command sendCommand = new Command("Send", Command.ITEM, 1);
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    
    private Sender sender;

    public CommMIDlet() {

        display = Display.getDisplay(this);
        f = new Form("Port Selection");
        cg = new ChoiceGroup("Please select port",
                               Choice.EXCLUSIVE, availablePorts(), null);
        f.append(cg);

        f.addCommand(openCommand);
        f.addCommand(exitCommand);
        f.setCommandListener(this);




        display.setCurrent(f);
    }

    public boolean isPaused() {
        return isPaused;
    }

    public void startApp() {
        isPaused = false;
    }


    public void pauseApp() {
        isPaused = true;
    }

    public void destroyApp(boolean unconditional) {
    }

    private String[] availablePorts() {

        Vector vect = new Vector();
        String ports = System.getProperty("microedition.commports");
        int start = 0;
        int end = 0;
        while ((end = ports.indexOf(',', start)) != -1) {
            vect.addElement(ports.substring(start, end).trim());
            start = end + 1;
            ports = ports.substring(start);
        }
        vect.addElement(ports);
        String[] retVal = new String[vect.size()];
        for (int i = 0; i < retVal.length; i++) {
            retVal[i] = (String) vect.elementAt(i);
        }
        return retVal;
    }


    public void commandAction(Command c, Displayable s) {
        if (isPaused()) {
            return;
        }
        if (c == openCommand) {
            new Thread(this).start();
        }
        if (c == sendCommand) {
            sender.send(tf.getString());
        }
        if (c == exitCommand) {
            destroyApp(true);
            notifyDestroyed();
        }
    }

    public void run() {

        try {
            f = new Form("COMM Client");
            si = new StringItem("Received:" , " ");
            tf = new TextField("Send:", "", 30, TextField.ANY);
            f.append(si);
            f.append(tf);
            f.addCommand(sendCommand);
            f.addCommand(exitCommand);
            f.setCommandListener(this);
            display.setCurrent(f);

            String name = cg.getString(cg.getSelectedIndex());
            CommConnection commConn = (CommConnection)Connector.open(
                                        "comm:" + name + ";baudrate=9600");
            InputStream iStream = commConn.openInputStream();
            OutputStream oStream = commConn.openOutputStream();

            sender = new Sender(oStream);

            int ch = 0;

            while (true) {
                StringBuffer buf = new StringBuffer();
                ch = 0;
                while (ch != '\r') {
                    ch = iStream.read();
                    buf.append((char) ch);
                }
                si.setText(buf.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
