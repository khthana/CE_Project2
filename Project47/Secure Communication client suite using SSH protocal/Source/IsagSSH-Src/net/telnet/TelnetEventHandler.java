
package net.telnet;

import java.io.IOException;

public interface TelnetEventHandler {
    public void interpretAsCommand(int cmd);
    public void optionSubNegotiation(int option, byte[] params)
	throws IOException;
    public boolean optionNegotiation(int option, int request)
	throws IOException;
    public void receiveData(char c);
}
