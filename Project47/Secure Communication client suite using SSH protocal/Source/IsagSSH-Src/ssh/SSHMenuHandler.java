package ssh;

import java.awt.Frame;
import java.awt.MenuBar;
import java.awt.PopupMenu;

import application.MindTerm;
import terminal.TerminalMenuListener;
import terminal.TerminalMenuHandler;
import terminal.TerminalWin;

public class SSHMenuHandler implements TerminalMenuListener {
    boolean havePopupMenu = false;

    public void init(MindTerm mindterm, SSHInteractiveClient client, Frame parent, TerminalWin term) {
    }
    public void update() {
    }
    public void close(TerminalMenuHandler originMenu) {
    }
    public void setPopupButton(int popButtonNum) {
    }
    public void prepareMenuBar(MenuBar mb) {
    }
    public void preparePopupMenu(PopupMenu popupmenu) {
    }
    public int getPopupButton() {
	return 0;
    }
    public boolean confirmDialog(String message, boolean defAnswer) {
	return false;
    }
    public void alertDialog(String message) {
    }
    public void textDialog(String head, String text, int rows, int cols, boolean scrollbar) {
    }
}
