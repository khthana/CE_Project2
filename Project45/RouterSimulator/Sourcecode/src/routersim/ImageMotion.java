/*
   ImageMotion class is a path to design network
   and painting control
*/

package routersim;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.filechooser.*;
import java.lang.*;
import java.lang.String;
import java.lang.Integer;
import java.util.Vector;
import java.io.*;

import java.io.WriteAbortedException;
import java.io.NotSerializableException;
import java.io.WriteAbortedException;
import java.io.NotSerializableException;
import java.rmi.UnmarshalException;
import java.util.Enumeration;
import javax.swing.border.*;

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

public class ImageMotion extends JPanel
    implements MouseListener , MouseMotionListener {

  int flag;
  int isConnectRouter = -1;
  static int indexOfRouter=-1;
  static int indexOfHost=-1;
  static int indexOfWire=-1;
  Image image1;
  static Vector  routerImg = new Vector();
  static Vector wireImg = new Vector();
  static Vector hConnect = new Vector();
  static Vector vWire = new Vector(); // -- kept all of wire
  private boolean pressinrouter = false;
  private boolean pressinwire = false;
  private boolean pressinhost = false;
  private String Rname="";
  private String Hname="";
  private JLabel statusBar;
  static RouterImg defaultRouterImage;
  static WireImage defaultWireImage;
  static Host defaultHost;
  private JPopupMenu routerPopup = new JPopupMenu();
  private JPopupMenu wirePopup = new JPopupMenu();
  private JPopupMenu hostPopup = new JPopupMenu();
  private JButton items_r[] ;
  private JButton items_h[] ;
  private JButton items2[];
  static String serverName ="";
  final String routerMenuItem[] = { " Console " , " Export Configuration ", " Delete " };
  final String wireMenuItem[] = { " Connect " , " Bandwidth " , " Network Address "," Delete " };
  final String hostMenuItem[] = { " Set Host " , " Commands " ," Delete " };
  static Enumeration en;
  static  NewRouterInt nr;
  private Border border1;
  private ImageIcon imageIcon = new ImageIcon(Frame3.class.getResource("icon.png"));
  static int mode = 0;

  //-- class constructor
  public ImageMotion(){

   //-- create popup menu of router
    ItemHandler handler = new ItemHandler();
    ItemHandler2 handler2 = new ItemHandler2();
    items_r = new JButton[3];
    items2 = new JButton[4];

    System.out.println(" Mode " + mode);
    //-- create each menu
    routerPopup.add( new JLabel(" Router Propertie "));
    routerPopup.addSeparator();
    border1 = BorderFactory.createEmptyBorder();

    int t = 0 ;
    if( mode == 2 ) {
      t = items_r.length - 1;
    }
    else t = items_r.length;

    for( int i=0; i < t; i++ ) {

      items_r[i] = new JButton( routerMenuItem[i] ); // can add icon
      items_r[i].setBorder(border1);
      items_r[i].setIcon(imageIcon);
      items_r[i].setCursor( new Cursor( Cursor.HAND_CURSOR ) );
      items_r[i].setContentAreaFilled(false);
      routerPopup.add( items_r[i] );
      items_r[ i ].addActionListener( handler );
    }

    //-- create popup menu of host
    ItemHandler1 handler1 = new ItemHandler1();
    items_h = new JButton[3];
    hostPopup.add( new JLabel(" Host Propertie "));
    hostPopup.addSeparator();

    if( mode == 2 ) {
      t = items_h.length - 1;
    }
    else t = items_h.length;

    for( int i=0; i < t; i++ ) {
      items_h[i] = new JButton( hostMenuItem[i] );
      items_h[i].setBorder(border1);
      items_h[i].setIcon(imageIcon);
      items_h[i].setCursor( new Cursor( Cursor.HAND_CURSOR ) );
      items_h[i].setContentAreaFilled(false);
      hostPopup.add( items_h[i] );
      items_h[ i ].addActionListener( handler1 );
    }

    wirePopup.add( new JLabel(" Wire Propertie "));
    wirePopup.addSeparator();

    if( mode == 2 ) {
    t = items2.length - 1;
    }
    else t = items2.length;

    for( int i=0; i < t ; i++ ) {
      items2[i] = new JButton( wireMenuItem[i] );
      items2[i].setBorder(border1);
      items2[i].setIcon(imageIcon);
      items2[i].setCursor( new Cursor( Cursor.HAND_CURSOR ) );
      items2[i].setContentAreaFilled(false);
      wirePopup.add( items2[i] );
      items2[ i ].addActionListener( handler2 );
    }

    try {
      serverName= Frame3.serverName;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }

    try {
      nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
    }
    catch(Exception ex1) {
      System.out.println("Exception occured from img: " + ex1);
      System.exit(0);
    }

    //-- application listens to its own mouse events
    addMouseListener( this );
    addMouseMotionListener( this );
    setSize(700,500);
  }

  //-- paint component
  //-- call by repaint
  public void paintComponent(Graphics g){

    super.paintComponent(g);
    g.setColor(Color.black);
    // -- Line generate  -----------------------------------
    Vector defaultRouterVector = new Vector();
    Wire wi = null ;
    try{
      defaultRouterVector = nr.getvRouter();
    }
    catch( Exception e ){
      System.out.println("Image Motion Error"+ e );
    }
    //-- Set wire cost
    for(int i=0; i < vWire.size() ; i++ ){
      //-- get each wire
      Wire w = (Wire)vWire.elementAt(i);
      //-- get router connected wire
      int r1 = w.getIndexRouter1();
      int r2 = w.getIndexRouter2();
      isConnectRouter = w.getIndexRouter1();
      //-- get router object
      if((r1<defaultRouterVector.size()) &&(r2<defaultRouterVector.size()) )
      {
      if( r1 >= 0 ){
      Router rt1 = (Router)defaultRouterVector.elementAt(r1);
      Router rt2 = (Router)defaultRouterVector.elementAt(r2);

      }
      }
    }

    //-- draw line
    if(routerImg.size() !=0 || vWire.size()!=0 )
    {
      //-- between wire and host
      for (int i=0; i < vWire.size() ;i++){

        Wire w1 = (Wire)vWire.elementAt(i);
        WireImage wImg = (WireImage)wireImg.elementAt(i);

        int x4 = wImg.getXPos() + (wImg.getWide() / 2 );
        int y4 = wImg.getYPos() + (wImg.getHigh() / 2 );

        //-- draw host line ----------------------------------------------------
        for( int k=0 ; k < Host.vHost.size() ; k++ ){
          Host host = (Host)Host.vHost.elementAt(k);
          int x3 = host.getXPos() + (host.getWide() / 2 );
          int y3 = host.getYPos() + (host.getHigh() / 2 );

          if( host.getWireIndex() == i ){
            //-- paint line
            g.drawLine(x4,y4-1,x3,y3-1);
            g.drawLine(x4,y4,x3,y3);
          }
        }

        //-- between router and wire -------------------------------------------
        for ( int k=0; k < defaultRouterVector.size(); k++ ){

          Router rt1 = (Router)defaultRouterVector.elementAt(k);
          if(defaultRouterVector.size()==routerImg.size())
          {
          RouterImg r1 = (RouterImg)routerImg.elementAt(k);

          int x1 = r1.getXPos() + (r1.getWide() / 2 );
          int y1 = r1.getYPos() + (r1.getHigh() / 2 );

          for(int j=0; j < vWire.size() ; j++ ){

            wi = (Wire)vWire.elementAt(j);
            WireImage w = (WireImage)wireImg.elementAt(j);

            int x2 = w.getXPos() + (w.getWide() / 2 );
            int y2 = w.getYPos() + (w.getHigh() / 2 );

            if( wi.getIndexRouter1() == k || wi.getIndexRouter2() == k ){ //-- compare by index of router

              String temp = "";
              if( wi.getIndexRouter1() == k  ) temp = wi.getIntName1();
              else temp = wi.getIntName2();
              //-- paint line
              g.drawLine(x1,y1-1,x2,y2-1);
              g.drawLine(x1,y1,x2,y2);
              g.drawLine(x1,y1+1,x2,y2+1);
              //-- paint interface name
              g.setFont(new Font("Tahoma", Font.PLAIN, 10));
              g.setColor(Color.red);
              if( (x1<x2)&&(y1<y2) ) g.drawString( temp , x2-40 , y2-20 );
              else if( (x1==x2)&&(y1<y2) ) g.drawString( temp , x2 , y2-20 );
              else if( (x1>x2)&&(y1<y2) ) g.drawString( temp , x2+30 , y2-20 );
              else if( (x1>x2)&&(y1==y2) ) g.drawString( temp , x2+40 , y2-5 );
              else if( (x1==x2)&&(y1>y2) ) g.drawString( temp , x2 , y2+25 );
              else if( (x1<x2)&&(y1>y2) ) g.drawString( temp , x2-40 , y2+25 );
              else if( (x1<x2)&&(y1==y2) ) g.drawString( temp , x2-70 , y2-5 );
              else if( (x1>x2)&&(y1>y2) ) g.drawString( temp , x2+30 , y2+25 );
              g.setColor(Color.black);
            }
          }
        }
        }//end if
      }//end for
    }
    g.setColor(Color.black);

      paintRouter(g);
      paintWire(g);
      paintHost(g);


  }

  //-- paint router on screen
  public void paintRouter(Graphics g){
  System.out.println("routerImgsize1:"+ routerImg.size());
  try {
    if((nr.getvRouter().size()!=0) || (ImageMotion.routerImg.size()!=0))
    {
      int sizeR = nr.getvRouter().size();
      int sizeImg = routerImg.size();
      if((sizeR >= sizeImg) && (FileIO.load == 1)){
        int dif = sizeR -sizeImg;
        Vector Vr = new Vector();
        Vr= nr.getvRouter();
        nr.setvRouter();
        // create new routerImg = number of router
        if(sizeR>sizeImg)
        {
        for(int j=sizeImg;j<sizeR;j++)
        {
          RouterImg nrimg = new RouterImg(((Router)nr.getvRouter().elementAt(j)).getModel());
          ImageMotion.routerImg.addElement(nrimg);
        }
        }
        else
        {
        System.out.println("vNamesize1:"+ nr.getvName().size());
        for( int i=0 ;i<routerImg.size(); i++ ) {
          RouterImg rimg = (RouterImg)routerImg.elementAt(i);
          g.drawString(String.valueOf(nr.getvName().elementAt(i)),rimg.getXPos() ,rimg.getYPos()+rimg.getHigh());
          g.drawImage(rimg.getImge(),rimg.getXPos(),rimg.getYPos(),this);
        }//end for
        }
      }
      else if(routerImg.size()>sizeR)
      {
        int dif1 = sizeImg-sizeR;
        for(int j=sizeR;j<sizeImg;j++)
        {
          ImageMotion.routerImg.removeElementAt(j);
          Delete_wire_connect_router(j);
          if(Frame3.vFrame.size()!= 0)
          {
          Frame3.vConsole.removeElementAt(j);
          Frame3.vFrame.removeElementAt(j);
          }
        }

        for( int i=0 ;i<sizeR; i++ ) {
          RouterImg rimg = (RouterImg)routerImg.elementAt(i);
          g.drawString(String.valueOf(nr.getvName().elementAt(i)),rimg.getXPos() ,rimg.getYPos()+rimg.getHigh());
          g.drawImage(rimg.getImge(),rimg.getXPos(),rimg.getYPos(),this);
        }//end for
      }
    }
    }//end try
    catch(java.lang.ClassCastException e){
      System.out.println("Exception paintrouter:"+e);
      System.exit(0);
    }
    catch(java.lang.ArrayIndexOutOfBoundsException e1){
      e1.printStackTrace();
      System.out.println("Exception paintrouter2:"+e1);
      System.exit(0);
    }
    catch(Exception  e1){      System.out.println("Exception paintrouter3:"+e1);
      System.exit(0);
    }
  }

  public void paintWire(Graphics g){
    boolean found = false;
    for( int i=0 ; i < wireImg.size() ; i++ ) {
      WireImage wimg = (WireImage)wireImg.elementAt(i);
      Wire w1 = (Wire)vWire.elementAt(i);
      try {
        g.drawImage(wimg.getImge(),wimg.getXPos(),wimg.getYPos(),this);
        g.setColor( Color.DARK_GRAY );
        g.drawString(w1.getNetworkAddress(),wimg.getXPos()+20 ,wimg.getYPos()+wimg.getHigh()+13  );
        g.setColor( Color.black);

        //-- draw cost
        Vector defaultRouterVector = new Vector();
        Wire wi = null ;
        try{
          defaultRouterVector = nr.getvRouter();
          for(int k=0;k<defaultRouterVector.size();k++)
          {
            Router ro = (Router)defaultRouterVector.elementAt(k);
             if(ro.getFlag()=='o')
             {
               found = true;
             }
          }
        }
        catch( Exception e ){
          System.out.println("Image Motion Error"+ e );
        }
      }

      catch(Exception e){
      }
    }
    //-- Set wire cost
    if(found)
    {
    for(int j=0; j < ImageMotion.vWire.size() ; j++ ){
      WireImage wimg = (WireImage)wireImg.elementAt(j);
      Wire w = (Wire)ImageMotion.vWire.elementAt(j);
      g.setColor(Color.BLUE);
      //System.out.print("Cost:"+w.getCost()+"\n");
      g.drawString("Cost : "+w.getCost(),wimg.getXPos() + (wimg.getWide()/2 )-15 ,wimg.getYPos() - 7  );
      g.setColor(Color.black);
    }
  }// end if
  }

  public void paintHost(Graphics g){
    try{
      for( int i=0 ; i < Host.vHost.size(); i++ ) {
        Host host = (Host)Host.vHost.elementAt(i);
        g.drawImage(host.getImge(),host.getXPos(),host.getYPos(),this);
        g.drawString(host.getIP(),host.getXPos() ,host.getYPos()+host.getHigh()+10);
      }
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  }
  //-- MouseListener event handlers
  public void mouseClicked( MouseEvent e ) {

   // repaint();
    int i = 0;
    int dx,dy;
    dx = e.getX();
    dy = e.getY();
    defaultRouterImage = null;
    while( i < routerImg.size() ) {
      if( e.getClickCount() == 2 ) { // Double Click on object
        defaultRouterImage = (RouterImg)routerImg.elementAt(i);
        if ((dx < defaultRouterImage.getXPos()+ defaultRouterImage.getWide()) && (dx > defaultRouterImage.getXPos())
            && (dy  > defaultRouterImage.getYPos()) && (dy < defaultRouterImage.getYPos() + defaultRouterImage.getHigh())){

          try{
            NewConsole();
          }
          catch(Exception e1){
            e1.printStackTrace();
          }
        }
        else {}
      }
      i++;
    }

    i=0;
    defaultHost = null;

    while( i < Host.vHost.size() ) {
      if( e.getClickCount() == 2 ) { // Double Click on object
        defaultHost = (Host)Host.vHost.elementAt(i);
        if ((dx < defaultHost.getXPos()+ defaultHost.getWide()) && (dx > defaultHost.getXPos())
            && (dy  > defaultHost.getYPos()) && (dy < defaultHost.getYPos() + defaultHost.getHigh())){
        }
        else {}
      }
      i++;
    }
  }

  //-- Check mouse pressed in image
  public void mousePressed( MouseEvent e ) {

    int i = 0;
    int dx,dy;
    pressinrouter = false;
    pressinwire = false;
    pressinhost = false;
    dx = e.getX();
    dy = e.getY();
    defaultRouterImage = null ; // clear value

    while( ( i < routerImg.size() ) && ( !pressinrouter ) ) {
      defaultRouterImage = (RouterImg)routerImg.elementAt(i);
      if ((dx < defaultRouterImage.getXPos()+ defaultRouterImage.getWide()) && (dx > defaultRouterImage.getXPos())
          && (dy  > defaultRouterImage.getYPos()) && (dy < defaultRouterImage.getYPos() + defaultRouterImage.getHigh())){

        checkForTriggerRouterEvent(  e  );
        indexOfRouter = i;
        pressinrouter = true;
      }
      else {}
      i++;
    }

    i =0;
    defaultWireImage = null ;

    while( ( i < wireImg.size() ) && ( !pressinwire ) ) {

      defaultWireImage = (WireImage)wireImg.elementAt(i);
      if ((dx < defaultWireImage.getXPos()+ defaultWireImage.getWide()) && (dx > defaultWireImage.getXPos())
          && (dy  > defaultWireImage.getYPos()) && (dy < defaultWireImage.getYPos() + defaultWireImage.getHigh())){

        checkForTriggerWireEvent(e);
        indexOfWire = i;
        pressinwire = true;
      }
      else {}
      i++;
    }

    i=0;
    defaultHost = null;

    while( ( i < Host.vHost.size() ) && ( !pressinhost ) ) {
      defaultHost = (Host)Host.vHost.elementAt(i);
      if ((dx < defaultHost.getXPos()+ defaultHost.getWide()) && (dx > defaultHost.getXPos())
          && (dy  > defaultHost.getYPos()) && (dy < defaultHost.getYPos() + defaultHost.getHigh())){

        checkForTriggerEvent_host(  e  );
        indexOfHost = i;
        pressinhost = true;
      }
      else {}
      i++;
    }
  }

  //-- check mouse drag
  public void mouseDragged( MouseEvent e ) {

    int dx,dy;
    if (pressinrouter){

      dx = e.getX();
      dy = e.getY();
      if ((dx < this.getWidth()) && (dx >= 0) // screen detective  //
          && (dy < this.getHeight()) && (dy >= 0)){
        defaultRouterImage.setXPos(e.getX()-20);
        defaultRouterImage.setYPos(e.getY()-10);
      }
      repaint();
    }
    else if (pressinwire){
      dx = e.getX();
      dy = e.getY();
      if ((dx < this.getWidth()) && (dx >= 0) // screen detective
          && (dy < this.getHeight()) && (dy >= 0)){
        defaultWireImage.setXPos(e.getX()-40);
        defaultWireImage.setYPos(e.getY()-8);
      }
      repaint();
    }
    else if ((pressinhost)){
      dx = e.getX();
      dy = e.getY();
      if ((dx < this.getWidth()) && (dx >= 0) // screen detective
          && (dy < this.getHeight()) && (dy >= 0)){
        defaultHost.setXPos(e.getX()-16);
        defaultHost.setYPos(e.getY()-16);
      }
      repaint();
    }
  }

  //-- check release mouse
  public void mouseReleased( MouseEvent e ) {
    pressinrouter = false;
    pressinwire = false;
    pressinhost = false;
  }

  //-- check mouse enter pane
  public void mouseEntered( MouseEvent e ) {
    //repaint();
  }

  public void mouseExited( MouseEvent e ) {
  }

  public void mouseMoved( MouseEvent e ) {
  }

  //-- return routerImg
  public Vector getRouterImg(){
    return routerImg;
  }

  //-- check router is triged
  private void checkForTriggerRouterEvent( MouseEvent e ){

    int m = e.getModifiers();

    if ( ( m & InputEvent.BUTTON3_MASK) != 0 ) {

      routerPopup.show( e.getComponent() , e.getX() , e.getY());
    }
  }

  //-- check wire is triged
  private void checkForTriggerWireEvent( MouseEvent e ){

    int m = e.getModifiers();

    if ( ( m & InputEvent.BUTTON3_MASK) != 0 ) {
      wirePopup.enable();
      wirePopup.show( e.getComponent() , e.getX() , e.getY());
    }
  }

  //-- check host is triged
  private void checkForTriggerEvent_host( MouseEvent e ){

    int m = e.getModifiers();

    if ( ( m & InputEvent.BUTTON3_MASK) != 0 ) {
      hostPopup.show( e.getComponent() , e.getX() , e.getY());
    }
  }

  //-- delete router
  void Delete_Router() {

    try{
      if(indexOfRouter!= -1){
        if(nr.getvRouter().size()!= 0){
          nr.setvRouter();

          //-- delete wire that connect to this router
          Vector vi = new Vector();
          Delete_wire_connect_router(indexOfRouter);

          for(int j=0;j<Host.vHost.size();j++){
            Host h =(Host)Host.vHost.elementAt(j);
            if(indexOfRouter == h.getWireIndex()){  //-- here
              Host.vHost.removeElementAt(j);
              j=j-1;
            }
          }
          routerImg.removeElementAt(indexOfRouter);
          StatusPanelInt st = (StatusPanelInt)Naming.lookup("//"+serverName+"/SPservice");
          st.DeleteRouter(indexOfRouter);
          nr.DelRouter(indexOfRouter);
          Frame3.vConsole.removeElementAt(indexOfRouter);
          Frame3.vFrame.removeElementAt(indexOfRouter);
          Frame3.ShowNewStatus(st.getPanel1());
          routerPopup.disable();
          indexOfRouter = -1;
          repaint();
        }
      }
    }
    catch(Exception ex1) {
      System.out.println("Exception occured: " + ex1);
    }
  }
 public void Delete_wire_connect_router(int indexOfRouter){

  try{
   for(int i=0;i<vWire.size();i++){
     Wire w =(Wire)vWire.elementAt(i);

     if(indexOfRouter == w.getIndexRouter1() || indexOfRouter == w.getIndexRouter2()){

       //-- find wire type
       String temp = "";
       switch(  w.getType() ){
         case 1: temp = "Ethernet" ;
           break;
         case 2: temp = "Serial";
           break;
         case 3: temp = "Token Ring";
           break;
         default: break;
       }

       nr.wireDelete( w.getIndexRouter1() , w.getIndexRouter2() , w.getIntName1() , w.getIntName2() , temp);
       wireImg.removeElementAt(i);
       vWire.removeElementAt(i);
       i=i-1;

     }//end if
   }//end for\
   // check index of wire

   for(int k=0;k<vWire.size();k++)
   {
     Wire w =(Wire)vWire.elementAt(k);
     int index1 = w.getIndexRouter1();
     int index2 = w.getIndexRouter2();
     if((index1>indexOfRouter))
     {
       index1=index1-1;
     }// end if
     if((index2>indexOfRouter))
     {
       index2=index2-1;
     }// end if
     w.setIndexRouter(index1,index2);
   }//end for
  }//end try
  catch(Exception ex1)
  {
    ex1.printStackTrace();
  }

 }
  //-- delete host
  public void Delete_Host(){

    if(Host.vHost.size()!= 0){
      if(indexOfHost != -1){
        if(Host.vHost.elementAt(indexOfHost).equals(null)){}
        else{

          Host h = (Host)Host.vHost.elementAt( indexOfHost );
          int i = h.getWireIndex();

          if( i >= 0 ){
            Wire wt = (Wire)vWire.elementAt(i);
            wt.setHostIndex( -1 );  //-- remove host index from wire
          }

          Host.vHost.removeElementAt(indexOfHost);
          indexOfHost = -1;
          repaint();
        }
      }
    }
  }

  //-- delete wire
  public void Delete_Wire() {

    Wire w = null;
    String temp = "";

    if(indexOfWire != -1) { //-- have not wire object

      try{
        w = (Wire)ImageMotion.vWire.elementAt( indexOfWire );

        //-- find interface name
        switch(  w.getType() ){
          case 1: temp = "Ethernet" ;
            break;
          case 2: temp = "Serial";
            break;
          case 3: temp = "Token Ring";
            break;
          default: break;
        }

        //-- delete host before delete wire
        int ho = w.getHostIndex();
        if( ho >= 0 ){
          //-- has host connect this wire
          Host.vHost.removeElementAt( ho );
        }
        //-- install interface back
        if( w.getIndexRouter1() > 0 || w.getIndexRouter2() > 0)
        nr.wireDelete( w.getIndexRouter1() , w.getIndexRouter2() , w.getIntName1() , w.getIntName2() , temp);
        ImageMotion.vWire.removeElementAt(indexOfWire);  //-- delete from vector of wire
        ImageMotion.wireImg.removeElementAt(indexOfWire); //-- delete from vector of wire image
        repaint();

      }
      catch( Exception e ){
      }
      indexOfWire = -1;
    }
  }

  //-- generate traffic
  public void Generate_Traffic(){

    Traffic traf = new Traffic();
    traf.setVisible(true);
  }

  //-- set routername
  public void setRname(String name){

    Rname = name;
  }

  //-- get routername
  public String getRname(){
    return Rname;
  }

  //-- set hostname
  public void setHname(String name)
  {
    Hname = name;
  }
  //-- get routername
  public String getHname(){
    return Hname;
  }

  //-- new console
  public void NewConsole(){

    try{
     FrameR fr=(FrameR)Frame3.vFrame.elementAt(indexOfRouter);
     fr.setVisible(true);
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }

  //-- Handler class -----------------------------------------------------------
  //-- router handlered
  private class ItemHandler implements ActionListener {
    public void actionPerformed( ActionEvent e ){

      //-- determine which menu item was selected
      if( e.getSource() == items_r[ 0 ] ){ // new Console
        NewConsole();
      }
      else if( e.getSource() == items_r[1] ){

        System.out.println(" Export Config");
        saveActionPerformed( e ) ;
      }
      else if( e.getSource() == items_r[ 2 ] ){ // delete Router
        try {
          Delete_Router();
          System.out.println("vStatus:" +nr.getvStatus());
        }
        catch(Exception e1){}
      }
    }
  }

  //-- host handler
  private class ItemHandler1 implements ActionListener {
    public void actionPerformed( ActionEvent e ){

      if( e.getSource() == items_h[ 0 ] ){ // host setting

        try {

          HostDialog hd = new HostDialog(indexOfHost);
          hd.setVisible(true);
          Host h =(Host)Host.vHost.elementAt(indexOfHost);
          hConnect.addElement(h);
          //repaint();
        }
        catch(Exception e1){
          e1.printStackTrace();
        }
      }
      else if( e.getSource() == items_h[ 1 ] ){ // host commands

        // host commands dialog
        Host h = (Host)Host.vHost.elementAt(indexOfHost);
        HostCommandDialog hcd = new HostCommandDialog( h.getIP() , indexOfHost );
        hcd.setVisible(true);
      }
      else if( e.getSource() == items_h[ 2 ] ){ // Delete of host

        Delete_Host();
      }
    }
  }

  //-- wire handler
  private class ItemHandler2 implements ActionListener {
    public void actionPerformed( ActionEvent e ){

      //-- determine which menu item was selected
      if( e.getSource() == items2[ 0 ] ){ // Connect

        wirePopup.disable();
        repaint();
        try{
          nr.setvRouter();
        }
        catch (Exception ex2){ex2.printStackTrace();}

        WireDialog d = new WireDialog( indexOfWire );
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        Dimension frameSize = d.getSize();

        if (frameSize.height > screenSize.height) {

          frameSize.height = screenSize.height;
        }
        if (frameSize.width > screenSize.width) {

          frameSize.width = screenSize.width;
        }
        d.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
        d.setVisible(true);
      }
      else if( e.getSource() == items2[ 1 ] ){
        wirePopup.disable();
        repaint();
        BWDialog bwd = new BWDialog(indexOfWire);
        bwd.setVisible(true);
      }
      else if( e.getSource() == items2[ 2 ] ){
        NetAddressDialog net = new NetAddressDialog(indexOfWire);
        net.setVisible(true);
        repaint();
      }
      else if( e.getSource() == items2[ 3 ] ){
        wirePopup.disable();
        Delete_Wire();
      }
    }
  }

  public void saveActionPerformed(ActionEvent e) {

    final JFileChooser fc = new JFileChooser();
    int returnVal = fc.showSaveDialog(ImageMotion.this);

    if (returnVal == JFileChooser.APPROVE_OPTION) {

      File file = fc.getSelectedFile();
      saveFile( file.getParent() , file.getName() );
    } else {
      }
  }

  public void saveFile( String path , String file ){

    try {
     serverName = Frame3.serverName;
   }
   catch(Exception ex) {
     ex.printStackTrace();
   }

   try{

     //-- find router
     Vector dfr = nr.getvRouter();
     Router ron = (Router)dfr.elementAt(indexOfRouter);

     CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");

     String text = c1.exportFile( ron );

     //-- save to target file
     File f = new File( path , file );
     FileWriter fout = new FileWriter( f );
     BufferedWriter bout = new BufferedWriter(fout);
     PrintWriter pout = new PrintWriter(bout);
     pout.print(text);
     pout.close();

   }catch( Exception e ){}
 }


  //-- Handler class -----------------------------------------------------------
}//end class
