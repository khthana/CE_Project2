
package gui;

import java.awt.Frame;
import java.awt.Dialog;
import java.awt.Button;
import java.awt.Insets;
import java.awt.GridBagConstraints;

public final class AlertDialog {

    public static void show(String title, String message, Frame parent) {

	Dialog alertDialog = null;
	MultiLineLabel  alertLabel;
	Button okAlertBut;

	alertDialog = new Dialog(parent, title, true);

	AWTGridBagContainer grid = new AWTGridBagContainer(alertDialog);

        grid.getConstraints().weightx = 1.0;
	grid.getConstraints().fill    = GridBagConstraints.HORIZONTAL;
	grid.getConstraints().anchor  = GridBagConstraints.CENTER;
	grid.getConstraints().insets  = new Insets(8, 4, 4, 8);

	alertLabel = new MultiLineLabel(message, 2, 2);
	grid.add(alertLabel, 0, GridBagConstraints.REMAINDER);

	okAlertBut = new Button("OK");
	okAlertBut.addActionListener(new AWTConvenience.CloseAction(alertDialog));

        grid.getConstraints().weightx = 0.0;
	grid.getConstraints().fill    = GridBagConstraints.NONE;
	grid.getConstraints().insets  = new Insets(8, 4, 4, 8);
	grid.add(okAlertBut, 1, GridBagConstraints.REMAINDER);

	alertDialog.addWindowListener(new AWTConvenience.CloseAdapter(okAlertBut));

	alertDialog.setResizable(true);
	alertDialog.setTitle(title);
	alertDialog.pack();

	AWTConvenience.placeDialog(alertDialog);
	okAlertBut.requestFocus();
	alertDialog.setVisible(true);
    }

}

