package com.musicinc.impl.mediastream;

import com.Ostermiller.util.Base64;
import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.net.*;
import java.io.*;
import org.ogso.service.ui.*;

class ButtonImageFactory {
	public final static int DELETE = -1;
	public final static int SEARCH = -2;

}

class TableModel extends AbstractTableModel {
	SearchResponse resp = null;
	TableModel() {
	}
	public int getRowCount() {
		if (resp == null) return 0;
		else return resp.getNumTracks();
	}
	public int getColumnCount() {
		return 5;
	}
	public Object getValueAt(int row, int column) {
		switch(column) {
			case 0 : return resp.getTitle(row);
			case 1 : return resp.getArtist(row);
			case 2 : return resp.getAlbum(row);
			case 3 : return resp.getGenre(row);
			case 4 : return resp.getCost(row);
			default: return null;
		}
	}
	public boolean isCellEditable(int row, int col) {
		return false;
	}
	public void setResponse(SearchResponse resp) {
		this.resp = resp;
		fireTableDataChanged();
	}
	public SearchResponse getResponse() {
		return resp;
	}
	public String[] getTrackInfo(int index) {
		return resp.getFields(index);
	}
}

public class TrackSelectorPanel implements ActionListener, MouseListener, Runnable{
	JPanel panel = null;
	JTable results = null;
	TableModel tm = null;
	JLabel[] sc_label = null;
	JLabel hits = null;
	JTextField[] sc_textfield = null;
	JButton addToPlayList = null;
	JButton[] button = null;
	int sc_enabled;
	JTextArea header = null;
	static String[] columnName = new String[] {"Title", "Artist", "Album", "Genre", "Cost"};
	PanelController pc = null;
	Color activeBackground = new Color(255, 255, 0);
	Color nonActiveBackground = new Color(255, 255, 232);
	TrackSelectorPanel(UIService uis, PanelController pc) throws UIService.UIServiceException {
		pc.set(this);
		this.pc = pc;
		panel = uis.registerPanel("MUSIC-CONNECTED INC: Search", null);
		// draw the search pane
		GridBagLayout gridbag = new GridBagLayout();
		GridBagConstraints c = new GridBagConstraints();
		panel.setFont(new Font("Helvetica", Font.PLAIN, 10));
		panel.setLayout(gridbag);
		c.fill = GridBagConstraints.BOTH;
		c.weightx = 0;
		// add the header text
		header = new JTextArea("To search for music enter the details below and press 'Search'.");
		header.setOpaque(false);
		header.setEditable(false);
		header.setLineWrap(true);
		header.setWrapStyleWord(true);
		header.setHighlighter(null);
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 10;
		gridbag.setConstraints(header, c);
		panel.add(header);
		// add the table showing results
		tm = new TableModel();
		results = new JTable(tm);
		results.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		results.setColumnSelectionAllowed(false);
		results.setDragEnabled(false);
		results.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
		// format the table columns to look pretty
		int[] columnWidth = new int[] {70, 70, 70, 41, 37};
		TableColumnModel tcm = results.getColumnModel();
		for (int i=0;i<5;i++) {
			TableColumn col = tcm.getColumn(i);
			col.setHeaderValue(columnName[i]);
			col.setIdentifier(columnName[i]);
			col.setPreferredWidth(columnWidth[i]);
		}
		JScrollPane scrollpane = new JScrollPane(results);
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 40;
		c.weightx=1;
		c.weighty=1;
		gridbag.setConstraints(scrollpane, c);
		panel.add(scrollpane);
		// add the button to add secltion to the playlist next to it
		hits = new JLabel("RESULTS: 0");
		c.weightx=0;
		c.weighty=0;
		c.gridheight=10;
		c.gridwidth = 50;
		gridbag.setConstraints(hits, c);
		panel.add(hits);
		addToPlayList = new JButton("Add to Play List");
		addToPlayList.addActionListener(this);
		c.gridwidth = GridBagConstraints.REMAINDER;
		gridbag.setConstraints(addToPlayList, c);
		panel.add(addToPlayList);
		// add the fields for entering search criteria
		sc_label=new JLabel[4];
		sc_textfield=new JTextField[4];
		String sc_label_names[]=new String[]{ "Title","Artist","Album","Genre" };
		for (int i=0;i<4;i++) {
			sc_label[i] = new JLabel(sc_label_names[i]);
			c.gridwidth=20;
			c.gridheight=10;
			gridbag.setConstraints(sc_label[i], c);
			panel.add(sc_label[i]);
			sc_textfield[i] = new JTextField(30);
			sc_textfield[i].addActionListener(this);
			sc_textfield[i].setHighlighter(null);
			sc_textfield[i].addMouseListener(this);
			sc_textfield[i].setEditable(false);
			sc_textfield[i].setBackground(nonActiveBackground);
			c.gridwidth=GridBagConstraints.REMAINDER;
			gridbag.setConstraints(sc_textfield[i], c);
			panel.add(sc_textfield[i]);
		}
		// set the first enabled field to edit
		sc_textfield[0].setBackground(activeBackground);
		sc_enabled=0;
		// create the input buttons
		int[] buttonicon=new int[]
			{1,2,3,ButtonImageFactory.DELETE,4,5,6,ButtonImageFactory.SEARCH,7,8,9,0};
		button=new JButton[12];
		int butno=0;
		for (int y=0;y<3;y++) {
			for (int x=0;x<4;x++,butno++) {
				if (butno==3) button[butno]=new JButton("DEL");
					else if (butno==7) button[butno]=new JButton("SEARCH");
						else button[butno]=new JButton(Integer.toString(buttonicon[butno]));
				button[butno].setBackground(new Color(255,255,255));
				button[butno].addActionListener(this);
				c.weightx=1;
				c.gridwidth=(x==3?GridBagConstraints.REMAINDER:20);
				c.gridheight=10;
				gridbag.setConstraints(button[butno],c);
				panel.add(button[butno]);
			}
		}
	}
	public void disable() {
	addToPlayList.setEnabled(false);
	}
	public void enable() {
	addToPlayList.setEnabled(true);
	}
	public void actionPerformed(ActionEvent evt) {
		Object src = evt.getSource();
		if (src == button[0]) {
			updateDisplay("1");
		} else if (src == button[1]) {
			updateDisplay("2");
		} else if (src == button[2]) {
			updateDisplay("3");
		} else if (src == button[3]) {
			updateDisplay("DEL");
		} else if (src == button[4]) {
			updateDisplay("4");
		} else if (src == button[5]) {
			updateDisplay("5");
		} else if (src == button[6]) {
			updateDisplay("6");
		} else if (src == button[7]) {
			updateDisplay("SEARCH");
		} else if (src == button[8]) {
			updateDisplay("7");
		} else if (src == button[9]) {
			updateDisplay("8");
		} else if (src == button[10]) {
			updateDisplay("9");
		} else if (src == button[11]) {
			updateDisplay("0");
		} else if (src == addToPlayList) {
			int[] selected = results.getSelectedRows();
			for (int i=0;i<selected.length;i++) {
				String[] field = tm.getTrackInfo(selected[i]);
				pc.addTrack(field[SearchResponse.TITLE], field[SearchResponse.ARTIST], field[SearchResponse.COST], field[SearchResponse.FILEURL]);
			}
		}
	}
	public void mouseClicked(MouseEvent evt) {
		Object src = evt.getSource();
		if (src == sc_textfield[0]) {
			updateActiveField(sc_textfield[0], 0);
		} else if (src == sc_textfield[1]) {
			updateActiveField(sc_textfield[1], 1);
		} else if (src == sc_textfield[2]) {
			updateActiveField(sc_textfield[2], 2);
		} else if (src == sc_textfield[3]) {
			updateActiveField(sc_textfield[3], 3);
		}
	}
	public void updateDisplay(String s) {
		int length = 30;
		if (s.equals("SEARCH")) {
			Thread t = new Thread(this);
			t.start();
		} else if (s.equals("DEL")) {
			if (sc_textfield[sc_enabled].getText() != null && sc_textfield[sc_enabled].getText().length() > 0) sc_textfield[sc_enabled].setText(sc_textfield[sc_enabled]. getText().substring(0, sc_textfield[sc_enabled].getText().length()-1));
		} else if (sc_textfield[sc_enabled].getText().length()< length) sc_textfield[sc_enabled].setText(sc_textfield[sc_enabled].getText() + s);
	}

