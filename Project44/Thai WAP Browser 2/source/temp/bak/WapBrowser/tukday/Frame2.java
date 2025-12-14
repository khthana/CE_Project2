package WapBrowser;

import java.awt.*;
import javax.swing.text.*;
import javax.swing.event.*;
import java.awt.event.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;
import java.net.*;
import java.lang.*;
import java.io.*;
//import org.jdom.*;
//import org.jdom.input.SAXBuilder;
import javax.swing.border.*;
import javax.swing.filechooser.*;
import com.borland.dbswing.*;


public class Frame2 extends JFrame {
  boolean dirty = false;
  Browser b1;
  Document document1;
  DBTextDataBinder dBTextDataBinder1 = new DBTextDataBinder();
  JFileChooser jFileChooser1 = new JFileChooser();
  JPanel contentPane;
  JMenuBar jMenuBar1 = new JMenuBar();
  JMenu jMenuFile = new JMenu();
  JMenuItem jMenuFileExit = new JMenuItem();
  JMenu jMenuHelp = new JMenu();
  JMenuItem jMenuHelpAbout = new JMenuItem();
  ImageIcon image1;
  ImageIcon image2;
  ImageIcon image3;
  ImageIcon image4;
  JMenu jMenuEdit = new JMenu();
  JMenuItem jMenuCopy = new JMenuItem();
  JMenuItem jMenuPaste = new JMenuItem();
  JMenuItem jMenuCut = new JMenuItem();
  JMenuItem jMenuOpen = new JMenuItem();
  JMenuItem jMenuSave = new JMenuItem();
  JToolBar jToolBar1 = new JToolBar();
  JButton jButtonNew = new JButton();
  JButton jButtonOpen = new JButton();
  JButton jButtonSave = new JButton();
  JButton jButtonCut = new JButton();
  JButton jButtonCopy = new JButton();
  JButton jButtonPaste = new JButton();
  Component component1;
  JButton jButtonCompile = new JButton();
  Component component2;
  JMenuItem jMenuNew = new JMenuItem();
  FileDialog fileDialog;
  String currFileName;
  JPanel jPanel1 = new JPanel();
  JLabel statusBar = new JLabel();
  JPanel jPanelAddr = new JPanel();
  JScrollPane jScrollPane1 = new JScrollPane();
  JTextField jTextField1 = new JTextField();
  JLabel jLabel1 = new JLabel();
  BorderLayout borderLayout1 = new BorderLayout();
  BorderLayout borderLayout2 = new BorderLayout();
  BorderLayout borderLayout3 = new BorderLayout();
  TitledBorder titledBorder1;
  TitledBorder titledBorder2;
  JTextPane jTextPane1 = new JTextPane();
  JMenuItem jMenuSaveAs = new JMenuItem();


