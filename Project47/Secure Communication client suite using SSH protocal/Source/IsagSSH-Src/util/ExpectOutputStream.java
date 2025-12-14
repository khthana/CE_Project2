
package util;

import java.io.OutputStream;

public final class ExpectOutputStream extends OutputStream {

    public static interface Expector {
	public void reached(ExpectOutputStream out, byte[] buf, int len);
	public void closed(ExpectOutputStream out, byte[] buf, int len);
    }

    private Expector expector;
    private byte[]   captBuf;
    private int      captLen;
    private byte[]   boundary;
    private int      matchIdx;

    public ExpectOutputStream(Expector expector) {
	this.expector = expector;
	this.captBuf  = new byte[1024];
	this.captLen  = 0;
	this.boundary = null;
    }

    public ExpectOutputStream(Expector expector, String boundary) {
	this(expector);
	expect(boundary);
    }

    public ExpectOutputStream(Expector expector, byte[] buf, int off, int len) {
	this(expector);
	byte[] boundary = new byte[len];
	System.arraycopy(buf, off, boundary, 0, len);
	expect(boundary);
    }

    public void expect(String boundary) {
	expect(boundary.getBytes());
    }

    public synchronized void expect(byte[] boundary) {
	this.boundary = boundary;
	this.matchIdx = 0;
	if(captLen > 0) {
	    write(captBuf, 0, captLen);
	}
    }

    public void write(int b) {
	write(new byte[] { (byte)b }, 0, 1);
    }

    public synchronized void write(byte[] b, int off, int len) {
	boolean match = false;
	for(; (!match && len > 0); len--, off++) {
	    byte c = b[off];
	    if(captLen == captBuf.length) {
		    byte[] tmp = captBuf;
		    captBuf = new byte[captBuf.length * 2];
		    System.arraycopy(tmp, 0, captBuf, 0, captLen);
	    }
	    captBuf[captLen++] = c;
	    if(!match) {
		match = boundaryReached(c);
	    }
	}
	if(match) {
	    expector.reached(this, captBuf, captLen - boundary.length);
	    matchIdx = 0;
	    captLen  = 0;
	}
	if(len > 0) {
	    write(b, off, len);
	}
    }

    public void close() {
	if(captLen > 0) {
	    expector.closed(this, captBuf, captLen);
	}
    }

    private boolean boundaryReached(byte b) {
	if(boundary == null) {
	    return false;
	}
	if(boundary[matchIdx] == b) {
	    matchIdx++;
	} else {
	    matchIdx = 0;
	}
	if(matchIdx == boundary.length) {
	    return true;
	}
	return false;
    }

}
