import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;

public class EditorPanel extends JPanel {
	
	private JPanel menu = new JPanel();
	private JLabel b1,b2,b3,b4;
	private ImageIcon icob1,icob2,icob3,icob4;
	private JTextPane editpane = new JTextPane();
	private JScrollPane sedit = new JScrollPane(editpane);
	private Socket sock;
	private byte[] buff;
		private DataInputStream din;
  	private DataOutputStream dout;
	private myMessageBox mybox = new myMessageBox();
	
	public EditorPanel(Socket sock) {
	try {
		this.sock = sock;
      Init();
    } catch(Exception e) { e.printStackTrace(); }
	}
	
	private void Init() throws Exception {
		din = new DataInputStream(this.sock.getInputStream());
      dout = new DataOutputStream(this.sock.getOutputStream());
		editpane.setFont(new Font("tahoma.ttf",0,15));

		icob1 = new ImageIcon(EditorPanel.class.getResource("clear.png"));
		icob2 = new ImageIcon(EditorPanel.class.getResource("save.png"));
		icob3 = new ImageIcon(EditorPanel.class.getResource("savedb.png"));
		icob4 = new ImageIcon(EditorPanel.class.getResource("load.png"));
		b1 = new JLabel(icob1); b2 = new JLabel(icob2); b3 = new JLabel(icob3);
		b4 = new JLabel(icob4);
		
		menu.add(b1); menu.add(b2); menu.add(b4); menu.add(b3);
		menu.setBackground(Color.WHITE);
		
		setLayout(new BorderLayout());
		add(sedit,BorderLayout.CENTER);
		add(menu,BorderLayout.SOUTH);
		
		MouseListeners mouselistener = new MouseListeners();
    	b1.addMouseListener(mouselistener);
    	b2.addMouseListener(mouselistener);
    	b3.addMouseListener(mouselistener);
    	b4.addMouseListener(mouselistener);
	}
	// send file pdf to client
  	public synchronized void sendPdf() throws Exception {
  		buff = OpenPDFStream();
      dout.writeInt(21);
      dout.writeInt(buff.length);
      dout.write(buff);
  	}
  	// read file from pdf file to byte[]
  	private byte[] OpenPDFStream() throws Exception {
    	FileInputStream file = new FileInputStream("system.dat");
    	int filesize = file.available();
    	byte[] bytedata = new byte[filesize];
    	file.read(bytedata,0,filesize);
    	file.close();
    	return bytedata;
  	}
  	
  	private void saveText() throws IOException {
  		FileWriter fw = new FileWriter("report.inf");
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(editpane.getText());
		bw.close();
  	}
  	
  	private void loadText() throws IOException {
  		FileReader fr = new FileReader("report.inf");
		BufferedReader br = new BufferedReader(fr);
		
		String tmp,data = "";
		while((tmp = br.readLine()) != null) {
			data += tmp;
		}
		editpane.setText(data);
		br.close();
  	}
	
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) {
	    	try {
	    		if(e.getSource() == b1) {
	    			editpane.setText("");
	    		} else if(e.getSource() == b2) {
	    			saveText();
	    			StringToPDF.createPDF("system.dat",editpane.getText());
	    			mybox.setText("จัดเก็บข้อมูลเรียบร้อยแล้ว",22);
	    			mybox.showBox();
	    		} else if(e.getSource() == b3) {
	    			saveText();
	    			StringToPDF.createPDF("system.dat",editpane.getText());
	    			sendPdf();
	    			mybox.setText("จัดเก็บข้อมูลลงฐานข้อมูลเรียบร้อยแล้ว",20);
	    			mybox.showBox();
	    		} else if(e.getSource() == b4) {
	    			loadText();
	    		}
	    	} catch(Exception ex) { }
	    }
	    public void mouseEntered(MouseEvent e) { }
	    public void mouseExited(MouseEvent e) { }
	    public void mousePressed(MouseEvent e) { }
	    public void mouseReleased(MouseEvent e) { }
  	}
  	
  	
} // end of class