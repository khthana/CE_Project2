
package ssh2;

public abstract class SSH2Exception extends Exception {

    protected Throwable rootCause;

    public SSH2Exception(String message) {
        this(message, null);
    }

    public SSH2Exception(String message, Throwable rootCause) {
        super(message);
        this.rootCause = rootCause;
    }

    public Throwable getRootCause() {
        return rootCause;
    }

}

