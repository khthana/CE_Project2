
package util;

import java.io.OutputStream;
import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class Log {
    public final static int LEVEL_EMERG   = 0;
    public final static int LEVEL_ALERT   = 1;
    public final static int LEVEL_ERROR   = 2;
    public final static int LEVEL_WARNING = 3;
    public final static int LEVEL_NOTICE  = 4;
    public final static int LEVEL_INFO    = 5;
    public final static int LEVEL_DEBUG   = 6;
    public final static int LEVEL_DEBUG2  = 7;

    volatile int currentLevel = 0;

    private OutputStream logOut = null;

    public Log(int level) {
	this(System.err, level);
    }

    public Log(OutputStream logOut, int level) {
	this.logOut       = logOut;
	this.currentLevel = level;
    }

    public void setLogOutputStream(OutputStream logOut) {
	this.logOut = logOut;
    }

    public void close() {
	if(logOut != null && logOut != System.err) {
	    try { logOut.close(); } catch (IOException e) { }
	}
    }

    public void message(int level, String callClass, String message) {
	message(level, callClass, null, message);
    }

    public synchronized void message(int level, String callClass,
				     String callMethod,
				     String message) {
	if(level <= currentLevel) {
	    String methStr = (callMethod != null ? "." + callMethod + "()" :
			      "");
	    DateFormat df = new SimpleDateFormat( "HH:mm:ss.SSS" );
	    df.setTimeZone( TimeZone.getDefault() ); // JDK 1.1

	    String logStr  = "** " + df.format(new Date()) + " "
		+ callClass + methStr + " : '" + message + "'" + "\n";

	    byte[] logMsg = logStr.getBytes();
	    try {
		if(logOut != null) {
		    logOut.write(logMsg, 0, logMsg.length);
		}
	    } catch (IOException e) {
		System.err.println("ERROR: Couldn't write to log");
		System.err.println(logStr);
	    }
	}
    }

    public void error(String callClass, String callMethod, String message) {
	message(LEVEL_ERROR, callClass, callMethod, message);
    }

    public void warning(String callClass, String message) {
	message(LEVEL_ERROR, callClass, null, message);
    }

    public void notice(String callClass, String message) {
	message(LEVEL_NOTICE, callClass, null, message);
    }

    public void info(String callClass, String message) {
	message(LEVEL_INFO, callClass, null, message);
    }

    public void debug(String callClass, String callMethod, String message) {
	message(LEVEL_DEBUG, callClass, callMethod, message);
    }

    public void debug(String callClass, String message) {
	message(LEVEL_DEBUG, callClass, null, message);
    }

    public void debug2(String callClass, String callMethod, String message) {
	message(LEVEL_DEBUG2, callClass, callMethod, message);
    }

    public synchronized void debug2(String callClass, String callMethod,
				    String message,
				    byte[] dumpBuf, int off, int len) {
	message(LEVEL_DEBUG2, callClass, callMethod, message);
	if(currentLevel == LEVEL_DEBUG2) {
	    HexDump.print(dumpBuf, off, len);
	}
    }

    public void debug2(String callClass, String callMethod, String message,
		       byte[] dumpBuf) {
	debug2(callClass, callMethod, message, dumpBuf, 0, dumpBuf.length);
    }

    public void setLevel(int level) {
	currentLevel = level;
    }
}
