/*
 * @(#)Sender.java	1.4 04/01/27
 *
 * Copyright (c) 2000-2004 Sun Microsystems, Inc. All rights reserved. 
 * PROPRIETARY/CONFIDENTIAL
 * Use is subject to license terms
 */
package comm;

import javax.microedition.midlet.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import java.io.*;

public class Sender extends Thread {

    private OutputStream os;
    private String message;

    public Sender(OutputStream os) {
        this.os = os;
        start();
    }

    public synchronized void send(String msg) {
        message = msg;
        notify();
    }

    public synchronized void run() {

        while(true) {

            // If no client to deal, wait until one connects
            if (message == null) {
                try {
                    wait();
                } catch (InterruptedException e) {
                }
            }

            if (message == null) {
                break;
            }

            try {
                os.write(message.getBytes());
                os.write('\r');
            } catch (IOException ioe) {
                ioe.printStackTrace();
            }

            // Completed client handling, return handler to pool and
            // mark for wait
            message = null;
        }
    }

    public synchronized void stop() {
        message = null;
        notify();
    }
}

