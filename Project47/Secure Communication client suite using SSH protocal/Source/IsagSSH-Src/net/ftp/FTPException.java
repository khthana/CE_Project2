
package net.ftp;

public class FTPException extends Exception {

    protected int code;

    public int getCode() {
	return code;
    }

    public FTPException(int code, String message) {
	super(message);
	this.code = code;
    }

}
