package com.bill4u.impl.micropayments;

import java.awt.event.*;
import javax.swing.*;
import java.awt.*;

public class PinPanel extends JPanel implements ActionListener {
	private JTextField pindisplay = new JTextField(10); //PIN display area
	private JButton[] buttons = new JButton[12];
	private JPanel buttonPanel = new JPanel(new GridLayout(4, 3));
	private int length;
	private ActionListener al = null;
	public static final int OK_PRESSED = 1;
	public PinPanel(int length) {
		super(new BorderLayout());
		this.length = length;
		// configure and add the PIN display area
		pindisplay.setEditable(false);
		pindisplay.setFont(new Font(this.getFont().getName(),Font.BOLD, 24));
		pindisplay.setHorizontalAlignment(SwingConstants.CENTER);
		pindisplay.setBackground(new Color(196, 255, 232)); 
		pindisplay.setHighlighter(null);
		pindisplay.setSize(200, 400);
		add(pindisplay, BorderLayout.NORTH);
		// add buttons 1-9 to PinPanel
		for (int i=1; i<=9; i++) {
			buttons[i] = new JButton(Integer.toString(i));
			buttons[i].addActionListener(this);
			buttonPanel.add(buttons[i]);
		}
		// add DEL button
		buttons[10] = new JButton("DEL");
		buttons[10].addActionListener(this);
		buttonPanel.add(buttons[10]);
		// add 0 button
		buttons[0] = new JButton("0");
		buttons[0].addActionListener(this);
		buttonPanel.add(buttons[0]);
		// add OK button
		buttons[11] = new JButton("OK");
		buttons[11].addActionListener(this);
		buttonPanel.add(buttons[11]);
		// add buttonPanel
		add(buttonPanel, BorderLayout.CENTER);
	}
	public void actionPerformed(ActionEvent evt) {
		Object src = evt.getSource();
		if (src == buttons[1]) {
			updateDisplay("1");
		} else if (src == buttons[2]) {
			updateDisplay("2");
		} else if (src == buttons[3]) {
			updateDisplay("3");
		} else if (src == buttons[4]) {
			updateDisplay("4");
		} else if (src == buttons[5]) {
			updateDisplay("5");
		} else if (src == buttons[6]) {
			updateDisplay("6");
		} else if (src == buttons[7]) {
			updateDisplay("7");
		} else if (src == buttons[8]) {
			updateDisplay("8");
		} else if (src == buttons[9]) {
			updateDisplay("9");
		} else if (src == buttons[0]) {
			updateDisplay("0");
		} else if (src == buttons[10]) {
			updateDisplay("DEL");
		} else if (src == buttons[11]) {
			updateDisplay("OK");
		} else {
			updateDisplay("ERR");
		}
	}
	public void updateDisplay(String s) {
		if (s.equals("ERR")) {
			pindisplay.setText("Error!");
		} else if (s.equals("OK")) {
			ActionEvent okPress = new ActionEvent(this,OK_PRESSED, null);
			if (al != null) al.actionPerformed(okPress);
		} else if (s.equals("DEL")) {
			if (pindisplay.getText() != null &&pindisplay.getText().length() > 0) pindisplay.setText(pindisplay.getText().substring(0, pindisplay.getText().length()-1));
		} else if (pindisplay.getText().length() < length)pindisplay.setText(pindisplay.getText() + s);
	}

	public void setActionListener(ActionListener al) {
		this.al = al;
	}
	public String getPin() {
		return pindisplay.getText();
	}
	public void setEnabled(boolean b) {
		super.setEnabled(b);
		for (int i=0;i<buttons.length;i++) buttons[i].setEnabled(b);
	}
	public void clearPin() {
		pindisplay.setText("");
	}
}