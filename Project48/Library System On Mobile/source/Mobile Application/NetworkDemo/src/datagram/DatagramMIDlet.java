/*
 * @(#)DatagramMIDlet.java	1.8 04/01/27
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

public class DatagramMIDlet extends MIDlet implements CommandListener {

    private static final String SERVER = "Server";
    private static final String CLIENT = "Client";

    private static final String[] names = {SERVER, CLIENT};

    private static Display display;
    private Form f;
    ChoiceGroup cg;
    private boolean isPaused;

    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    private Command startCommand = new Command("Start", Command.ITEM, 1);

    public DatagramMIDlet() {
        display = Display.getDisplay(this);
        f = new Form("Datagram Demo");
        cg = new ChoiceGroup("Please select peer",
                                            Choice.EXCLUSIVE, names, null);
        f.append(cg);

        f.addCommand(exitCommand);
        f.addCommand(startCommand);
        f.setCommandListener(this);

        display.setCurrent(f);
    }

    public static Display getDisplay() {
        return display;
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

    public void commandAction(Command c, Displayable s) {
        if (c == exitCommand) {
            destroyApp(true);
            notifyDestroyed();
        } else if (c == startCommand) {
            String name = cg.getString(cg.getSelectedIndex());
            if (name.equals(SERVER)) {
                Server server = new Server(this);
                server.start();
            } else {
                Client client = new Client(this);
                client.start();
            }
        }
    }

}

