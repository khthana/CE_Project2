
package ssh2;

public class SSH2ConnectException extends SSH2Exception {
    public SSH2ConnectException(String message) {
        this(message, null);
    }
    public SSH2ConnectException(String message, Throwable rootCause) {
        super(message, rootCause);
    }
}