  /**Construct the frame*/
  public Frame2() {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  /**Component initialization*/
  private void jbInit() throws Exception  {

    image1 = new ImageIcon(WapBrowser.Frame2.class.getResource("open.gif"));
    image2 = new ImageIcon(WapBrowser.Frame2.class.getResource("save.gif"));
    image3 = new ImageIcon(WapBrowser.Frame2.class.getResource("help.gif"));
    image4 = new ImageIcon(WapBrowser.Frame2.class.getResource("skin.jpeg"));
    //setIconImage(Toolkit.getDefaultToolkit().createImage(Frame2.class.getResource("[Your Icon]")));
    document1 = jTextPane1.getDocument();
    contentPane = (JPanel) this.getContentPane();
    component1 = Box.createHorizontalStrut(27);
    component2 = Box.createHorizontalStrut(29);
    titledBorder1 = new TitledBorder("");
    titledBorder2 = new TitledBorder("");
    contentPane.setLayout(borderLayout3);
    this.getContentPane().setBackground(Color.white);
    this.setSize(new Dimension(564, 534));

    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    Dimension frameSize = getSize();

    if (frameSize.height > screenSize.height) {
      frameSize.height = screenSize.height;
    }
    if (frameSize.width > screenSize.width) {
      frameSize.width = screenSize.width;
    }
    this.setLocation(screenSize.width / 2 - 50, (screenSize.height - frameSize.height) / 2 - 30);
    this.setTitle("แว๊พบราวเซอร์ภาษาไทย  WML Editer");
    this.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
    jMenuFile.setText("File");
    jMenuFileExit.setText("Exit");
    jMenuFileExit.addActionListener(new Frame2_jMenuFileExit_actionAdapter(this));
/*    jMenuFileExit.addActionListener(new ActionListener()  {
      public void actionPerformed(ActionEvent e) {
        jMenuFileExit_actionPerformed(e);
      }
    });
*/    jMenuHelp.setText("Help");
    jMenuHelpAbout.setText("About");
/*    jMenuHelpAbout.addActionListener(new ActionListener()  {
      public void actionPerformed(ActionEvent e) {
        jMenuHelpAbout_actionPerformed(e);
      }
    });
*/
    jMenuEdit.setText("Edit");
    jMenuCopy.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("copy.gif")));
    jMenuCopy.setText("Copy");
    jMenuCopy.addActionListener(new Frame2_jMenuCopy_actionAdapter(this));
    jMenuPaste.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("paste.gif")));
    jMenuPaste.setText("Paste");
    jMenuPaste.addActionListener(new Frame2_jMenuPaste_actionAdapter(this));
    jMenuCut.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("cut.gif")));
    jMenuCut.setText("Cut");
    jMenuCut.addActionListener(new Frame2_jMenuCut_actionAdapter(this));
    jMenuOpen.setIcon(image1);
    jMenuOpen.setText("Open");
    jMenuOpen.addActionListener(new Frame2_jMenuOpen_actionAdapter(this));
    //Open.addActionListener(new ActionListener(this));   ///////////////abstract
/*    jMenuOpen.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenuOpen_actionPerformed(e);
      }
    });
*/
    jMenuSave.setIcon(image2);
//    jMenuBack.setIcon(new ImageIcon(WapBrowser.Frame1.class.getResource("Back.gif")));
    jMenuSave.setText("Save");
    jMenuSave.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jMenuSave_actionPerformed(e);
      }
    });
    contentPane.setBackground(SystemColor.info);
    contentPane.setEnabled(true);
    contentPane.setAlignmentX((float) 50.0);
    contentPane.setAlignmentY((float) 50.0);
    jMenuBar1.setToolTipText("");
    jButtonNew.setToolTipText("New");
    jButtonNew.setBorderPainted(false);
    jButtonNew.setContentAreaFilled(false);
    jButtonNew.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("new.gif")));
    jButtonNew.addActionListener(new Frame2_jButtonNew_actionAdapter(this));
    jButtonOpen.setToolTipText("Open");
    jButtonOpen.setBorderPainted(false);
    jButtonOpen.setContentAreaFilled(false);
    jButtonOpen.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("open.gif")));
    jButtonOpen.addActionListener(new Frame2_jMenuOpen_actionAdapter(this));
    jButtonSave.setToolTipText("Save");
    jButtonSave.setBorderPainted(false);
    jButtonSave.setContentAreaFilled(false);
    jButtonSave.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("save.gif")));
    jButtonSave.addActionListener(new Frame2_jButtonSave_actionAdapter(this));
    jButtonCut.setToolTipText("Cut");
    jButtonCut.setBorderPainted(false);
    jButtonCut.setContentAreaFilled(false);
    jButtonCut.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("cut.gif")));
    jButtonCut.addActionListener(new Frame2_jButtonCut_actionAdapter(this));
    jButtonCopy.setToolTipText("Copy");
    jButtonCopy.setBorderPainted(false);
    jButtonCopy.setContentAreaFilled(false);
    jButtonCopy.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("copy.gif")));
    jButtonCopy.addActionListener(new Frame2_jButtonCopy_actionAdapter(this));
    jButtonPaste.setToolTipText("Paste");
    jButtonPaste.setBorderPainted(false);
    jButtonPaste.setContentAreaFilled(false);
    jButtonPaste.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("paste.gif")));
    jButtonPaste.addActionListener(new Frame2_jButtonPaste_actionAdapter(this));
    jToolBar1.setBackground(SystemColor.info);
    jButtonCompile.setFont(new java.awt.Font("Dialog", 0, 14));
    jButtonCompile.setBorder(titledBorder1);
    jButtonCompile.setContentAreaFilled(false);
