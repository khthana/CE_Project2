package ssh2;

public class SSH2FatalException extends SSH2Exception {

    public SSH2FatalException(String message) {
	this(message, null);
    }

    public SSH2FatalException(String message, Throwable rootCause) {
        super(message, rootCause);
    }

}
