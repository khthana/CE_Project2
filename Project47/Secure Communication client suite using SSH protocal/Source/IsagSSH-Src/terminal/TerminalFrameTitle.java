package terminal;

import java.awt.Frame;

public class TerminalFrameTitle extends TerminalInputAdapter {

    private TerminalWin terminal;
    private Frame       frame;
    private String      titleName;

    public TerminalFrameTitle(Frame frame, String titleName)
    {
	this.frame     = frame;
	this.titleName = titleName;
    }

    public void attach(TerminalWin terminal) {
	this.terminal = terminal;
	setTitleName(titleName);
	terminal.addInputListener(this);
    }

    public void detach() {
	terminal.removeInputListener(this);
	terminal = null;
    }

    public void setTitleName(String titleName) {
	this.titleName = titleName;
	if(terminal != null) {
	    signalWindowChanged(terminal.rows(), terminal.cols(),
				terminal.vpixels(), terminal.hpixels());
	}
    }

    public void signalWindowChanged(int rows, int cols,
				    int vpixels, int hpixels) {
	String title = terminal.getTitle();
	if(title == null) {
	    title = titleName;
	}
	title += " [" + cols + "x" + rows + "]";
	frame.setTitle(title);
    }

}
