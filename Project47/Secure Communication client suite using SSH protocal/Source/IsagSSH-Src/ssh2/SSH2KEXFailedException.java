
package ssh2;

public class SSH2KEXFailedException extends SSH2Exception {
    public SSH2KEXFailedException(String message) {
	super(message);
    }
    public SSH2KEXFailedException(String message, Throwable rootCause) {
        super(message, rootCause);
    }
}
