import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import org.jpedal.PdfDecoder;
import java.io.*;
import java.net.*;
import java.util.*;

public class PdfDisplayPanel extends PdfDecoder {
	
   private int pagecurrent = 1,numberofpage;
   private float zoomlevel[] = {.25f,.5f,.75f,1.0f,1.25f,1.5f,2.0f,2.5f,5.0f,7.5f,10.0f};
   private int izoom = 5;
   private JScrollPane pdfpanel;
   private Point points[] = new Point[10000];
   protected DataOutputStream dout;
   private Vector vpoints;
   private int apc[];
  
	public PdfDisplayPanel() {
		try {
      	Init();
    	} catch(Exception e) { e.printStackTrace(); }
	}

  	public PdfDisplayPanel(Socket sock) {
    	try {
      	dout = new DataOutputStream(sock.getOutputStream());
      	Init();
    	} catch(Exception e) { e.printStackTrace(); }
  	}
	
	
	
	
	public void Init() throws Exception {
	   setBackground(Color.gray);
	   pdfpanel = new JScrollPane(this,JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	   setLayout(new BorderLayout());
	   
	   //MouseListeners mouselisteners = new MouseListeners();
	   //addMouseMotionListener(mouselisteners);
	}
	// Open pdf file without file path [overload method]
	public void OpenFile(ByteArrayOutputStream b) {
    	try {
	    	pagecurrent = 1;
	      setInset(9,9);  // x,y start position in panel
	      openPdfArray(b.toByteArray()); // read file from byte stream
	      if ((isEncrypted())&&(!isFileViewable()))
	        return;
	      setExtractionMode(0,72,1);
	      decodePage(pagecurrent);  // Display page
	      setPageParameters(zoomlevel[izoom],pagecurrent); // Set zoom size
	      Rerender();
	      pdfpanel.getViewport().add(this);
	      numberofpage = getNumberOfPages();
	      setVector(numberofpage);
    	} catch(Exception e) { e.printStackTrace(); }
  	}
  	// Open pdf file with file path and file name [overload method]
  	public void OpenFile(String filename) {
    	try {
	    	pagecurrent = 1;
	      setInset(9,9);  // x,y start position in panel
	      openPdfFile(filename); // read file from file name
	      if ((isEncrypted())&&(!isFileViewable()))
	        return;
	      setExtractionMode(0,72,1);
	      setPageParameters(1,1);
	      decodePage(pagecurrent);  // Display page
	      setPageParameters(zoomlevel[izoom],pagecurrent); // Set zoom size
	      Rerender();
	      pdfpanel.getViewport().add(this);
	      numberofpage = getPageCount();
	      setVector(numberofpage);
    	} catch(Exception e) { e.printStackTrace(); }
  	}
  	// Rerender panel
  	public void Rerender() {
    	invalidate();
    	repaint();  // pdf file
    	validate();
  	}
  	// set Pointer to use each page
  	private void setVector(int p) {
  	 	vpoints = new Vector();
  	 	apc = new int[p];
  	 	for(int i=0;i<p;i++) {
  	 		vpoints.addElement(new Point[10000]);
  	 		apc[i] = 0;
  	 	}
  	}
  	// Use for get page current
  	public int getPageCurrent() { return pagecurrent; }
  	// Return Number of page
  	public int getNumberOfPage() { return numberofpage; }
  	
  	// Mark current page on pdf panel
  	public void Mark() {
  		Graphics g = getGraphics();
  		if( g != null) {
  			g.setColor(Color.RED);
     		for(int i = 0;i < points.length;i++) {
     			if(points[i] != null) {
     				g.fillOval(points[i].x,points[i].y,8,8);
     			} else break;
     		}
  		}
  	}
  	// Return Graphics g to client thread
  	public Graphics getDrawPanel() {
    	return this.getGraphics();
  	}
  	// Set scrollpane down
  	public void scrollDown() {
 		JScrollBar jsb = pdfpanel.getVerticalScrollBar();
    	jsb.setValue(jsb.getValue() + 50);
    	pdfpanel.setVerticalScrollBar(jsb);
  	}
  	// Set scrollpane up
  	public void scrollUp() {
    	JScrollBar jsb = pdfpanel.getVerticalScrollBar();
    	jsb.setValue(jsb.getValue() - 50);
    	pdfpanel.setVerticalScrollBar(jsb);
  	}
  	// Set scrollpane left
  	public void scrollLeft() {
    	JScrollBar jsb = pdfpanel.getHorizontalScrollBar();
    	jsb.setValue(jsb.getValue() - 50);
    	pdfpanel.setHorizontalScrollBar(jsb);
  	}
  	// Set scrollpane right
  	public void scrollRight() {
    	JScrollBar jsb = pdfpanel.getHorizontalScrollBar();
    	jsb.setValue(jsb.getValue() + 50);
    	pdfpanel.setHorizontalScrollBar(jsb);
  	}
  	// Use for goto next page
  	public void Next() {
    	try {
      	if(this != null) {
        		pagecurrent += 1;
        		if(pagecurrent > numberofpage)
          		pagecurrent = numberofpage;
        		decodePage(pagecurrent);  // Display next page
        		Rerender();
      	}
    	} catch(Exception e) { e.printStackTrace(); }
  	}
  	// Use for goto prev. page
  	public void Back() {
    	try {
      	if(this != null) {
        		pagecurrent -= 1;
        		if(pagecurrent < 1)
          		pagecurrent = 1;
        		decodePage(pagecurrent);  // Display next page
        		Rerender();
      	}
    	} catch(Exception e) { e.printStackTrace(); }
  	}
  	// Use for zoom in page
  	public void ZoomIn() {
    	if(this != null) {
      	try {
        		izoom +=1;
        		setPageParameters(zoomlevel[izoom],pagecurrent); // Parameter (zoom,page)
        		Rerender();
      	} catch(Exception e) { izoom -= 1; }
    	}
  	}
  	// Use for zoom out page
  	public void ZoomOut() {
    	if(this != null) {
      	try {
        		izoom -=1;
        		setPageParameters(zoomlevel[izoom],pagecurrent); // Parameter (zoom,page)
        		Rerender();
      	} catch(Exception e) { izoom += 1; }
    	}
  	}
  	// Close pdf in pdf panel
  	public void closePDF() {
  		try{
  			closePdfFile();
  		} catch(Exception e) { e.printStackTrace(); }
  	}
  	// Use for set page or jump to page follow page parameter
  	public void setPage(int page) {
    	try {
      	if(this != null) {
        		this.pagecurrent = page;
        		decodePage(pagecurrent);  // Display page
        		Rerender();
      	}
    	} catch(Exception e) { e.printStackTrace(); }
  	}

  	
  	/*class MouseListeners implements MouseMotionListener,MouseListener {
    	public void mouseDragged(MouseEvent e) {
      	try {
        		points = (Point[])vpoints.elementAt(pagecurrent);
        		if (apc[pagecurrent] < points.length) {
          		points[apc[pagecurrent]] = e.getPoint();
          		++apc[pagecurrent];
          		Mark();
          		//WriteData(e.getX(),e.getY());
        		}
      	} catch(Exception ex) { ex.printStackTrace(); }
    	}
    	public void mouseClicked(MouseEvent e) { }
    	public void mouseMoved(MouseEvent e) { 
	    	//Rectangle rectangle = new Rectangle(e.getX()-50,e.getY()-50,100,100);
	      //if(!getVisibleRect().contains(rectangle))
	      	//scrollRectToVisible(rectangle);
    	}
    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
   	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  	}*/
}