//    jButton1.setIcon(new ImageIcon(new java.net.URL("file:///D:/temp/src/temp/help.gif")));
    jButtonCompile.setText("Compile");
    jButtonCompile.addActionListener(new Frame2_jButtonCompile_actionAdapter(this));
    jMenuNew.setIcon(new ImageIcon(WapBrowser.Frame2.class.getResource("new.gif")));
    jMenuNew.setText("New");
    jMenuNew.setAccelerator(javax.swing.KeyStroke.getKeyStroke(78, java.awt.event.KeyEvent.CTRL_MASK, false));
    jMenuNew.addActionListener(new Frame2_jMenuNew_actionAdapter(this));
    statusBar.setBackground(SystemColor.info);
    statusBar.setText(" ");
    jPanelAddr.setLayout(borderLayout1);
    jScrollPane1.setEnabled(false);
    jScrollPane1.setBorder(BorderFactory.createEtchedBorder());
    jTextField1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jTextField1_actionPerformed(e);
      }
    });
    jLabel1.setBorder(titledBorder2);
    jLabel1.setText("  Address  ");
    jPanel1.setLayout(borderLayout2);
    jPanelAddr.setBackground(SystemColor.info);
    jTextPane1.setFont(new java.awt.Font("Dialog", 0, 12));
    jTextPane1.setBorder(BorderFactory.createEtchedBorder());
    jTextPane1.setToolTipText("");
    component1.setBackground(Color.lightGray);
    jMenuSaveAs.setText("Save as..");
    jMenuSaveAs.addActionListener(new Frame2_jMenuSaveAs_actionAdapter(this));
    jTextField1.setFont(new java.awt.Font("Dialog", 0, 12));
    jMenuFile.add(jMenuNew);
    jMenuFile.add(jMenuOpen);
    jMenuFile.add(jMenuSave);
    jMenuFile.add(jMenuSaveAs);
    jMenuFile.addSeparator();
    jMenuFile.add(jMenuFileExit);
    jMenuHelp.add(jMenuHelpAbout);
    jMenuBar1.add(jMenuFile);
    jMenuBar1.add(jMenuEdit);
    jMenuBar1.add(jMenuHelp);
    this.setJMenuBar(jMenuBar1);
    jMenuEdit.add(jMenuCut);
    jMenuEdit.add(jMenuCopy);
    jMenuEdit.add(jMenuPaste);
    contentPane.add(jToolBar1, BorderLayout.NORTH);
    jToolBar1.add(jButtonNew, null);
    jToolBar1.add(jButtonOpen, null);
    jToolBar1.add(jButtonSave, null);
    jToolBar1.add(component1, null);
    jToolBar1.add(jButtonCut, null);
    jToolBar1.add(jButtonCopy, null);
    jToolBar1.add(jButtonPaste, null);
    jToolBar1.add(component2, null);
    jToolBar1.add(jButtonCompile, null);
    contentPane.add(jPanel1, BorderLayout.CENTER);
    jPanelAddr.add(jTextField1, BorderLayout.CENTER);
    jPanelAddr.add(jLabel1, BorderLayout.WEST);
    jPanel1.add(jScrollPane1, BorderLayout.CENTER);
    jScrollPane1.getViewport().add(jTextPane1, null);
    //jPanel1.add(jPanelAddr, BorderLayout.NORTH);
    jPanel1.add(statusBar,  BorderLayout.SOUTH);

    ExampleFileFilter WMLFilter = new ExampleFileFilter("wml", "WML Phones Files");
    jFileChooser1.addChoosableFileFilter(WMLFilter);

    dBTextDataBinder1.setJTextComponent(jTextPane1);
    dBTextDataBinder1.setEnableFileLoading(false);
    dBTextDataBinder1.setEnableFileSaving(false);

    document1.addDocumentListener(new Frame2_document1_documentAdapter(this));

  }
  /**File | Exit action performed*/
  public void jMenuFileExit_actionPerformed(ActionEvent e) {
//    System.exit(0);
       if(okToAbandon()) {this.dispose();}
  }
  /**Help | About action performed*/
  public void jMenuHelpAbout_actionPerformed(ActionEvent e) {
  }
  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      jMenuFileExit_actionPerformed(null);
    }
  }

  void jMenu3_actionPerformed(ActionEvent e) {
 }

  void jMenuItem2_actionPerformed(ActionEvent e) {
//    f1.show();


  }

