import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import org.jpedal.PdfDecoder;
import java.io.*;
import java.net.*;
import java.util.*;

public class PdfPanel extends JPanel {
  private PdfDecoder pdf;
  private JPanel menupanel;
  private int pagecurrent = 1,numberofpage;
  private float zoomlevel[] = {.25f,.5f,.75f,1.0f,1.25f,1.5f,2.0f,2.5f,5.0f,7.5f,10.0f};
  private int izoom = 5;
  private JLabel bstart,bend,bnext,bback,bzoomin,bzoomout;
  private JLabel bl,br,bu,bd;
  private ImageIcon imgstart,imgend,imgnext,imgback,imgzoomin,imgzoomout;
  private ImageIcon imgl,imgr,imgu,imgd;
  private JScrollPane pdfpanel;
  private Point points[] = new Point[20000];
  protected DataOutputStream dout;
  private Vector vpoints;
  private int apc[];
  private boolean isProjector = false,isPage = false;
  private Graphics g;

  public PdfPanel(boolean isprojector) {
    try {
      if(isprojector) Init(); else InitProjector();
    } catch(Exception e) { e.printStackTrace(); }
  }
  public PdfPanel(Socket sock,boolean isprojector) {
    try {
      dout = new DataOutputStream(sock.getOutputStream());
      if(isprojector) Init(); else InitProjector();
    } catch(Exception e) { e.printStackTrace(); }
  }
  // Use to init client when isproject = true
  private void Init() throws Exception {
    pdf = new PdfDecoder();
    menupanel = new JPanel();
    imgstart = new ImageIcon(PdfPanel.class.getResource("first.png"));
    imgend = new ImageIcon(PdfPanel.class.getResource("last.png"));
    imgnext = new ImageIcon(PdfPanel.class.getResource("next.png"));
    imgback = new ImageIcon(PdfPanel.class.getResource("back.png"));
    imgzoomin = new ImageIcon(PdfPanel.class.getResource("zoomin.png"));
    imgzoomout = new ImageIcon(PdfPanel.class.getResource("zoomout.png"));
    imgl = new ImageIcon(PdfPanel.class.getResource("l.png"));
    imgr = new ImageIcon(PdfPanel.class.getResource("r.png"));
    imgd = new ImageIcon(PdfPanel.class.getResource("d.png"));
    imgu = new ImageIcon(PdfPanel.class.getResource("u.png"));
    bstart = new JLabel(imgstart); bback = new JLabel(imgback);
    bzoomin = new JLabel(imgzoomin); bzoomout = new JLabel(imgzoomout);
    bnext = new JLabel(imgnext); bend = new JLabel(imgend);
    bl = new JLabel(imgl); br = new JLabel(imgr);
    bu = new JLabel(imgu); bd = new JLabel(imgd);
    menupanel.add(bstart); menupanel.add(bback);
    menupanel.add(bzoomin); menupanel.add(bzoomout);
    menupanel.add(bnext); menupanel.add(bend);
    menupanel.add(bl); menupanel.add(br);
    menupanel.add(bu); menupanel.add(bd);
    menupanel.setBackground(Color.WHITE);
    pdf.setBackground(Color.gray);
    pdfpanel = new JScrollPane(pdf,JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    setLayout(new BorderLayout());
    add(pdfpanel,BorderLayout.CENTER);
    add(menupanel,BorderLayout.SOUTH);
    MouseListeners mouselisteners = new MouseListeners();
    bstart.addMouseListener(mouselisteners);
    bback.addMouseListener(mouselisteners);
    bzoomin.addMouseListener(mouselisteners);
    bzoomout.addMouseListener(mouselisteners);
    bnext.addMouseListener(mouselisteners);
    bend.addMouseListener(mouselisteners);
    bl.addMouseListener(mouselisteners);
    br.addMouseListener(mouselisteners);
    bu.addMouseListener(mouselisteners);
    bd.addMouseListener(mouselisteners);
    pdf.addMouseMotionListener(mouselisteners);
  }
  // Use to init projector when isproject = false
  private void InitProjector() {
    pdf = new PdfDecoder();
    pdf.setBackground(Color.gray);
    pdfpanel = new JScrollPane(pdf, JScrollPane.VERTICAL_SCROLLBAR_NEVER,
                               JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    setLayout(new BorderLayout());
    add(pdfpanel, BorderLayout.CENTER);
    MouseListeners mouselisteners = new MouseListeners();
    pdf.addMouseMotionListener(mouselisteners);
  }
  // Open pdf file without file path [overload method]
  public void OpenFile(ByteArrayOutputStream b) {
    try {
    	pagecurrent = 1;
      pdf.setInset(9,9);  // x,y start position in panel
      pdf.openPdfArray(b.toByteArray()); // read file from byte stream
      if ((pdf.isEncrypted())&&(!pdf.isFileViewable()))
        return;
      pdf.setExtractionMode(0,72,1);
      pdf.decodePage(pagecurrent);  // Display page
      pdf.setPageParameters(zoomlevel[izoom],pagecurrent); // Set zoom size
      Rerender();
      pdfpanel.getViewport().add(pdf);
      this.numberofpage = pdf.getPageCount();
      setVector(numberofpage);
    } catch(Exception e) { e.printStackTrace(); }
  }
  // Open pdf file with file path and file name [overload method]
  public void OpenFile(String filename) {
    try {
    	pagecurrent = 1;
      pdf.setInset(9,9);  // x,y start position in panel
      pdf.openPdfFile(filename); // read file from file name
      if ((pdf.isEncrypted())&&(!pdf.isFileViewable()))
        return;
      pdf.setExtractionMode(0,72,1);
      pdf.setPageParameters(1,1);
      pdf.decodePage(pagecurrent);  // Display page
      pdf.setPageParameters(zoomlevel[izoom],pagecurrent); // Set zoom size
      Rerender();
      pdfpanel.getViewport().add(pdf);
      this.numberofpage = pdf.getPageCount();
      setVector(numberofpage);
    } catch(Exception e) { e.printStackTrace(); }
  }
  // set Pointer to use each page
  private void setVector(int p) {
  		p++;
  	 	vpoints = new Vector();
  	 	apc = new int[p];
  	 	for(int i=0;i<p;i++) {
  	 		vpoints.addElement(new Point[20000]);
  	 		apc[i] = 0;
  	 	}
  }
  // set status projector
  public void setProjectorStatus(boolean isProjector) {
  		this.isProjector = isProjector;
  }
  // check status projector
  public boolean getProjectorStatus() {
  		return isProjector;
  }
  // override for super class
  public void paint(Graphics g) {
  	super.paint(g);
  	Mark();
  }
  // return Graphics g to client thread
  public Graphics getDrawPanel() {
    return pdf.getGraphics();
  }
  // Use for close PDF file
  public void closePDF() {
  	try{
  		pdf.closePdfFile();
  	} catch(Exception e) { e.printStackTrace(); }
  }
  // Use for set page or jump to page follow page parameter
  public void setPage(int page) {
    try {
      if(pdf != null) {
        this.pagecurrent = page;
        pdf.decodePage(pagecurrent);  // Display page
        Rerender();
        if(isProjector) {
        		setProjector();
        		sendMark();
        }
      }
    } catch(Exception e) { e.printStackTrace(); }
  }
  // set zoom for projector
  public void setZoom(float zoom) {
  	  if(pdf != null) {
      try {
        pdf.setPageParameters(zoom,pagecurrent); // Parameter (zoom,page)
        Rerender();
      } catch(Exception e) { izoom -= 1; }
    }
  }
  // get zoom for set projector
  public float getZoom() {
  	  return zoomlevel[izoom];
  }
  // set data to projector
  private void setProjector() {
		try {
			dout.writeInt(7);
			dout.writeInt(getPageCurrent());
			dout.writeInt(getScrollBar());
			dout.writeFloat(getZoom());
		} catch(Exception e) { e.printStackTrace(); } 
	}
  // Use for zoom in page
  public void ZoomIn() {
    if(pdf != null) {
      try {
        izoom +=1;
        pdf.setPageParameters(zoomlevel[izoom],pagecurrent); // Parameter (zoom,page)
        Rerender();
        if(isProjector) {
        		setProjector();
        		sendMark();
        }
      } catch(Exception e) { izoom -= 1; }
    }
  }
  // Use for zoom out page
  public void ZoomOut() {
    if(pdf != null) {
      try {
        izoom -=1;
        pdf.setPageParameters(zoomlevel[izoom],pagecurrent); // Parameter (zoom,page)
        Rerender();
        if(isProjector) {
        		setProjector();
        		sendMark();
        }
      } catch(Exception e) { izoom += 1; }
    }
  }
  // Use for goto next page
  public void Next() {
    try {
      if(pdf != null) {
        	pagecurrent += 1;
        	if(pagecurrent > numberofpage)
          	pagecurrent = numberofpage;
        	pdf.decodePage(pagecurrent);  // Display next page
        	JScrollBar jsb = pdfpanel.getVerticalScrollBar();
    		jsb.setValue(0);
    		JScrollBar jsbx = pdfpanel.getHorizontalScrollBar();
    	   jsbx.setValue(0);
        	pdf.repaint();
        	if(isProjector) {
        		setProjector();
        		sendMark();
        }
      }
    } catch(Exception e) { e.printStackTrace(); }
  }
  // Use for goto prev. page
  public void Back() {
    try {
      if(pdf != null) {
        pagecurrent -= 1;
        if(pagecurrent < 1)
          pagecurrent = 1;
        pdf.decodePage(pagecurrent);  // Display next page        
        JScrollBar jsb = pdfpanel.getVerticalScrollBar();
    	  jsb.setValue(0);
    	  JScrollBar jsbx = pdfpanel.getHorizontalScrollBar();
    	  jsbx.setValue(0);
        pdf.repaint();
        if(isProjector) {
        		setProjector();
        		sendMark();
        }
      }
    } catch(Exception e) { e.printStackTrace(); }
  }
  // Rerender panel
  public void Rerender() {  	 
    pdf.invalidate();
    pdf.repaint();  // pdf file   
    validate();      
  }
  // Use for get page current
  public int getPageCurrent() { return this.pagecurrent; }
  // Use for count page of pdf file
  public int getPageCount() { return this.numberofpage; }
  
  // send data in points array this page to server application
  public synchronized void sendMark() throws Exception {
  		Thread.sleep(1000);
  		//////////////////////????????????????????
  		points = (Point[])vpoints.elementAt(pagecurrent-1);
		for(int i=0;i<points.length;i++) {
		   if(points[i] != null) {
		      dout.writeInt(6);
		      dout.writeInt((int)points[i].getX());
		      dout.writeInt((int)points[i].getY());
		      Thread.sleep(2);
		   } else break;
		}
  }
  // Mark into panel
  public void Mark() {
  		try {
  			g = pdf.getGraphics();
	  		if(g != null) {
	  			g.setColor(Color.RED);
	     		for(int i = 0;i < points.length;i++) {
	     			if(points[i] != null) {
	     				g.fillOval(points[i].x,points[i].y,8,8);
	     			} else break;	
	     		}
	  		}
  		} catch(Exception e) { e.printStackTrace(); }
  		  	
  }
  public void MarkProjector(int x,int y) throws Exception {
  		Mark();
  		g.fillOval(x,y,8,8);
  }
  // Use for clear point --> null
  private void ClearPoints() {
    for(int i = 0;i < points.length;i++) {
      if(points[i] != null) points[i] = null;
      else break;
    }
  }
  // set scrollbar for projector
  public void setScrollBar(int scroll) {
  	  JScrollBar jsb = pdfpanel.getVerticalScrollBar();
     jsb.setValue(scroll);
     Mark();
  } 
  // get scrollbar for set projector
  public int getScrollBar() {
  	  JScrollBar jsb = pdfpanel.getVerticalScrollBar();
  	  return jsb.getValue();
  }
  // Set scrollpane down
  private void scrollDown() {
    JScrollBar jsb = pdfpanel.getVerticalScrollBar();
    jsb.setValue(jsb.getValue() + 50);
    Mark();
    if(isProjector)
     		setProjector();
  }
  // Set scrollpane up
  private void scrollUp() {
    JScrollBar jsb = pdfpanel.getVerticalScrollBar();
    jsb.setValue(jsb.getValue() - 50);  
    Mark();
    if(isProjector)
     		setProjector();
  }
  // Set scrollpane left
  private void scrollLeft() {
    JScrollBar jsb = pdfpanel.getHorizontalScrollBar();
    jsb.setValue(jsb.getValue() - 50);
    Mark();
    if(isProjector)
     		setProjector();
  }
  // Set scrollpane right
  private void scrollRight() {
    JScrollBar jsb = pdfpanel.getHorizontalScrollBar();
    jsb.setValue(jsb.getValue() + 50);
    Mark();
    if(isProjector)
     		setProjector();
  }
  // Listener mouse event
  class MouseListeners implements MouseMotionListener,MouseListener {
    public void mouseDragged(MouseEvent e) {
      try {
          points = (Point[])vpoints.elementAt(pagecurrent-1);
        	 if (apc[pagecurrent] < points.length) {
	          points[apc[pagecurrent]] = e.getPoint();
	          if(isProjector) {
		     		dout.writeInt(6);
		   		dout.writeInt(e.getX());
		   		dout.writeInt(e.getY());
		     	 }
	          ++apc[pagecurrent];
	          Mark();
        }
      } catch(Exception ex) { ex.printStackTrace(); }
    }
    public void mouseMoved(MouseEvent e) {
      //JScrollBar jsbv = pdfpanel.getVerticalScrollBar();
      //JScrollBar jsbh = pdfpanel.getHorizontalScrollBar();
      //Rectangle rectangle = new Rectangle(e.getX()-50,e.getY()-50,100,100);
      //if(!pdf.getVisibleRect().contains(rectangle))
      //pdf.scrollRectToVisible(rectangle);
    }
    public void mouseClicked(MouseEvent e) {
    	try {
    		if(e.getSource() == bstart) { setPage(1); }
      	else if(e.getSource() == bback) { Back(); }
      	else if(e.getSource() == bzoomin) { ZoomIn(); }
      	else if(e.getSource() == bzoomout) { ZoomOut(); }
      	else if(e.getSource() == bnext) { Next(); }
      	else if(e.getSource() == bend) { setPage(numberofpage); }
      	else if(e.getSource() == bl) { scrollLeft(); }
      	else if(e.getSource() == br) { scrollRight(); }
      	else if(e.getSource() == bu) { scrollUp(); }
      	else if(e.getSource() == bd) { scrollDown(); }
    	} catch(Exception ex) { }
    }
    public void mouseEntered(MouseEvent e) { }
    public void mouseExited(MouseEvent e) { }
    public void mousePressed(MouseEvent e) { }
    public void mouseReleased(MouseEvent e) { }
  }
  
} // End of class