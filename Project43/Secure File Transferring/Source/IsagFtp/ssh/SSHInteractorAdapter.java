package IsagFtp.ssh;

import java.io.IOException;

public class SSHInteractorAdapter implements SSHInteractor {

    public void startNewSession(SSHClient client) {
    }
    public void sessionStarted(SSHClient client) {
    }

    public void connected(SSHClient client) {
    }
    public void open(SSHClient client) {
    }
    public void disconnected(SSHClient client, boolean graceful) {
    }

    public void report(String msg) {
    }
    public void alert(String msg) {
    }

    public void propsStateChanged(SSHPropertyHandler props) {
    }
    public boolean askConfirmation(String message, boolean defAnswer) {
	return defAnswer;
    }

    public boolean quietPrompts() {
	return true;
    }
    public String promptLine(String prompt, String defaultVal) throws IOException {
	return null;
    }
    public String promptPassword(String prompt) throws IOException {
	return null;
    }

    public boolean isVerbose() {
	return false;
    }

}
