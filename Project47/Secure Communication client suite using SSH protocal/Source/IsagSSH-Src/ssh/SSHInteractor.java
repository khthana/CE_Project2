package ssh;

import java.io.IOException;

public interface SSHInteractor {
    public void    startNewSession(SSHClient client);
    public void    sessionStarted(SSHClient client);

    public void    connected(SSHClient client);
    public void    open(SSHClient client);
    public void    disconnected(SSHClient client, boolean graceful);

    public void    report(String msg);
    public void    alert(String msg);

    public void    propsStateChanged(SSHPropertyHandler props);

    public boolean askConfirmation(String message, boolean defAnswer);
    public boolean licenseDialog(String license);

    public boolean quietPrompts();
    public String  promptLine(String prompt, String defaultVal) throws IOException;
    public String  promptPassword(String prompt) throws IOException;

    public boolean isVerbose();
}
