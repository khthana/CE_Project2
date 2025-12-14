package com.musicinc.impl.mediastream;

import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.net.*;
import java.io.*;
import org.ogso.service.ui.*;
import org.ogso.service.micropayment.*;

class PlayListModel extends AbstractTableModel {
	Vector results = null;
	PlayListModel() {
		results = new Vector();
	}
	public int getRowCount() {
		return results.size();
	}
	public int getColumnCount() {
		return 3;
	}
	public Object getValueAt(int row, int column) {
		return ((String[]) results.get(row))[column];
	}
	public boolean isCellEditable(int row, int col) {
		return false;
	}
	public void add(String title, String artist, String cost, String fileURL) {
		String[] rec = new String[]{title, artist, cost, fileURL};
		results.addElement(rec);
		fireTableDataChanged();
	}
	public void remove(int[] index) {
		if (index==null || index.length==0) return;
		Arrays.sort(index);
		// remove in decending order so the indices of the other elements are not corrupted
		for (int i=index.length-1;i>=0;i--) results.remove(index[i]);
		fireTableDataChanged();
	}
	public void clear() {
		results.clear();
		fireTableDataChanged();
	}
	public String getTitle(int index) {
		return ((String[]) results.get(index))[0];
	}
	public String getArtist(int index) {
		return ((String[]) results.get(index))[1];
	}
	public String getFileURL(int index) {
		return ((String[]) results.get(index))[3];
	}
	public int getCost(int index) {
		try {
			return Integer.parseInt(((String[])results.get(index))[2]);
		} catch (NumberFormatException e) {
			return 0;
		}
	}
}

public class PlayListPanel implements ActionListener, Runnable {
	JPanel panel = null;
	JTable playList = null;
	PlayListModel plm = null;
	String[] columnName = new String[]{"Title", "Artist", "Cost"};
	JLabel cost = null;
	JButton remove = null;
	JButton play = null;
	PanelController pc = null;
	Thread t = null;
	MicroPaymentService mps = null;
	int totalCost = 0;
	public PlayListPanel (UIService uis, PanelController pc, MicroPaymentService mps) throws UIService.UIServiceException {
		pc.set(this);
		this.pc = pc;
		this.mps = mps;
		panel = uis.registerPanel("MUSIC-CONNECTED INC: Playlist",null);
		// draw the search pane
		GridBagLayout gridbag = new GridBagLayout();
		GridBagConstraints c = new GridBagConstraints();
		panel.setFont(new Font("Helvetica", Font.PLAIN, 10));
		panel.setLayout(gridbag);
		c.fill = GridBagConstraints.BOTH;
		c.weightx = 0;
		// add the header text
		JTextArea header = new JTextArea("The following tracks are currently in your playlist. To remove any track select it and press 'Remove'. To add the entire playlist to the queue press 'ADD TO PLAY QUEUE'. You will be prompted to authorise any charges after pressing 'ADD TO PLAY QUEUE'.");
		header.setOpaque(false);
		header.setEditable(false);
		header.setLineWrap(true);
		header.setWrapStyleWord(true);
		header.setHighlighter(null);
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 10;
		gridbag.setConstraints(header, c);
		panel.add(header);
		// add the play list table
		plm = new PlayListModel();
		playList = new JTable(plm);
		playList.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		playList.setColumnSelectionAllowed(false);
		playList.setDragEnabled(false);
		playList.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
		// format the table columns to look pretty
		int[] columnWidth = new int[] {123, 123, 38};
		TableColumnModel tcm = playList.getColumnModel();
		for (int i=0;i<3;i++) {
			TableColumn col = tcm.getColumn(i);
			col.setHeaderValue(columnName[i]);
			col.setIdentifier(columnName[i]);
			col.setPreferredWidth(columnWidth[i]);
		}
		JScrollPane scrollpane = new JScrollPane(playList);
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 100;
		c.weightx=1;
		c.weighty=1;
		gridbag.setConstraints(scrollpane, c);
		panel.add(scrollpane);
		// add the cost report label
		cost = new JLabel("<html><FONT SIZE=+2><B>Cost: <FONT COLOR=red>0 Baht</font></B></FONT></html>");
		c.gridheight = 10;
		c.weightx=0;
		c.weighty=0;
		gridbag.setConstraints(cost, c);
		panel.add(cost);
		// add the remove button
		remove = new JButton("Remove");
		c.gridwidth = 20;
		gridbag.setConstraints(remove, c);
		remove.addActionListener(this);
		panel.add(remove);
		// add the play button
		play = new JButton("ADD TO PLAY QUEUE");
		c.weightx=2;
		c.gridwidth = GridBagConstraints.REMAINDER;
		gridbag.setConstraints(play, c);
		play.addActionListener(this);
		panel.add(play);
	}
	public void disable() {
		remove.setEnabled(false);
		play.setEnabled(false);
	}
	public void enable() {
		remove.setEnabled(true);
		play.setEnabled(true);
	}
	public void addTrack(String title, String artist, String cost, String fileURL) {
		plm.add(title, artist, cost, fileURL);
		calculateCost();
	}
	public void calculateCost() {
		totalCost=0;
		for (int i=0; i<plm.getRowCount();i++)totalCost+=plm.getCost(i);
		cost.setText("<html><FONT SIZE=+2><B>Cost: <FONT COLOR=red>"+ totalCost + " Baht</font></B></FONT></html>");
	}
	public void actionPerformed(ActionEvent evt) {
		Object src = evt.getSource();
		if (src==remove) {
			plm.remove(playList.getSelectedRows());
			calculateCost();
		} else if (src==play) {
				if (plm.getRowCount()!=0) {
					pc.disable();
					t = new Thread(this);
					t.start();
				}
		}
	}
	public void run() {
		if (totalCost==0 || mps.makeCharge("Selection of " +plm.getRowCount() + " audio tracks delivered direct from the media streaming service.", "00000002", "MUSIC-CONNECTED Inc.",totalCost)) {
		//charge successfull, allow access to the content
			for (int i=0;i<plm.getRowCount();i++)pc.queueTrack(plm.getTitle(i),plm.getArtist(i),plm.getFileURL(i));
		}
		plm.clear();
		calculateCost();
		pc.enable();
	}
}