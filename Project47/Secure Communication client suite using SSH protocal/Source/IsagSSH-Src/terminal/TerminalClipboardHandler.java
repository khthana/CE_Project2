
package terminal;

public interface TerminalClipboardHandler {
    public void   setSelection(String selection);
    public String getSelection();
    public void   clearSelection();
}
