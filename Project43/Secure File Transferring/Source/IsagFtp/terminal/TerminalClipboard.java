package IsagFtp.terminal;

public interface TerminalClipboard {
    public void   setSelection(String selection);
    public String getSelection();
    public void   selectionAvailable(boolean val);
}
