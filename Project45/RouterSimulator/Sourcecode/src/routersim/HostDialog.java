package routersim;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.event.*;
import java.util.Vector;

//-- connect server
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.net.MalformedURLException;
import java.rmi.UnmarshalException;
import java.rmi.NotBoundException;
import java.rmi.registry.*;
import java.rmi.server.*;
import java.rmi.RMISecurityManager;
import java.rmi.AccessException;
import java.lang.ClassCastException;
import com.borland.jbcl.layout.*;

public class HostDialog extends JDialog {

  //-- component declaration
  private JPanel panel1 = new JPanel();
  private JButton jOk = new JButton();
  private JButton jCancel = new JButton();
  private JLabel jLabel1 = new JLabel();
  private JScrollPane jScrollPaneName = new JScrollPane();
  private JList jListName = new JList();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();
  static  String serverName = "";

  //-- general variable
  private Host defaultHost = null;
  private Wire defaultWire = null;
  private int hostIndex = -1 ;
  private int wireIndex = -1 ;
  private String name;
  private DefaultListModel wireList ;
  JLabel jLabel2 = new JLabel();
  JTextField IPField = new JTextField();

  //-- HostDialog constructor
  public HostDialog(Frame frame, String title, boolean modal , int i) {

    super(frame, title, modal);
    try {
      hostIndex = i; //-- pass host index in
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  //-- Another constructor
  public HostDialog( int i ) {

    this(null, " Host Connection ", false , i);
  }

  //-- Object initialize
  private void jbInit() throws Exception {

    panel1.setLayout(xYLayout1); //-- set layout

    //-- set ok button
    jOk.setText("OK");
    jOk.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jOk_actionPerformed(e);
      }
    });

    //-- set cancle button
    jCancel.setText("Cancel");
    jCancel.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jCancel_actionPerformed(e);
      }
    });

    //-- Set connect with server by RMI
    try {

     serverName = Frame3.serverName;
    }
    catch(Exception ex) {

      ex.printStackTrace();
    }

    //-- find wire name to show
    int i = 0 , j = 0 , wireSize = 0 ;
    String name = "";
    wireList = new DefaultListModel();

    wireSize = ImageMotion.vWire.size(); //-- get routers size
    //-- get host properties
    defaultHost = (Host)Host.vHost.elementAt( hostIndex );

    //-- get wire name
    while( i < wireSize ){

      defaultWire = (Wire)ImageMotion.vWire.elementAt(i);
      name = defaultWire.getNetworkAddress();

      if(!name.equalsIgnoreCase("") && defaultWire.getHostIndex() == -1 ) wireList.addElement( name ); //-- check null
      i++;
    }

    //-- Create JList
    jListName = new JList( wireList );

    //-- set other properties
    jLabel1.setText("Selete wire that you want to connect with : ");
    this.getContentPane().setLayout(xYLayout2);
    jListName.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    xYLayout2.setWidth(274);
    xYLayout2.setHeight(289);
    jLabel2.setText("Set Host\'s IP Address .");
    IPField.setText("");
    panel1.add(jLabel1,    new XYConstraints(22, 8, 247, 23));
    this.getContentPane().add(jScrollPaneName,  new XYConstraints(20, 37, 227, 92));
    this.getContentPane().add(jLabel2,   new XYConstraints(18, 143, 224, 25));
    this.getContentPane().add(IPField,   new XYConstraints(17, 167, 222, 28));
    this.getContentPane().add(jOk, new XYConstraints(39, 229, 81, 29));
    this.getContentPane().add(jCancel, new XYConstraints(144, 228, 80, 28));
    jScrollPaneName.getViewport().add(jListName, null);
    this.getContentPane().add(panel1,  new XYConstraints(0, 0, -1, -1));

  }

  //-- OK button listener
  void jOk_actionPerformed(ActionEvent e) {

    int j = 0;
    int index = 0;
    String networkAddress = "";
    Object o;
    boolean test = false ;
    Wire w = null ;

    //-- initial value from seleted List
    o = jListName.getSelectedValue();         // -- get the selected obj1

    if( o != null ) {

      networkAddress = o.toString(); // -- convert to string , network address

      //-- find index of wire that was selete on list
      while (!test) {

        w = (Wire) ImageMotion.vWire.elementAt(j);

        if (networkAddress.equals(w.getNetworkAddress())) {
          test = true;
        }

        j++;
      }
      index = j - 1; //-- get Index

      defaultHost.setWireIndex(index); //-- set router that connect
      //-- set host to interface
      w = (Wire)ImageMotion.vWire.elementAt( index );
      w.setHostIndex( hostIndex );
    }
    defaultHost.setIP( IPField.getText()); //-- get ip address with IP Field

    this.hide();
    repaint();
  }

  void jCancel_actionPerformed(ActionEvent e) {

    this.dispose();
  }

  //-- Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {

    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }
}