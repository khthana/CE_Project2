

package ssh2;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

import util.InputStreamPipe;
import util.OutputStreamPipe;

/**
 * This class implements session channels as defined in the connection protocol
 * spec. It can be used to start shells, commands, and subsystems on the server.
 * An instance of this class is created with the <code>newSession</code> methods
 * found in <code>SSH2Connection</code>.
 *
 * @see SSH2Channel
 * @see SSH2Connection
 */
public final class SSH2SessionChannel extends SSH2InternalChannel {

    public static final int EXIT_ON_CLOSE   = -1;
    public static final int EXIT_ON_FAILURE = -2;

    protected boolean started;
    protected boolean blocking;
    protected boolean exited;
    protected Object  exitMonitor;
    protected Object  reqMonitor;
    protected boolean exitedOnSignal;
    protected int     exitStatus;
    protected boolean reqStatus;
    protected boolean x11Mapping;

    protected InputStreamPipe stderr;
    protected OutputStream    stderrW;

    protected SSH2SessionChannel(SSH2Connection connection) {
	super(SSH2Connection.CH_TYPE_SESSION, connection);

	this.rxInitWinSz = 16*1024;
	this.rxCurrWinSz = 16*1024;
	this.rxMaxPktSz  = 4*1024;
	this.started     = false;
	this.exited      = false;
	this.blocking    = true;
	this.reqStatus   = true;
	this.x11Mapping  = false;
	this.exitMonitor = new Object();
	this.reqMonitor  = new Object();
	this.stderrW     = null;
    }

    public boolean doShell() {
	if(started || openStatus() != SSH2Channel.STATUS_OPEN) {
	    return false;
	}
	SSH2TransportPDU pdu = getRequestPDU(SSH2Connection.CH_REQ_SHELL);
	started = sendAndBlockUntilReply(pdu);
	return started;
    }

    public boolean doSingleCommand(String command) {
	if(started || openStatus() != SSH2Channel.STATUS_OPEN) {
	    return false;
	}
	SSH2TransportPDU pdu = getRequestPDU(SSH2Connection.CH_REQ_EXEC);
	pdu.writeString(command);
	started = sendAndBlockUntilReply(pdu);
	return started;
    }

    public boolean doSubsystem(String subsystem) {
	if(started || openStatus() != SSH2Channel.STATUS_OPEN) {
	    return false;
	}
	SSH2TransportPDU pdu = getRequestPDU(SSH2Connection.CH_REQ_SUBSYSTEM);
	pdu.writeString(subsystem);
	started = sendAndBlockUntilReply(pdu);
	return started;
    }

    // draft-ietf-secsh-break
    public boolean doBreak(int length) {
	if(started || openStatus() != SSH2Channel.STATUS_OPEN) {
	    return false;
	}
	SSH2TransportPDU pdu = getRequestPDU(SSH2Connection.CH_REQ_BREAK);
	pdu.writeInt(length);
	started = sendAndBlockUntilReply(pdu);
	return started;
    }

    public int waitForExit() {
	return waitForExit(0);
    }

    public int waitForExit(long timeout) {
	synchronized (exitMonitor) {
	    if(!exited) {
		try { exitMonitor.wait(timeout); }
		catch (InterruptedException e) { /* don't care */ }
	    }
	    // !!! TODO: Handle signals, maybe should throw exception ???
	    return exitStatus;
	}
    }

    public void changeStdOut(OutputStream out) {
	this.out = out;
    }

    public void changeStdIn(InputStream in) {
	this.in = in;
    }

    public void changeStdErr(OutputStream stderrW) {
	this.stderrW = stderrW;
    }

    public void enableStdErr() {
	this.stderrW = new OutputStreamPipe();
	this.stderr  = new InputStreamPipe();
	try {
	    this.stderr.connect((OutputStreamPipe)stderrW);
	} catch (IOException e) {
	    connection.getLog().error("SSH2SessionChannel", "enableStdErr",
				      "can't happen, bug somewhere!?!");
	}
    }

    public InputStream getStdOut() {
	return getInputStream();
    }

    public OutputStream getStdIn() {
	return getOutputStream();
    }

    public InputStream getStdErr() {
	return stderr;
    }

    public void stdinWriteNoLatency(String str) {
	byte[] b = str.getBytes();
	stdinWriteNoLatency(b, 0, b.length);
    }

