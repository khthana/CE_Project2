
package gui;

import java.awt.Frame;
import java.awt.Dialog;
import java.awt.Component;
import java.awt.Insets;
import java.awt.Label;
import java.awt.Panel;
import java.awt.Button;
import java.awt.TextArea;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public final class ConfirmDialog extends Dialog implements ActionListener {

    private boolean confirmRet;
    private String  yesLbl;

    private ConfirmDialog(String title, Frame parent, String yesLbl) {
	super(parent, title, true);
	this.yesLbl = yesLbl;
    }

    public static synchronized boolean show(String title, String message,
					    boolean defAnswer, Frame parent)
    {
	return show(title, message, 0, 0, "Yes", "No", defAnswer, parent,
		    false);
    }

    public static boolean show(String title, String message,
			       int rows, int cols,
			       String yesLbl, String noLbl,
			       boolean defAnswer, Frame parent,
			       boolean scrollbar) {
	return show(title, message, rows, cols, yesLbl, noLbl, defAnswer,
		    parent, false, scrollbar);
    }

    public static boolean show(String title, String message,
			       int rows, int cols,
			       String yesLbl, String noLbl,
			       boolean defAnswer, Frame parent,
			       boolean xscroll, boolean yscroll) {
	ConfirmDialog  confirmDialog;
	Component      confirmText;
	Button         yesBut, noBut;

	confirmDialog = new ConfirmDialog(title, parent, yesLbl);

	AWTGridBagContainer grid = new AWTGridBagContainer(confirmDialog);

	grid.getConstraints().fill   = GridBagConstraints.HORIZONTAL;
	grid.getConstraints().anchor = GridBagConstraints.CENTER;
	grid.getConstraints().insets = new Insets(8, 4, 4, 8);

	if(rows == 0 || cols == 0) {
	    confirmText = new Label(message);
	} else {
	    int scrollbars;
	    if (xscroll && yscroll) {
		scrollbars = TextArea.SCROLLBARS_BOTH;
	    } else if (xscroll) {
		scrollbars = TextArea.SCROLLBARS_HORIZONTAL_ONLY;
	    } else if (yscroll) {
		scrollbars = TextArea.SCROLLBARS_VERTICAL_ONLY;
	    } else {
		scrollbars = TextArea.SCROLLBARS_NONE;
	    }
	    TextArea ta = new TextArea(message, rows, cols, scrollbars);
	    ta.setEditable(false);
	    confirmText = ta;
	}
	grid.add(confirmText, 0, GridBagConstraints.REMAINDER);

	Panel bp = new Panel(new FlowLayout());

	bp.add(yesBut = new Button(yesLbl));

	yesBut.addActionListener(confirmDialog);

	bp.add(noBut = new Button(noLbl));
	noBut.addActionListener(confirmDialog);

	grid.add(bp, 1, GridBagConstraints.REMAINDER);

	confirmDialog.addWindowListener(new AWTConvenience.CloseAdapter(noBut));

	confirmDialog.setResizable(true);
	confirmDialog.pack();

	AWTConvenience.placeDialog(confirmDialog);

	if(defAnswer)
	    yesBut.requestFocus();
	else
	    noBut.requestFocus();

	confirmDialog.setVisible(true);

	return confirmDialog.confirmRet;
    }

    public void actionPerformed(ActionEvent e) {
	if(e.getActionCommand().equals(yesLbl))
	    confirmRet = true;
	else
	    confirmRet = false;
	this.setVisible(false);
    }

}
