package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import com.borland.jbcl.layout.*;

public class NetAddressDialog extends JDialog {
  private JPanel panel1 = new JPanel();
  private JTextField jTextField1 = new JTextField();
  private JLabel jLabel1 = new JLabel();
  private JButton jOK_button = new JButton();
  private JButton jCancel_button = new JButton();
  static String netaddress="";
  private int index=0;
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();

  public NetAddressDialog(Frame frame, String title, boolean modal,int id) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
      index = id;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public NetAddressDialog(int id) {
    this(null, "Network address", false,id);
  }
  private void jbInit() throws Exception {
    panel1.setLayout(xYLayout1);
    jTextField1.setToolTipText("Enter Network address");
    jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        jTextField1_keyPressed(e);
      }
    });


    jLabel1.setText("Enter Network address");
    jOK_button.setText("OK");
    jOK_button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jOK_button_actionPerformed(e);
      }
    });
    jCancel_button.setText("Cancel");
    jCancel_button.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jCancel_button_actionPerformed(e);
      }
    });
    this.getContentPane().setLayout(xYLayout2);
    panel1.add(jTextField1,  new XYConstraints(24, 32, 166, 24));
    panel1.add(jLabel1,  new XYConstraints(24, 5, 158, 25));
    panel1.add(jOK_button,  new XYConstraints(29, 66, 66, 20));
    panel1.add(jCancel_button,  new XYConstraints(113, 66, 74, 20));
    this.getContentPane().add(panel1,  new XYConstraints(-4, 0, 215, 104));

    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    Dimension frameSize = this.getSize();
    if (frameSize.height > screenSize.height) {
      frameSize.height = screenSize.height;
    }
    if (frameSize.width > screenSize.width) {
      frameSize.width = screenSize.width;
    }
    this.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
    this.setVisible(true);
  }

  void jOK_button_actionPerformed(ActionEvent e) {
    netaddress = jTextField1.getText();
     System.out.println("NetAdd****:"+netaddress);
     if(Interface.isIp(netaddress))
     {
        setNetAddress(index);
     }//end if
    this.hide();
  }
  public void setNetAddress(int id){
    boolean dup =false;
    boolean exit = false;
    for(int i=0;i<ImageMotion.vWire.size();i++)
    {
      Wire w1 =(Wire)ImageMotion.vWire.elementAt(i);

      if(w1.getNetworkAddress().equalsIgnoreCase(netaddress))
      {
        dup = true;
        JOptionPane.showMessageDialog(null,"Network address is duplicate.......","Warning Message",JOptionPane.INFORMATION_MESSAGE);
        exit = true;
      }//end if
      else
      {
        dup = false;
      }
    }//end for
    if(dup)
    {
      //JOptionPane.showMessageDialog(null,"IP is duplicate.......","Warning Message",JOptionPane.INFORMATION_MESSAGE);
    }
    else
    {
      if(!exit){
      Wire w =(Wire)ImageMotion.vWire.elementAt(id);
      w.setNetworkAddress(netaddress);
      }
    }
  }
  void jCancel_button_actionPerformed(ActionEvent e) {
     this.dispose();

  }
  public String getNetAddress(){
    return netaddress;
  }

  protected void processWindowEvent(WindowEvent e) {
   super.processWindowEvent(e);
   if (e.getID() == WindowEvent.WINDOW_CLOSING) {
     this.dispose();
   }
  }

  void jTextField1_keyPressed(KeyEvent e) {
    netaddress = jTextField1.getText();
    System.out.println("NetAdd****:"+netaddress);
    if(Interface.isIp(netaddress))
    {
       setNetAddress(index);
       this.hide();
    }//end if
  }
}