    public void stdinWriteNoLatency(byte[] buf, int off, int len) {
	SSH2TransportPDU pdu =
	    SSH2TransportPDU.createOutgoingPacket(SSH2.MSG_CHANNEL_DATA,
						  len + 128);
	pdu.writeInt(peerChanId);
	pdu.writeInt(len);
	pdu.writeRaw(buf, off, len);
	transmit(pdu);
	txCounter += len;
    }

    public void stdinWriteNoLatency(int c) {
	stdinWriteNoLatency(new byte[] { (byte)c }, 0, 1);
    }

    public void setBlocking(boolean value) {
	synchronized (reqMonitor) {
	    this.blocking = value;
	}
    }

    public boolean requestPTY(String termType, int rows, int cols,
			      byte[] terminalModes) {
	if(openStatus() != SSH2Channel.STATUS_OPEN) {
	    return false;
	}

	SSH2TransportPDU pdu = getRequestPDU(SSH2Connection.CH_REQ_PTY);
	pdu.writeString(termType);
	pdu.writeInt(cols);
	pdu.writeInt(rows);
	pdu.writeInt(0);
	pdu.writeInt(0);
	if(terminalModes == null)
	    terminalModes = new byte[] { 0 };
	pdu.writeString(terminalModes);
	return sendAndBlockUntilReply(pdu);
    }

    public boolean requestX11Forward(String localAddr, int localPort,
				     byte[] cookie, boolean single, int screen)
    {
	connection.getPreferences().setPreference(SSH2Preferences.X11_DISPLAY,
						  localAddr + ":" + localPort);
	connection.setX11RealCookie(cookie);
	return requestX11Forward(single, screen);
    }

    public boolean requestX11Forward(boolean single, int screen) {
	if(openStatus() != SSH2Channel.STATUS_OPEN ||
	   x11Mapping) {
	    if(x11Mapping)
		connection.getLog().warning("SSH2SessionChannel",
				    "requesting x11 forward multiple times");
	    return false;
	}

	byte[] x11FakeCookie = connection.getX11FakeCookie();
	StringBuffer cookieBuf = new StringBuffer();
	for(int i = 0; i < 16; i++) {
	    String b = Integer.toHexString(x11FakeCookie[i] & 0xff);
	    if(b.length() == 1) {
                cookieBuf.append("0");
	    }
	    cookieBuf.append(b);
	}
	String           cookie = cookieBuf.toString();
	SSH2TransportPDU pdu    = getRequestPDU(SSH2Connection.CH_REQ_X11);

	pdu.writeBoolean(single);
	pdu.writeString("MIT-MAGIC-COOKIE-1");
	pdu.writeString(cookie);
	pdu.writeInt(screen);

	x11Mapping = sendAndBlockUntilReply(pdu);

	if(x11Mapping) {
	    connection.setX11Mapping(single);
	}

	return x11Mapping;
    }

    public boolean setEnvironment(String name, String value) {
	if(openStatus() != SSH2Channel.STATUS_OPEN) {
	    return false;
	}

	SSH2TransportPDU pdu = getRequestPDU(SSH2Connection.CH_REQ_ENV);
	pdu.writeString(name);
	pdu.writeString(value);
	return sendAndBlockUntilReply(pdu);
    }

    public void sendWindowChange(int rows, int cols) {
	SSH2TransportPDU pdu =
	    getNoReplyRequestPDU(SSH2Connection.CH_REQ_WINCH);
	pdu.writeInt(cols);
	pdu.writeInt(rows);
	pdu.writeInt(0);
	pdu.writeInt(0);
	transmit(pdu);
    }

    public void sendSignal(String signal, boolean core, String msg, String lang) {
	SSH2TransportPDU pdu =
	    getNoReplyRequestPDU(SSH2Connection.CH_REQ_SIGNAL);
	pdu.writeString(signal);
        pdu.writeBoolean(core);
	pdu.writeString(msg);
	pdu.writeString(lang);
	transmit(pdu);
    }

    public void doExit(int status) {
        doExit(status, false, null);
    }

    public void doExit(int status, boolean onSignal) {
        doExit(status, onSignal, null);
    }
    
    public void doExit(int status, boolean onSignal, String signal) {
	synchronized (exitMonitor) {
	    if(!exited) {
		exited = true;
		if(x11Mapping) {
		    x11Mapping = false;
		    connection.clearX11Mapping();
		}
                if (signal == null)
                    signal = "<unknown>";
		this.exitedOnSignal = onSignal;
		this.exitStatus     = status;
		exitMonitor.notifyAll();

		connection.getLog().info("SSH2SessionChannel",
					 "session (ch. #" + channelId +
					 ") exit with " +
					 (onSignal ? ("signal " + signal) : 
                                          ("status " + status)));
	    }
	}
    }

