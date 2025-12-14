
package ssh2;


/**
 * This class is an adapter for the interface
 * <code>SSH2TransportEventHandler</code>.
 *
 * @see SSH2TransportEventHandler
 */
public class SSH2TransportEventAdapter implements SSH2TransportEventHandler {
    public void gotConnectInfoText(SSH2Transport tp, String text) {
    }
    public void gotPeerVersion(SSH2Transport tp, String versionString,
			       int major, int minor, String packageVersion) {
    }

    public void kexStart(SSH2Transport tp) {
    }
    public void kexAgreed(SSH2Transport tp,
			  SSH2Preferences ourPrefs, SSH2Preferences peerPrefs)
    {
    }
    public boolean kexAuthenticateHost(SSH2Transport tp,
				       SSH2Signature serverHostKey)
    {
	return true;
    }
    public void kexComplete(SSH2Transport tp) {
    }

    public void msgDebug(SSH2Transport tp, boolean alwaysDisplay, String message,
			 String languageTag) {
    }
    public void msgIgnore(SSH2Transport tp, byte[] data) {
    }
    public void msgUnimplemented(SSH2Transport tp, int rejectedSeqNum) {
    }

    public void peerSentUnknownMessage(SSH2Transport tp, int pktType) {
    }

    public void normalDisconnect(SSH2Transport tp, String description,
				 String languageTag) {
    }
    public void fatalDisconnect(SSH2Transport tp, int reason,
				String description, String languageTag) {
    }
    public void peerDisconnect(SSH2Transport tp, int reason,
			       String description, String languageTag) {
    }

}
