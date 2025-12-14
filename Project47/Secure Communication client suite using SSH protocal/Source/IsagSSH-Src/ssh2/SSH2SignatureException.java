

package ssh2;

public class SSH2SignatureException extends SSH2Exception {
    public SSH2SignatureException(String message) {
	super(message);
    }
    public SSH2SignatureException(String message, Throwable rootCause) {
        super(message, rootCause);
    }
}
