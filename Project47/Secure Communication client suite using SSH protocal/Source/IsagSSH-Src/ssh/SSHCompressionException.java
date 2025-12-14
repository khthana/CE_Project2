
package ssh;

import java.io.IOException;

public class SSHCompressionException extends IOException {
    public SSHCompressionException(String message) {
	super(message);
    }

    public SSHCompressionException() {
	super();
    }
}
