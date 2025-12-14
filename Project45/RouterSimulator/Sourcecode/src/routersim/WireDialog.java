package routersim;

//-- import library
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import java.rmi.Naming;
import java.util.Vector;

//-- this class extends JDialog
public class WireDialog extends JDialog {

  //-- Define class instants
  JPanel panel1 = new JPanel();
  JButton ok_button = new JButton();
  JButton cancle_button = new JButton();

  private JList jList1 ; //-- List block
  private JList jList2 ; //-- List block
  static DefaultListModel interfaceList1,interfaceList2; //-- Add , Remove List for JList
 // private int wireIndex = 0;
  Vector defaultRouterVector = new Vector();
  Vector defaultIntVector = new Vector();
  Router defaultRouter = null;
  Interface defaultInterface = null;
  Wire defaultWire = null;
  NewRouterInt nr = null;
  private JLabel jLabel2 = new JLabel();
  private JLabel jLabel1 = new JLabel();
  private JLabel jLabel3 = new JLabel();
  private JScrollPane jscroll1,jscroll2;
  static   String serverName = "";

  //-- temp variable for use
  private String intNameTemp1 = "" , intNameTemp2 = "" ;
  private int routerIndexTemp1 = -1 , routerIndexTemp2 = -1 ;
  private boolean isUsed = false;
  Wire wireTemp=null;

  //-- Constructor
  public WireDialog(JFrame frame, String title, boolean modal , int i) {

    super(frame, title, modal);
    try {
      //wireIndex = i;
      jbInit(i);
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  //-- Another Constructor
  public WireDialog( int i ) {

    this(null, " Wire Properties ", true , i);
  }

  //-- Initial class
  void jbInit(int wireIndex) throws Exception {
    //-- check if this wire used to initialed already
    Wire wireTemp = (Wire)ImageMotion.vWire.elementAt( wireIndex );
    if( wireTemp.getIndexRouter1() > -1 ){ //-- used Wire

      //-- set flag
      isUsed = true ;

      //-- get interface
      intNameTemp1 = wireTemp.getIntName1();
      intNameTemp2 = wireTemp.getIntName2();

      //--get router index
      routerIndexTemp1 = wireTemp.getIndexRouter1();
      routerIndexTemp2 = wireTemp.getIndexRouter2();
      //-- used delete function
    }
    //-- Set connect with server by RMI
    String serverName = "";
    try {
      serverName =Frame3.serverName;
    }
    catch(Exception ex) {

      ex.printStackTrace();
    }
   //-- Set Button and Add ActionListener
   ok_button.setBounds(new Rectangle(86, 238, 81, 27));
   ok_button.setText("OK");
   ok_button.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
       ok_actionPerformed(e);
     }
   });

   cancle_button.setBounds(new Rectangle(174, 238, 75, 27));
   cancle_button.setText("Cancle");
   cancle_button.addActionListener(new java.awt.event.ActionListener() {
     public void actionPerformed(ActionEvent e) {
       cancle_actionPerformed(e);
     }
   });

   //-- Find available interface
   int i = 0 , j = 0 , sizeOfRouter = 0 , sizeOfInterface = 0;
   String name = "" ;
   interfaceList1 = new DefaultListModel();
   interfaceList2 = new DefaultListModel();

   try {

     //-- bind server object to object in client
     nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
    }
    catch(Exception e){}

    defaultRouterVector = nr.getvRouter();
    sizeOfRouter = defaultRouterVector.size();
    Vector wireVector = new Vector();

    //-- get wire properties
    wireVector = ImageMotion.vWire;
    defaultWire = (Wire)wireVector.elementAt( wireIndex ); //-- get index of wire used
    int temp = defaultWire.getType();
    char wireType = ' ';
    char interfaceType = ' ';

    //-- get wire type
    switch (temp) {

      case 1 : wireType = 'E' ;
        break;
      case 2 : wireType = 'S';
        break;
      case 3 : wireType = 'T';
        break;
      default : break;
    }