	public void updateActiveField(JTextField activeField, int newActive) {
			if (newActive != sc_enabled) {
				activeField.setBackground(activeBackground);
				sc_textfield[sc_enabled].setBackground(nonActiveBackground);
				sc_enabled=newActive;
			}
	}
	public void mouseEntered(MouseEvent evt) {
		// do nothing - to satisfy interface only
	}
	public void mouseExited(MouseEvent evt) {
		// do nothing - to satisfy interface only
	}
	public void mousePressed(MouseEvent evt) {
		// do nothing - to satisfy interface only
	}
	public void mouseReleased(MouseEvent evt) {
		// do nothing - to satisfy interface only
	}
	public void run() {
		Socket sock = null;
		Object o = null;
		ObjectInputStream ois = null;
		ObjectOutputStream oos = null;
		try {
		sock = new Socket("161.246.5.111",9999);
		sock.setSoTimeout(10000);
		} catch (IOException ioe){
			header.setText("Error contacting content server, please retry by clicking Search again, if the error still exist please contact technical support.");
			System.err.println(ioe.toString());
			return;
		}
		try {
			oos = new ObjectOutputStream(sock.getOutputStream());
			ois = new ObjectInputStream(sock.getInputStream());
			SearchRequest sreq = new SearchRequest(sc_textfield[0].getText(), sc_textfield[1].getText(), sc_textfield[2].getText(), sc_textfield[3].getText());
			oos.writeObject(sreq);
			oos.reset();
			o = ois.readObject();
			if (!o.getClass().getName().equals("com.musicinc.impl.mediastream.SearchResponse")) throw new IOException("Invalid class read!");
		} catch (IOException ioe) {
			header.setText("Error communicating with content server, please retry by clicking Search again, if the error still exist please contact technical support.");
			System.err.println(ioe.toString());
			return;
		} catch (ClassNotFoundException c) {
			header.setText("Error communicating with content server, please retry by clicking Search again, if the error still exist please contact technical support.");
			System.err.println(c.toString());
			return;
		}
		SearchResponse sresp = (SearchResponse) o;
		tm.setResponse(sresp);
		hits.setText("RESULTS: " + sresp.getNumTracks() + " of "+ sresp.getSearchHits());
		try {
		ois.close();
		oos.close();
		sock.close();
		} catch (IOException ioe) {
			System.err.println(ioe.toString());
		}
	}
}