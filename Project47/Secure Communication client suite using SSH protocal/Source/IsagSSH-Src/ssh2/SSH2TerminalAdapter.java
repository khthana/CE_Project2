
package ssh2;

import terminal.Terminal;

/**
 * Glue interface implemented by terminal windows. to handle the interaction
 * with the underlying SSH2Session.
 */
public interface SSH2TerminalAdapter {
    /**
     * Get the actual terminal window.
     *
     * @return The terminal interface.
     */
    public Terminal getTerminal();

    /**
     * Attach the terminal to a session
     *
     * @param session The session to attach to.
     */
    public void     attach(SSH2SessionChannel session);

    /**
     * Detach from the session
     */
    public void     detach();

    /**
     * Starts sending chaff. While chaffing is in operation the terminal
     * sends packets at a constant rate. This hides the timing of the
     * actual keypresses made by the user. It is mostly useful while
     * passwords are enterd.
     */
    public void     startChaff();

    /**
     * Stop sending chaff.
     */
    public void     stopChaff();
}