    //-- get router interface name
    while( i < sizeOfRouter ){

      defaultRouter = (Router)defaultRouterVector.elementAt(i);     // get router obj from vector
      defaultIntVector = defaultRouter.getVIntTemp();               // get vector interfaces of that router
      name = defaultRouter.getName();                               // get router name for show
      sizeOfInterface = defaultIntVector.size();                    // get number of interface

      while( j < sizeOfInterface ){ //-- get interface of each router

        defaultInterface = (Interface)defaultIntVector.elementAt(j);
        String stemp = defaultInterface.getNameInt(); //-- get interface type
        System.out.println( "Router name " + name + " IntName " + stemp );

        if ( stemp.charAt(0) == wireType ) //-- check wire type
          interfaceList1.addElement( name + ":" + defaultInterface.getNameInt() );

        j++;
      }
      j = 0;
      i++;
   }
   //-- Create JList
   interfaceList2 = interfaceList1; //-- set values
   jList1 = new JList( interfaceList1 );
   jList2 = new JList( interfaceList2 );
    i=0;j=0;
  //-- Set properties
   panel1.setPreferredSize(new Dimension( 350, 300 ));
   panel1.setLayout(null);
   this.setResizable(false);
   jList1.setBorder(BorderFactory.createLineBorder(Color.black));
   jList1.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
   jList1.setBounds(new Rectangle(21, 29, 146, 138));
   jscroll1 = new JScrollPane(jList1);
   jscroll1.setBounds(new Rectangle(21, 29, 146, 138));
   jList2.setBorder(BorderFactory.createLineBorder(Color.black));
   jList2.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
   jList2.setBounds(new Rectangle(179, 30, 147, 137));
   jscroll2 = new JScrollPane(jList2);
   jscroll2.setBounds(new Rectangle(179, 30, 147, 137));
   jLabel2.setText("Please select interface from List1 and List2");
   jLabel2.setBounds(new Rectangle(20, 2, 303, 38));
   jLabel1.setText("Router Interface");
   jLabel1.setBounds(new Rectangle(41, 170, 105, 24));
   jLabel3.setText("Router Interface");
   jLabel3.setBounds(new Rectangle(199, 166, 108, 34));
   this.getContentPane().add(panel1);
   panel1.add(jscroll1, null);
   panel1.add(jscroll2, null);
   // panel1.add(jList2, null);
   panel1.add(ok_button);
   panel1.add(cancle_button);
   panel1.add(jLabel2, null);
   panel1.add(jLabel1, null);
   panel1.add(jLabel3, null);
  }

  void ok_actionPerformed(ActionEvent e) {

    String temp = "" , routerName1 = "" , routerName2 = "" , intName1 = "" , intName2 ="";
    String warn = " Please select a choice again \n your selected are same router ";
    int i = 0 , j = 0;
    int indexRouter1 =0 , indexRouter2 = 0;
    Object o,obj1,obj2 ;
    boolean test = false ;
    Router defaultRouter = null ;
    Interface defaultInterface = null ;

    //-- initial value List1 and List2
    obj1 = jList1.getSelectedValue();            // -- get the selected obj1
    temp = obj1.toString();                      // -- convert to string
    i = temp.indexOf(":");
    routerName1 = temp.substring( 0 , i );     // -- get router name
    intName1 = temp.substring( i+1 , i+3 );    // -- get Interface name

    obj2 = jList2.getSelectedValue();            // -- get the selected obj1
    temp = obj2.toString();                      // -- convert to string
    i = temp.indexOf(":");
    routerName2 = temp.substring( 0 , i );     // -- get router name
    intName2 = temp.substring( i+1 , i+3 );    // -- get Interface name

    System.out.println("obj1 : " + obj1 + " obj2 " + obj2 );

    if( (jList1.getSelectedValue() == jList2.getSelectedValue()) || routerName1.equals( routerName2 ) ) {

      JOptionPane.showMessageDialog( null , warn , " Error Message ", JOptionPane.INFORMATION_MESSAGE );
    }
    else {

      //-- Test JList1 ------------------------------------------------------------------------------------
      while( !test ){  //-- find router

        defaultRouter = (Router)defaultRouterVector.elementAt(j);
        if( routerName1.equals( defaultRouter.getName() ) ) //-- get true router
          test = true ;

        j++;
      }
      indexRouter1 = j - 1 ; //-- get Index of router

      j = 0;
      test = false;
      defaultIntVector = defaultRouter.getVIntTemp();  //-- get router interface

      while( !test ) {  //-- find interface

        defaultInterface = (Interface)defaultIntVector.elementAt( j );
        if( intName1.equals(  defaultInterface.getNameInt() ) ) //-- get ture interface
          test = true;

        j++;
      }

      //-- delete selected interface
      try{
        nr.deleteInt( indexRouter1 , defaultInterface.getNameInt() );  // delete interface
      }
      catch( Exception ex ){
      }

      //-- Test JList2 --------------------------------------------------------------------------------------
      j = 0;
      test = false ;

      while( !test ){  //-- find router

        defaultRouter = (Router)defaultRouterVector.elementAt(j);
        if( routerName2.equals( defaultRouter.getName() ) ) //-- get true router
          test = true ;

        j++;
      }
      indexRouter2 = j - 1 ; //-- get Index of router

      j = 0;
      test = false;
      defaultIntVector = defaultRouter.getVIntTemp();  //-- get router interface

      while( !test ) {  //-- find interface

        defaultInterface = (Interface)defaultIntVector.elementAt( j );
        if( intName2.equals(  defaultInterface.getNameInt() ) ) //-- get ture interface
          test = true;

        j++;
      }

      //-- delete selected interface
      try{
              nr.deleteInt( indexRouter2 , defaultInterface.getNameInt() );  // delete interface
            }
            catch( Exception ex ){
      }

      //-- set selected properties ( set router index , set interface name )
      defaultWire.setIndexRouter( indexRouter1 , indexRouter2 );
      defaultWire.setIntName( intName1 , intName2 );
      this.hide();

    } //-- end else
  }

  void cancle_actionPerformed(ActionEvent e) {

    if(isUsed) restore();
    this.dispose();
  }

  private void restore(){

    //-- set router
    if(wireTemp == null){}
    else{
    wireTemp.setIndexRouter( routerIndexTemp1 , routerIndexTemp2 );
    //-- set interface
    wireTemp.setIntName( intNameTemp1 , intNameTemp2 );
    }

    //-- delete from Router object
  }

  //-- Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {

    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }

}