////////////////////Open file/////////////////////
  void jMenuOpen_actionPerformed(ActionEvent e) {
//      Frame1.showall();
/*    FileDialog d = new FileDialog (new Frame(),"Open",FileDialog.LOAD);
    d.setDirectory(".");
    d.setFile("*.wml");
    d.setVisible(true);
    jTextField1.setText(d.getDirectory() + d.getFile());
*/
    if (!okToAbandon()) {
    return;
    }
    if(jFileChooser1.APPROVE_OPTION == jFileChooser1.showOpenDialog(this))
    {
    statusBar.setText("Opened "+jFileChooser1.getSelectedFile().getPath());
    jTextField1.setText(jFileChooser1.getSelectedFile().getPath());
    openFile(jFileChooser1.getSelectedFile().getPath());

     //repaints menu after item is selected
     this.repaint();
    }
  }

  boolean openFile(String fileName)
  {
    try
    {
        File file = new File(fileName);
        int size = (int) file.length();
        int chars_read=0;
        FileReader in = new FileReader(file);
        char[] data = new char[size];
        while(in.ready()) {
          chars_read += in.read(data,chars_read,size-chars_read);
        }
        in.close();
        jTextPane1.setText(new String(data,0,chars_read));
        this.currFileName = fileName;
        this.dirty = false;
        updateCaption();
        statusBar.setText("Opened "+fileName);
        return true;
     }
     catch(IOException e)
     {
        statusBar.setText("Error openning "+fileName);
     }
     return false;
   }


  void jMenuSave_actionPerformed(ActionEvent e) {
/*    FileDialog d = new FileDialog (new Frame(),"Save",FileDialog.SAVE);
    d.setDirectory(".");
    d.setFile("*.html");// it must be *.wml
    d.setVisible(true);
  */
  saveFile();
  }

  boolean saveFile() {
    if(currFileName == null) {
       return saveAsFile();
    }
    try{
        File file = new File(currFileName);
        FileOutputStream out = new FileOutputStream(file);
        //String text = jTextPane1.getText();
        String text = jTextPane1.getText().trim();
        byte bytes[] = text.getBytes();
        out.write(bytes);
        out.close();
        this.dirty = false ;
        updateCaption();
        jTextField1.setText(jFileChooser1.getSelectedFile().getPath());

//        File file2 = new File("c:/temp2/tem.wml");
//        FileOutputStream out2 = new FileOutputStream(file2);
//        //String text = jTextPane1.getText().trim();
//        String tempf = AddTTag(jTextPane1.getText());
//        byte bytes2[] = tempf.getBytes();
//        out2.write(bytes2);
//        out2.close();

        return true;
    }
    catch(IOException e) {
        statusBar.setText("Error saving"+currFileName);
    }
    return false;
  }

    boolean saveAsFile() {
      if(jFileChooser1.APPROVE_OPTION == jFileChooser1.showSaveDialog(this)){
        currFileName = jFileChooser1.getSelectedFile().getPath();
        this.repaint();
        return saveFile();
      }
      else
        this.repaint();
      return false ;
    }

    boolean okToAbandon() {
      if (!dirty) {
        return true;
      }
      int value = JOptionPane.showConfirmDialog(this,"Save changes?","แว๊พบราวเซอร์ภาษาไทย",JOptionPane.YES_NO_CANCEL_OPTION);
      switch(value) {
        case JOptionPane.YES_OPTION:return saveFile();
        case JOptionPane.NO_OPTION:return true;
        case JOptionPane.CANCEL_OPTION:
        default: return false;
      }
    }

  String AddTTag(String src){//----------------begin AddTTag
    int i, len = src.length();
    int state=0;
    StringBuffer sbuf = new StringBuffer(len);

    for (i = 0; i <= (len-1); i++) {
        sbuf.append(src.charAt(i));
    }
    int jj,ii=3;
    while(ii<=src.length()){
      jj=ii;
      if ( (state==0) &&(src.substring(ii-3,ii).equalsIgnoreCase("<p>"))){
        state=1;
        ii+=1;
      }

      if((state==1)&&(src.substring(ii-1,ii).equalsIgnoreCase("<"))){//<p><blabla..>..
        state=3;
        ii+=3;
      }
      else if(state==1){
        state=2;
        ii-=1;// to the char of text next to ">"
      }

      if ((state==3)&&(src.substring(ii-4,ii).equalsIgnoreCase("</p>"))){
        state=0;
        if (ii<src.length()){
          while(!src.substring(ii-3,ii).equalsIgnoreCase("<p>")){
            if (ii<src.length()){
              ii++;
            }
            else{break;}
          }
        }
      }
      else if (state==3){//havetag another tag
        if(ii<src.length()){while(!src.substring(ii-4,ii-2).equalsIgnoreCase("</")){ii++;}}
        state=8;
        ii-=1;
        if(ii<src.length()){while(!src.substring(ii-1,ii).equalsIgnoreCase(">")){ii++;}}
      }

      if(state==8){
        state=1;
        ii+=1;
      }
      //if ii not increase by for loop

/*      if ((state==1)&&(!src.substring(ii-1,ii).equalsIgnoreCase("<"))){
        state=2;
      }
*/
      if(state==2){
        state=5;
        // orphan after </blabla> add <t>txt</t>
        sbuf.insert(ii,"<t>");
        src = sbuf.toString();
        ii+=4;
        if(ii<src.length()){while(!src.substring(ii-1,ii).equalsIgnoreCase("<")){ii++;}}
      }

      if(state==5){
        state=6;
        ii-=1;
        sbuf.insert(ii,"</t>");
        src = sbuf.toString();
        ii+=5;
        //inp=true;
      }
      // until found new open tag "<blabla.."
      if(state==6){
        state=3;
        ii+=3;
      }
      if (ii==jj){ii++;}
    }
    return sbuf.toString();
  }//---------------end AddTTag


  void jTextField1_actionPerformed(ActionEvent e ) {
    jText2Editor(jTextField1.getText());
  }

