package ssh;

public class SSHAccessDeniedException extends Exception {
    public SSHAccessDeniedException(String message) {
	super(message);
    }

    public SSHAccessDeniedException() {
	super();
    }
}
