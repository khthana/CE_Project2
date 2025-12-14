
package terminal;

public class TerminalCharsetFactory {
    public static TerminalCharsetTranslator create(String charset)
	throws TerminalCharsetException {
	if (charset.equals("none")) {
	    return null;
	} else if (charset.equals("vga")) {
	    return new TerminalCharsetVGA();
	}
	throw new TerminalCharsetException();
    }
}
