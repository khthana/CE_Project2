
package ssh2;

public class SSH2CorruptPacketException extends SSH2FatalException {

    public SSH2CorruptPacketException(String message) {
	super(message, null);
    }

}