//-----------------

  void jText2Editor(String dest) {
    if (dest.substring(0,7).equalsIgnoreCase("http://")){
      try{
        URL url = new URL(dest);
        InputStream in = url.openStream();
        DataInputStream dis = new DataInputStream(url.openConnection().getInputStream());
        Reader reader = new InputStreamReader(in);
        BufferedReader bufferedReader = new BufferedReader(reader);
        String line;
        String tline = new String("");
        while((line = bufferedReader.readLine()) != null ) {tline += line; tline+='\n';}
        jTextPane1.setText(tline);
        bufferedReader.close();
      }
      catch(UnknownHostException ex){jTextPane1.setText("Cannot Resolve: "+ex);/*System.err.println("Cannot Resolve: "+ex);*/  }
      catch(IOException ex){jTextPane1.setText("IOException : "+ex); /*System.err.println("IOException : "+ex);*/ }
    }
    else{
      byte buff[] = new byte [1000];
      if(dest.substring(0,8).equalsIgnoreCase("file:///")){
        String strbuf = new String();
        strbuf = dest.substring(8,dest.length());
        dest = strbuf;
      }
        try {
          InputStream fileIn = new FileInputStream(dest);
          int i = fileIn.read(buff);
          String s = new String(buff);
          jTextPane1.setText(s);
        }
      catch(FileNotFoundException ex) {jTextPane1.setText("Cannot Resolve: "+ex);}
      catch(IOException ex) {jTextPane1.setText("IOException : "+ex);}

    }//end else
  //Frame1.InputArea.setVisible(false);
  //Frame1.jEditorPane1.setVisible(true);
  }