    protected void extData(SSH2TransportPDU pdu) {
	int type = pdu.readInt();
	if(type != SSH2.EXTENDED_DATA_STDERR) {
	    connection.getLog().error("SSH2SessionChannel", "extData",
				      "extended data of unknown type: " + type);
	} else {
 	    try {
                
		int    len  = pdu.readInt();
		byte[] data = pdu.getData();
		int    off  = pdu.getRPos();
                rxCounter += len;
 		if(stderrW != null) {
 		    stderrW.write(data, off, len);
 		} else {
 		    connection.getLog().debug("SSH2SessionChannel",
 					      "session " + "(ch. #" + channelId +
 					      ") stderr : " +
 					      new String(data, off, len));
 		}
                checkRxWindowSize(len);
 	    } catch (IOException e) {
 		connection.getLog().error("SSH2SessionChannel", "extData",
 					  "error writing to stderr: " +
 					  e.getMessage());
 	    }
	}
    }

    protected void closeImpl() {
	super.closeImpl();
	doExit(EXIT_ON_CLOSE);
	//
	// Just to make sure everybody gets released
	//
	requestFailure((SSH2TransportPDU)null);
    }

    protected boolean openFailureImpl(int reasonCode, String reasonText,
				   String langTag) {
	doExit(EXIT_ON_FAILURE);
	return false;
    }

    protected void requestSuccess(SSH2TransportPDU pdu) {
	synchronized (reqMonitor) {
	    reqStatus = true;
	    reqMonitor.notify();
	}
    }

    protected void requestFailure(SSH2TransportPDU pdu) {
	synchronized (reqMonitor) {
	    reqStatus = false;
	    reqMonitor.notify();
	}
    }

    protected void handleRequestImpl(String type, boolean wantReply,
				     SSH2TransportPDU pdu) {

	// !!! TODO: Handle exit properly...

	if(type.equals(SSH2Connection.CH_REQ_EXIT_STAT)) {
	    int status = pdu.readInt();
	    doExit(status);

	} else if(type.equals(SSH2Connection.CH_REQ_EXIT_SIG)) {
            String sig = null;
            try {
                sig  = pdu.readJavaString();
                boolean core = pdu.readBoolean();
                String  msg  = pdu.readJavaString();
                String  lang = pdu.readJavaString();

                connection.getLog().debug("SSH2SessionChannel", "handleRequestImpl",
                                          "got CH_REQ_EXIT_SIG: " + 
                                          " sig=" + sig +", core=" + core +
                                          ", msg=" + lang + ", lang=" + lang);
            } catch (Throwable t) {
            }

	    doExit(-1, true, sig);

	    // !!! TODO: store msg/core also !!!

	} else {
            if (!type.equals(SSH2Connection.CH_REQ_OPENSSH_KEEPALIVE)) {
                connection.getLog().error("SSH2SessionChannel", "handleRequestImpl",
                                          "got unknown channel-request: " + type);
            }

            if(wantReply) {
		SSH2TransportPDU reply =
		    SSH2TransportPDU.createOutgoingPacket(SSH2.MSG_CHANNEL_FAILURE);
                reply.writeInt(peerChanId);
                transmit(reply);
            }
	}
    }

    private boolean sendAndBlockUntilReply(SSH2TransportPDU pdu) {
	synchronized (reqMonitor) {
	    transmit(pdu);
	    try {
		if(blocking)
		    reqMonitor.wait(); 
	    } catch (InterruptedException e) {
		connection.getLog().error("SSH2SessionChannel",
					  "sendAndBlockUntilReply",
					  "wait for reply interrupted");
	    }
	    boolean s = reqStatus;
	    reqStatus = true;
	    return s;
	}
    }

    private SSH2TransportPDU getRequestPDU(String type) {
	SSH2TransportPDU pdu =
	    SSH2TransportPDU.createOutgoingPacket(SSH2.MSG_CHANNEL_REQUEST);
	pdu.writeInt(peerChanId);
	pdu.writeString(type);
	synchronized (reqMonitor) {
	    pdu.writeBoolean(blocking);
	}
	return pdu;
    }

    private SSH2TransportPDU getNoReplyRequestPDU(String type) {
	SSH2TransportPDU pdu =
	    SSH2TransportPDU.createOutgoingPacket(SSH2.MSG_CHANNEL_REQUEST);
	pdu.writeInt(peerChanId);
	pdu.writeString(type);
	pdu.writeBoolean(false);
	return pdu;
    }

}
