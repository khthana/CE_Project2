
package ssh2;

/**
 * This interface defines the different types of prompts which are needed for
 * interactive authentication. It's made generic to be able to allow
 * flexibility in the level of sofistication one wants for user interaction.
 *
 * @see SSH2AuthKbdInteract
 * @see SSH2AuthPassword
 */
public interface SSH2Interactor {
    public String promptLine(String prompt, boolean echo)
	throws SSH2UserCancelException;
    public String[] promptMulti(String[] prompts, boolean[] echos)
	throws SSH2UserCancelException;
    public String[] promptMultiFull(String name, String instruction,
				    String[] prompts, boolean[] echos)
	throws SSH2UserCancelException;
    public int promptList(String name, String instruction, String[] choices)
	throws SSH2UserCancelException;
}
