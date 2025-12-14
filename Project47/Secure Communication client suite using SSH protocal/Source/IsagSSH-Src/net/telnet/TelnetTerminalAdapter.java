
package net.telnet;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

import terminal.Terminal;
import terminal.TerminalInputChaff;

public class TelnetTerminalAdapter extends TerminalInputChaff
    implements TelnetEventHandler
{
    private TelnetNVT    telnet;
    private Terminal     terminal;
    private StringBuffer lineBuffer;
    private boolean      bufferedInput;
    private boolean      doNAWS;

    public TelnetTerminalAdapter(InputStream in, OutputStream out,
				 Terminal terminal) {
	this.telnet        = new TelnetNVT(this, in, out);
	this.terminal      = terminal;
	this.lineBuffer    = new StringBuffer();
	this.bufferedInput = true;

	terminal.addInputListener(this);
	terminal.setOption(Terminal.OPT_AUTO_LF, true);

	telnet.start();
    }

    public TelnetNVT getTelnetNVT() {
	return telnet;
    }

    public boolean isBuffered() {
	return bufferedInput;
    }

    public void interpretAsCommand(int cmd) {
    }

    public void optionSubNegotiation(int option, byte[] params)
	throws IOException
    {
	byte[] reply = null;

	if(params[0] == (byte)TelnetNVT.SB_CMD_SEND) {
	    switch(option) {
	    case TelnetNVT.OPT_TTYPE:
		reply = terminal.terminalType().getBytes();
		break;
	    case TelnetNVT.OPT_SPEED:
		reply = "38400,38400".getBytes();
		break;
	    }
	    //	case TelnetNVT.OPT_XDISP:
	    //	case TelnetNVT.OPT_NEWENV:
	}
	if(reply != null) {
	    byte[] tmp = reply;
	    int    n   = tmp.length;
	    reply = new byte[n + 1];
	    reply[0] = (byte)TelnetNVT.SB_CMD_IS;
	    System.arraycopy(tmp, 0, reply, 1, n);
	    telnet.sendOptionSubNegotiation(option, reply);
	}
    }

    public boolean optionNegotiation(int option, int request)
	throws IOException
    {
	boolean handled = false;
	switch(option) {
	case TelnetNVT.OPT_ECHO:
	case TelnetNVT.OPT_SGA:
	case TelnetNVT.OPT_STATUS:
	    if(request == TelnetNVT.CODE_WILL) {
		handled = true;
		telnet.doOption(option);
		if(option == TelnetNVT.OPT_ECHO) {
		    bufferedInput = false;
		    terminal.setOption(Terminal.OPT_AUTO_LF, false);
		}
	    }
	    break;
	case TelnetNVT.OPT_NAWS:
	case TelnetNVT.OPT_TTYPE:
	case TelnetNVT.OPT_SPEED:
	case TelnetNVT.OPT_REMFCTL:
        //	case TelnetNVT.OPT_XDISP:
	//	case TelnetNVT.OPT_NEWENV:
	    if(request == TelnetNVT.CODE_DO) {
		handled = true;
		telnet.willOption(option);
		if(option == TelnetNVT.OPT_NAWS) {
		    doNAWS = true;
		    signalWindowChanged(terminal.rows(), terminal.cols(),
					terminal.vpixels(), terminal.hpixels());
		}
	    }
	    break;
	}
	return handled;
    }

    public void receiveData(char c) {
	terminal.write(c);
    }

    protected void sendTypedChar(int c) {
	try {
	    if(bufferedInput) {
		if(c == 127 || c == 0x08) {
		    if(lineBuffer.length() > 0) {
			boolean ctrlChar = false;
			if(lineBuffer.charAt(lineBuffer.length() - 1) < ' ') {
			    ctrlChar = true;
			}
			lineBuffer.setLength(lineBuffer.length() - 1);
			terminal.write((char)8);
			if(ctrlChar) terminal.write((char)8);
			terminal.write(' ');
			if(ctrlChar) terminal.write(' ');
			terminal.write((char)8);
			if(ctrlChar) terminal.write((char)8);
		    } else {
			terminal.doBell();
		    }
		} else if(c == '\n') {
		    terminal.write((char)c);
		    lineBuffer.append((char)c);
		    byte[] line = lineBuffer.toString().getBytes();
		    telnet.sendData(line, 0, line.length);
		    lineBuffer.setLength(0);
		} else {
		    lineBuffer.append(c);
		    terminal.write((char)c);
		}
	    } else {
		if(c == '\r') {
		    telnet.sendCR();
		} else {
		    telnet.sendData(c);
		}
	    }
	} catch (IOException e) {
	    // !!! TODO, terminate this session
	}
    }

    protected void sendFakeChar() {
	/* Must be implemented in a subclass if we want chaff */
    }

    public void sendBytes(byte[] b) {
	for(int i = 0; i < b.length; i++) {
	    typedChar((char)b[i]);
	}
    }

    public void signalWindowChanged(int rows, int cols,
				    int vpixels, int hpixels) {
	if(doNAWS) {
	    byte[] size = new byte[4];
	    size[0] = (byte)((cols >>>  8) & 0xff);
	    size[1] = (byte)(cols & 0xff);
	    size[2] = (byte)((rows >>>  8) & 0xff);
	    size[3] = (byte)(rows & 0xff);
	    try {
		telnet.sendOptionSubNegotiation(TelnetNVT.OPT_NAWS, size);
	    } catch (IOException e) {
		// !!! TODO FATAL HANGUP
	    }
	}
    }

}