//-------------

  void jButtonNew_actionPerformed(ActionEvent e) {
    if(okToAbandon()){
      currFileName= null;
      dirty = false;
      updateCaption();
      jTextField1.setText("");
      jTextPane1.setText("");
      statusBar.setText(" ");
    }
  }

     void updateCaption() {
       String caption;

       if (currFileName == null) {
          // synthesize the "Untitled" name if no name yet.
          caption = "Untitled";
       }
       else {
         caption = currFileName;
       }

       // add a "*" in the caption if the file is dirty.
       if (dirty) {
         caption = "* " + caption;
       }
       caption = "แว๊พบราวเซอร์ภาษาไทย  WML Editer -- " + caption;
       this.setTitle(caption);
     }

  void jMenuSaveAs_actionPerformed(ActionEvent e) {
    saveAsFile();
  }

  void jButtonCompile_actionPerformed(ActionEvent e) {
   if(okToAbandon()) {
   //action
   Browser.enter_press("file:///"+currFileName);///c:/temp2/tem.wml");// invalid to make new instance
//   Browser.b1.show();
   };
  }

  void document1_changedUpdate(DocumentEvent e) {
    dirty = true;
    updateCaption();
  }

  void document1_insertUpdate(DocumentEvent e) {
    dirty = true;
    updateCaption();
  }

  void document1_removeUpdate(DocumentEvent e) {
    dirty = true;
    updateCaption();
  }

  void jButtonCut_actionPerformed(ActionEvent e) {
    jTextPane1.cut();
  }

  void jButtonCopy_actionPerformed(ActionEvent e) {
    jTextPane1.copy();
  }

  void jButtonPaste_actionPerformed(ActionEvent e) {
    jTextPane1.paste();
  }

  void jMenuCut_actionPerformed(ActionEvent e) {
    jTextPane1.cut();
  }

  void jMenuCopy_actionPerformed(ActionEvent e) {
    jTextPane1.copy();
  }

  void jMenuPaste_actionPerformed(ActionEvent e) {
    jTextPane1.paste();
  }

///////////////////////////////////end event
}

class Frame2_jMenuFileExit_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuFileExit_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuFileExit_actionPerformed(e);
  }
}

class Frame2_jMenuSave_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuSave_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuSave_actionPerformed(e);
  }
}

class Frame2_jMenuOpen_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuOpen_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuOpen_actionPerformed(e);
  }
}

class Frame2_jButtonNew_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jButtonNew_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonNew_actionPerformed(e);
  }
}

class Frame2_jMenuNew_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuNew_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonNew_actionPerformed(e);
  }
}

class Frame2_jButtonSave_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jButtonSave_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuSave_actionPerformed(e);
  }
}

class Frame2_jMenuSaveAs_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuSaveAs_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuSaveAs_actionPerformed(e);
  }
}

class Frame2_jButtonCompile_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jButtonCompile_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonCompile_actionPerformed(e);
  }
}
class Frame2_document1_documentAdapter implements javax.swing.event.DocumentListener {
  Frame2 adaptee;

  Frame2_document1_documentAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }

  public void changedUpdate(DocumentEvent e) {
    adaptee.document1_changedUpdate(e);
  }

  public void insertUpdate(DocumentEvent e) {
    adaptee.document1_insertUpdate(e);
  }

  public void removeUpdate(DocumentEvent e) {
    adaptee.document1_removeUpdate(e);
  }
}

class Frame2_jButtonCut_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jButtonCut_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonCut_actionPerformed(e);
  }
}

class Frame2_jButtonCopy_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jButtonCopy_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonCopy_actionPerformed(e);
  }
}

class Frame2_jButtonPaste_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jButtonPaste_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButtonPaste_actionPerformed(e);
  }
}

class Frame2_jMenuCut_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuCut_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuCut_actionPerformed(e);
  }
}

class Frame2_jMenuCopy_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuCopy_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuCopy_actionPerformed(e);
  }
}

class Frame2_jMenuPaste_actionAdapter implements java.awt.event.ActionListener {
  Frame2 adaptee;

  Frame2_jMenuPaste_actionAdapter(Frame2 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jMenuPaste_actionPerformed(e);
  }
}
