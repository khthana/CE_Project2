/*
 * Logger.java
 *
 * Created on 4. November 2004, 10:59
 */

package gps.log;

import javax.microedition.lcdui.TextBox;

/**
 * Logger to enable debugging on mobile device.
 *
 * @author  Dominik Schmidt
 */
public class Logger extends TextBox {
    /**
     * Creatse new logger.
     * 
     * @param title Title to be displayed
     * @param size Size of underlaying TextBox
     * @param type Type of underlaying TextBox
     */
    public Logger(String title, int size, int type) {
        super(title, "", size, type);
    }
    
    /**
     * Appends a string to the end of the TextBox.
     * 
     * @param text String to append
     */ 
    public void appendString(String text) {
        super.setString(this.getString() + "\n" + text);
    }
    
    /**
     * Appends a single character to the end of the TextBox.
     * 
     * @param i ASCII-Code of character to append
     */
    public void appendInt(int i) {
        super.setString(this.getString() + ((char) i));// + "[" + i + "]");
    }
    
    public void setString(String text) {
        super.setString(text);
    }
}
