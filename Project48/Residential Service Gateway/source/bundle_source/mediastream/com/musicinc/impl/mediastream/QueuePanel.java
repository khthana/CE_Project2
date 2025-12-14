package com.musicinc.impl.mediastream;

import org.ogso.service.estereo.*;
import org.ogso.service.ui.*;
import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.util.*;
import javax.sound.sampled.*;
import javazoom.spi.vorbis.sampled.file.*;
import javazoom.spi.vorbis.sampled.convert.*;
import java.net.*;
import java.io.*;

class QueueModel extends AbstractTableModel {
	Vector results = null;
	QueueModel() {
		results = new Vector();
	}
	public int getRowCount() {
		return results.size();
	}
	public int getColumnCount() {
		return 2;
	}
	public Object getValueAt(int row, int column) {
		return ((String[]) results.get(row))[column];
	}
	public boolean isCellEditable(int row, int col) {
		return false;
	}
	public void add(String title, String artist, String fileURL) {
		String[] rec = new String[]{title, artist, fileURL};
		results.addElement(rec);
		fireTableDataChanged();
	}
	public void remove() {
		if (results.size()!=0) results.remove(0);
		fireTableDataChanged();
	}
	public boolean isEmpty() {
		return results.size()==0;
	}
	String getTitle() {
		return ((String[])results.elementAt(0))[0];
	}
	String getArtist() {
		return ((String[])results.elementAt(0))[1];
	}
	String getFileURL() {
		return ((String[])results.elementAt(0))[2];
	}
}

public class QueuePanel implements EStereoEventListener {
	UIService uis = null;
	EStereoDevice esd = null;
	QueueModel qm = null;
	JPanel panel = null;
	JTable queue = null;
	boolean playing = false;
	PanelController pc = null;
	String[] columnName = new String[] {"Artist", "Title"};
	JLabel[] np_label = null;
	String[] np_labelname = { "<html><font size=+1>Now Playing...</font></html>","<html><font size=+1 color=blue>Artist: <b><i>None</i></b></font></html>","<html><font size=+1 color=blue>Title: <b><i>None</i></b></font></html>" };
	public QueuePanel(UIService uis, PanelController pc, EStereoDevice esd) throws UIService.UIServiceException {
		this.uis=uis;
		this.esd=esd;
		this.pc=pc;
		pc.set(this);
		panel=uis.registerPanel("MUSIC-CONNECTD INC: Queue", null);
		GridBagLayout gridbag = new GridBagLayout();
		GridBagConstraints c = new GridBagConstraints();
		panel.setFont(new Font("Helvetica", Font.PLAIN, 10));
		panel.setLayout(gridbag);
		qm=new QueueModel();
		queue=new JTable(qm);
		queue.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		queue.setColumnSelectionAllowed(false);
		queue.setRowSelectionAllowed(false);
		queue.setDragEnabled(false);
		// format the table columns to look pretty
		int[] columnWidth = new int[] {142,142};
		TableColumnModel tcm = queue.getColumnModel();
		for (int i=0;i<2;i++) {
			TableColumn col = tcm.getColumn(i);
			col.setHeaderValue(columnName[i]);
			col.setIdentifier(columnName[i]);
			col.setPreferredWidth(columnWidth[i]);
		}
		JScrollPane scrollpane = new JScrollPane(queue);
		c.fill = GridBagConstraints.BOTH;
		c.gridwidth = GridBagConstraints.REMAINDER;
		c.gridheight = 400;
		c.weighty = 1;
		c.weightx = 1;
		gridbag.setConstraints(scrollpane, c);
		panel.add(scrollpane);
		// add the now playing labels
		np_label = new JLabel[3];
		c.gridheight=10;
		c.weightx=0;
		c.weighty=0;
		for (int i=0;i<3;i++) {
			np_label[i]=new JLabel(np_labelname[i]);
			gridbag.setConstraints(np_label[i],c);
			panel.add(np_label[i]);
		}
	}
	public void EStereoEvent(AudioInputStream ais, boolean suceeded) {
		// if there is still a track in the queue, open it and play it
		if (!suceeded) {
			System.err.println("Mediastream service failed to play a track! *gasp*");
			// change the 'now playing' text back to the defaults
			np_label[1].setText("<html><font size=+1 color=blue>Artist: <B><I>None</i></b></font></html>"); 
			np_label[2].setText("<html><font size=+1 color=blue>Title: <B><I>None</i></b></font></html>");
		}
		synchronized(queue) {
			playing=false;
			qm.remove();
		}
		playNextTrack();
	}
	public void playNextTrack() {
		synchronized(queue) {
			if (playing) return;
			if (qm.isEmpty()) {
				playing=false;
				// set the now playing text to the defaults
				for (int i=1;i<3;i++) np_label[i].setText(np_labelname[i]);
				return;
			}
			playing=true;
		}
		// get a URL and get an audio input stream from the off
		try {
			URL media = new URL(qm.getFileURL());
			// change the 'now playing' text
			np_label[1].setText("<html><font size=+1 color=blue>Artist: <B><I>" + qm.getArtist() + "</i></b></font></html>");
			np_label[2].setText("<html><font size=+1 color=blue>Title: <B><I>" + qm.getTitle() + "</i></b></font></html>");
			VorbisAudioFileReader vafr = new VorbisAudioFileReader();
			InputStream is = media.openStream();
			AudioInputStream ais = vafr.getAudioInputStream(is);
			// convert it to something sane
			VorbisFormatConversionProvider vfcp = new VorbisFormatConversionProvider();
			AudioInputStream cais = vfcp.getAudioInputStream(new AudioFormat(44100, 16, 2, true, false), ais);
			// play it
			esd.play(cais, this);
		} catch (UnsupportedAudioFileException e) {
			System.err.println("Unsupported audio file exception");
		} catch (MalformedURLException e) {
			System.err.println("Malformed URL Exception occured?! Check your URLS ["+qm.getFileURL()+"]:"+e.toString());
		} catch (IOException e) {
			System.err.println("IOException when trying to open the URL "+qm.getFileURL()+" : "+e.toString());
		}
	}
	public void queueTrack(String title, String artist, String fileURL) {
		qm.add(title,artist,fileURL);
		playNextTrack();
	}
}