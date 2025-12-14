package routersim;

//-- import library
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import java.rmi.Naming;
import java.util.Vector;
import com.borland.jbcl.layout.*;

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

//-- this class extends JDialog
public class HostCommandDialog extends JDialog {

  private JComboBox commandBox;
  private String names[] = { "Select Command .... ", "Ping " };
  private JTextField desIP = new JTextField();
  private JLabel jLabel1 = new JLabel();
  private JLabel jLabel2 = new JLabel();
  private JButton runButton = new JButton();
  private JButton closeButton = new JButton();
  private JLabel jLabel3 = new JLabel();
  private String sourceIP = "";
  private int command = -1;
  private XYLayout layout = new XYLayout();
  private int indexOfHost = -1;
  private String serverName = "";
  private NewRouterInt nr ;
  private CommandInt ci;
  private String result = "";
  private JScrollPane jScrollPane1 = new JScrollPane();
  private JTextArea jTextArea1 = new JTextArea();

  public HostCommandDialog( String sIP , int i ) {

    this(null, " Command Dialog " , true , sIP , i);
  }

  public HostCommandDialog(Frame frame, String title, boolean modal , String IP , int ii) {

    super(frame, title, modal);

    try {
      sourceIP = IP ;
      indexOfHost = ii;
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  private void jbInit() throws Exception {

    //-- initial RMI connection
    try {

      serverName = Frame3.serverName;
      nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
    }
    catch (Exception ex) {

      ex.printStackTrace();
    }


    commandBox = new JComboBox( names );
    commandBox.setMaximumRowCount( 3 );
    this.repaint();
  /*
    commandBox.addItemListener(
        new ItemListener() {
      public void itemStateChanged( ItemEvent e ) {

        command = commandBox.getSelectedIndex();

      }
    });
*/
    runButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        run_actionPerformed(e);
      }
    });

    closeButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        close_actionPerformed(e);
      }
    });


    this.getContentPane().setLayout(layout);
    layout.setHeight(399);
    layout.setWidth(445);

    jLabel1.setText("Command");
    jLabel2.setText("Destination IP Address");
    jLabel3.setText("Output ");

    runButton.setText("R U N");
    closeButton.setText("C l o s e");

    jTextArea1.setBackground(Color.black);
    jTextArea1.setFont(new java.awt.Font("SansSerif", 0, 12));
    jTextArea1.setForeground(Color.white);
    jTextArea1.setText("");
    desIP.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        desIP_actionPerformed(e);
      }
    });
    this.getContentPane().add(jLabel1, new XYConstraints(20, 21, -1, -1));
    this.getContentPane().add(jLabel2, new XYConstraints(20, 54, -1, -1));
    this.getContentPane().add(jLabel3, new XYConstraints(19, 90, -1, -1));
    this.getContentPane().add(commandBox, new XYConstraints(102, 20, 198, -1));
    this.getContentPane().add(desIP, new XYConstraints(163, 52, 135, -1));
    this.getContentPane().add(jScrollPane1,    new XYConstraints(23, 117, 393, 226));
    this.getContentPane().add(closeButton, new XYConstraints(242, 357, -1, -1));
    this.getContentPane().add(runButton, new XYConstraints(344, 356, -1, -1));
    jScrollPane1.getViewport().add(jTextArea1, null);
  }

  //-- run command
  void run_actionPerformed(ActionEvent e) {

    Vector rv = new Vector();
    int routerIndex1 = -1,routerIndex2 = -1;
    int interfaceIndex1 = -1, interfaceIndex2 = -1;
    String timeOut ="Pinging  "+ desIP.getText() +"  with  32 bytes of data:"+"\n";
         timeOut +="\nRequest timed out.";
         timeOut +="\nRequest timed out.";
         timeOut +="\nRequest timed out.";
         timeOut +="\nRequest timed out.";
         timeOut +="\nPing  statistics for "+ desIP.getText() +":";
         timeOut +="\n         Packet : Sent = 4, Received = 0, Lost = 4 (100% loss),";

    Host h = (Host)Host.vHost.elementAt(indexOfHost);
    Wire w = (Wire)ImageMotion.vWire.elementAt( h.getWireIndex() );

    try {

      //-- get router
      nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
      rv = nr.getvRouter();

       ci = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
    }catch( Exception ex ){
    }

    //-- find network address
    String networkAddress = findNetAdd( sourceIP , "255.255.255.0" );

    //-- find router and interface position 1
    Router rr1 = (Router)rv.elementAt(w.getIndexRouter1());

    for( int bb = 0 ; bb < rr1.getVInt().size() ; bb++ ){

      Interface ii = (Interface)rr1.getVInt().elementAt(bb);
      String temp = findNetAdd( ii.getIpAddress() , "255.255.255.0" );

      if( temp.equalsIgnoreCase(networkAddress)){

        interfaceIndex1 = bb;
      }
    }

    Interface ii1 = (Interface)rr1.getVInt().elementAt(interfaceIndex1);
    String status1 = ii1.getStatus();
    boolean test1 = false;
    if ( status1.equalsIgnoreCase( "up" ) ) test1 = true;


    //-- find router and interface position 2
    Router rr2 = (Router) rv.elementAt(w.getIndexRouter2());

    for (int bb = 0; bb < rr2.getVInt().size(); bb++) {

      Interface ii = (Interface) rr2.getVInt().elementAt(bb);
      String temp = findNetAdd(ii.getIpAddress(), "255.255.255.0");

      if (temp.equalsIgnoreCase(networkAddress)) {

        interfaceIndex2 = bb;
      }
    }
    Interface ii2 = (Interface)rr2.getVInt().elementAt(interfaceIndex2);
    String status2 = ii2.getStatus();
    boolean test2 = false;
    if ( status2.equalsIgnoreCase( "up" ) ) test2 = true;

    //-- access list testing ----- skip
    try {
      //-- ping command
      command = commandBox.getSelectedIndex();
      if (command == 1) { //-- ping

        //-- add command string
        result += "\nC:\\ping " + desIP.getText() + "\n";
        if (test1 == true) {

          result += ci.hostPing(rr1, desIP.getText(), h.getIP());
        }
        else if (test2 == true) {

          result += ci.hostPing(rr2, desIP.getText(), h.getIP());
        }
        else {
          result += timeOut;
        }
      }
      else if (command == 2) {
        //-- other command
      }
  }catch( Exception ex ) {}

  jTextArea1.setText(result);
  this.repaint();
}

  //-- find network address
  public static String findNetAdd(String ip,String subnet){

    String netAdd="",tmp1 = "",tmp2="",tmp="";
    while(ip.length() != 0){
      int i1 = ip.indexOf(".");
      int i2 = subnet.indexOf(".");
      int i3=0,i4=0;
      if ((i1 != -1)&&(i2 != -1)){
        tmp1 = ip.substring(0,i1);
        tmp2 = subnet.substring(0,i2);
        i3 = Integer.parseInt(tmp1);
        i4 = Integer.parseInt(tmp2);
        tmp = Integer.toString(i3 & i4);
        tmp += ".";
        netAdd = netAdd.concat(tmp);
        ip = ip.substring(i1+1,ip.length());
        subnet = subnet.substring(i2+1,subnet.length());
      }//end index != -1
      else {
        try {
          i3 = Integer.parseInt(ip);
          i4 = Integer.parseInt(subnet);
          tmp = Integer.toString(i3 & i4);
          netAdd = netAdd.concat(tmp);
          ip="";
          subnet="";
        }
        catch (NumberFormatException exp){
          ip = "";
        }
      }//end else
    }//end while
    return netAdd;
  }

  //-- close window
  void close_actionPerformed(ActionEvent e){

    this.dispose();
  }

  //-- Overridden so we can exit when window is closed\
  protected void processWindowEvent(WindowEvent e) {

    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }

  void desIP_actionPerformed(ActionEvent e) {
    run_actionPerformed(e);
  }
}
