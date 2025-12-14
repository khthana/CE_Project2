//package DBAService;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.io.*;
//import java.util.*;
import java.net.*;
import java.net.URL;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;

//import com.borland.jbcl.layout.*;
//import com.borland.jbcl.control.*;

public class DbaManagement extends Applet  {
  boolean isStandalone = false;
  int Test=0;
  List list1 = new List();
  Button SGrid = new Button();
  Button Insert = new Button();
  Panel panel2 = new Panel();
  TextArea ImageSelect = new TextArea();
  Label L_Id = new Label();
  Label L_Position = new Label();
  Label L_Address = new Label();
  TextField TE_Id = new TextField();
  TextField TE_Position = new TextField();
  TextField TE_Number = new TextField();
  Label L_Status = new Label();
  Label L_Bathroom = new Label();
  Label L_Bedroom = new Label();
  Label L_Floor = new Label();
  TextField TE_Status = new TextField();
  TextField TE_BathRoom = new TextField();
  TextField TE_BedRoom = new TextField();
  Label label2 = new Label();
  Label label3 = new Label();
  TextArea TA1 = new TextArea();
  TextField TE_Floor = new TextField();
  Label L_TypeHome = new Label();
  Label L_Price = new Label();
  TextField TE_TypeHome = new TextField();
  TextField TE_Price = new TextField();
  Label L_Kitchen = new Label();
  TextField TE_Kitchen = new TextField();
  Label L_PlayR = new Label();
  TextField HAmphur = new TextField();
  Panel panel1 = new Panel();
  Label label10 = new Label();
  TextField TE_Id2 = new TextField();
  Label L_Id2 = new Label();
  Label L_Id3 = new Label();
  Image gif,gif2,gif3,gif4,T_RoadV;
  Image T_Cross3,T_Cross3R,T_Cross3Up,T_Cross3D,T_Cross4,T_Curve1,T_Curve2,T_Curve3,T_Curve4;
  Image T_Tree,T_RiverV,T_RiverH,T_HomeF,T_Condo,T_TownHouse,T_HomeType2,T_HomeType3,PicStatus;
  int x, y,Col,Row,len,colon,sami;
  int posX=0;
  int posY=0;
  boolean ShowGridCheck = false;
  boolean CheckPaint=false;
  boolean EnableClick=true;
  String pic="";
  String PicTmp="";
  String TmpStr1="";
  String TmpStr2="";
  String ProjectID="";
  String ProjectName="";
  String G_nameP="";
  String G_numberP = "";
  String G_zipcodeP = "";
  String G_telephoneP = "";
  String G_companyP = "";
  String G_amphurP = "";
  String G_provinceP = "";
  String G_daySP = "";
  String G_mouthSP = "";
  String G_yearSP = "";
  String G_dayEP = "";
  String G_mouthEP = "";
  String G_yearEP = "";
  String DateStart="";
  String DateEnd="";
  String DataProject="";
  String Hid = "";
  String Hnumber= "";
  String Hamphur= "";
  String Hprovince="";
  String HType= "";
  String HStatus= "";
  String HFloor= "";
  String HBedroom= "";
  String HBathroom= "";
  String HKitchen= "";
  String HArea= "";
  String HPrice= "";
  String HPositionX="";
  String HPositionY="";
  String[][] PicHp = new String[8][10];
  String Home[] = {"home","Condo","HomeF","HomeType2","HomeType3","home_Rest"};
  int initX=344;
  int initY=150;
  int selectX=0;
  int selectY=0;
  int position=0;
  int positionX=0;
  int positionY=0;


  int semi;
  int leng;
  double C,R;
  String Name="";
  InputStream file = null;
 	URL url;
 	byte[] bytestream;
  Button Update = new Button();
  Button ClearMap = new Button();
  Label label4 = new Label();
  Label label5 = new Label();
  boolean ModeImage = true;
  boolean SelectHome = false;
  boolean ImageHome = false;
  String ProjectId="";
  //Construct the applet
  public DbaManagement() {
  }

  //Initialize the applet
  public void init() {
    try  {

      jbInit();
    }
    catch(Exception e)  {
      e.printStackTrace();
    }
  }

  //Component initialization
  private void jbInit() throws Exception {


    this.setLayout(null);
    this.setBackground(SystemColor.controlLtHighlight);
    this.addMouseListener(new java.awt.event.MouseAdapter() {

      public void mousePressed(MouseEvent e) {
        this_mousePressed(e);
      }
    });

    list1.setBounds(new Rectangle(814, 134, 150, 283));
    SGrid.setBounds(new Rectangle(659, 150, 74, 23));
    SGrid.setLabel("ShowGrid");
    SGrid.addActionListener(new java.awt.event.ActionListener() {

     public void actionPerformed(ActionEvent e) {
        SGrid_actionPerformed(e);
      }
    });
    Insert.setBounds(new Rectangle(659, 173, 74, 21));
    Insert.setLabel("Insert");
    Insert.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        Insert_actionPerformed(e);
      }
    });
    panel2.setBackground(Color.lightGray);
    panel2.setBounds(new Rectangle(110, 460, 762, 105));
    panel2.setFont(new java.awt.Font("Monospaced", 1, 13));
    panel2.setLayout(null);
    ImageSelect.setBounds(new Rectangle(17, 28, 76, 64));
    ImageSelect.setText(" ");
    L_Id.setBounds(new Rectangle(104, 5, 48, 21));
    L_Id.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id.setText(" รหัส");
    L_Position.setBounds(new Rectangle(104, 52, 57, 23));
    L_Position.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Position.setText(" ตำแหน่ง");
    L_Address.setBounds(new Rectangle(170, 4, 48, 23));
    L_Address.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Address.setText("เลขที่");
    TE_Id.setBounds(new Rectangle(110, 25, 47, 21));
    TE_Id.setFont(new java.awt.Font("SansSerif", 0, 13));
    TE_Id.setText(" ");
    TE_Position.setBounds(new Rectangle(113, 76, 46, 20));
    TE_Position.setFont(new java.awt.Font("Dialog", 0, 10));
    TE_Position.setText(" ");
    TE_Number.setBounds(new Rectangle(170, 26, 53, 21));
    TE_Number.setFont(new java.awt.Font("SansSerif", 0, 14));
    TE_Number.setText(" ");
    L_Status.setBounds(new Rectangle(489, 5, 48, 23));
    L_Status.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Status.setText("สถานะ");
    L_Bathroom.setBounds(new Rectangle(301, 51, 66, 22));
    L_Bathroom.setFont(new java.awt.Font("Monospaced", 1, 13));
    L_Bathroom.setText("ห้องน้ำ");
    L_Bedroom.setBounds(new Rectangle(237, 53, 53, 22));
    L_Bedroom.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Bedroom.setText("ห้องนอน");
    L_Floor.setBounds(new Rectangle(172, 52, 37, 23));
    L_Floor.setFont(new java.awt.Font("Monospaced", 1, 13));
    L_Floor.setText("ชั้น");
    TE_Status.setBounds(new Rectangle(488, 27, 76, 22));
    TE_Status.setFont(new java.awt.Font("SansSerif", 0, 17));
    TE_Status.setText(" ");
    TE_BathRoom.setBounds(new Rectangle(302, 74, 56, 21));
    TE_BathRoom.setFont(new java.awt.Font("SansSerif", 0, 13));
    TE_BathRoom.setText(" ");
    TE_BedRoom.setText(" ");
    TE_BedRoom.setBounds(new Rectangle(236, 75, 53, 21));
    TE_BedRoom.setFont(new java.awt.Font("SansSerif", 0, 13));
    label2.setBackground(SystemColor.controlLtHighlight);
    label2.setBounds(new Rectangle(1, 1, 173, 53));
    label2.setFont(new java.awt.Font("Dialog", 1, 25));
    label2.setForeground(Color.blue);
    label2.setText("Project Editor");
    label3.setBounds(new Rectangle(17, 5, 77, 23));
    label3.setFont(new java.awt.Font("Dialog", 1, 16));
    label3.setForeground(Color.red);
    label3.setText("ข้อมูลบ้าน");
    Update.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        Update_actionPerformed(e);
      }
    });

    Update.setLabel("Update");
    Update.setBounds(new Rectangle(659, 194, 74, 21));
    ClearMap.setBounds(new Rectangle(659, 215, 74, 21));
    ClearMap.setLabel("ClearMap");
    ClearMap.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        ClearMap_actionPerformed(e);
      }
    });
    label4.setBackground(new java.awt.Color(0, 173, 169));
    label4.setBounds(new Rectangle(274, 191, 43, 23));
    label4.setFont(new java.awt.Font("Serif", 1, 12));
    label4.setForeground(Color.red);
    label4.setText("Status");
    label5.setBounds(new Rectangle(852, 110, 71, 27));
    label5.setFont(new java.awt.Font("Serif", 1, 18));
    label5.setText("ชื่อโครงการ");
    TA1.setBounds(new Rectangle(890, 26, 91, 81));
    TA1.setText(" ");
    TE_Floor.setBounds(new Rectangle(172, 75, 52, 21));
    TE_Floor.setFont(new java.awt.Font("SansSerif", 0, 13));
    TE_Floor.setText(" ");
    L_TypeHome.setBounds(new Rectangle(386, 5, 55, 20));
    L_TypeHome.setFont(new java.awt.Font("Monospaced", 1, 13));
    L_TypeHome.setText("ประเภท");
    L_Price.setBounds(new Rectangle(535, 51, 56, 23));
    L_Price.setFont(new java.awt.Font("Monospaced", 1, 13));
    L_Price.setText("ราคา");
    TE_TypeHome.setBounds(new Rectangle(386, 27, 85, 22));
    TE_TypeHome.setFont(new java.awt.Font("SansSerif", 0, 17));
    TE_TypeHome.setText("  ");
    TE_Price.setBounds(new Rectangle(534, 74, 76, 22));
    TE_Price.setFont(new java.awt.Font("Dialog", 0, 13));
    L_Kitchen.setBounds(new Rectangle(370, 52, 48, 23));
    L_Kitchen.setFont(new java.awt.Font("Monospaced", 1, 13));
    L_Kitchen.setText("ห้องครัว");
    TE_Kitchen.setBounds(new Rectangle(370, 74, 54, 22));
    TE_Kitchen.setFont(new java.awt.Font("SansSerif", 0, 13));
    TE_Kitchen.setText(" ");
    L_PlayR.setText("อำเภท");
    L_PlayR.setFont(new java.awt.Font("Monospaced", 1, 13));
    L_PlayR.setBounds(new Rectangle(236, 1, 70, 25));
    HAmphur.setBounds(new Rectangle(236, 25, 62, 22));
    HAmphur.setFont(new java.awt.Font("SansSerif", 0, 17));
    panel1.setBackground(Color.lightGray);
    panel1.setBounds(new Rectangle(177, 9, 698, 99));
    panel1.setLayout(null);
    label10.setText("ข้อมูลโครงการ");
    label10.setBounds(new Rectangle(6, 3, 117, 28));
    label10.setFont(new java.awt.Font("Dialog", 1, 16));
    label10.setForeground(Color.red);
    TE_Id2.setText(" ");
    TE_Id2.setFont(new java.awt.Font("SansSerif", 0, 14));
    TE_Id2.setBounds(new Rectangle(135, 22, 47, 23));
    L_Id2.setText(" รหัส");
    L_Id2.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id2.setBounds(new Rectangle(131, 5, 48, 16));
    L_Id3.setBounds(new Rectangle(13, 44, 68, 21));
    L_Id3.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id3.setText("ชื่อโครงการ");
    PProjectName.setBounds(new Rectangle(12, 66, 136, 24));
    PProjectName.setFont(new java.awt.Font("SansSerif", 0, 13));
    PProjectName.setText(" ");

    PNumber.setBounds(new Rectangle(192, 22, 62, 22));
    PNumber.setFont(new java.awt.Font("SansSerif", 0, 13));
    L_Id4.setText("เลขที่");
    L_Id4.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id4.setBounds(new Rectangle(192, 2, 45, 20));
    L_Id5.setBounds(new Rectangle(160, 48, 68, 21));
    L_Id5.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id5.setText("อำเภอ");
    PAmphur.setBounds(new Rectangle(160, 67, 86, 23));
    PProvince.setBounds(new Rectangle(255, 67, 112, 24));
    PZipcode.setFont(new java.awt.Font("SansSerif", 0, 13));
    PZipcode.setBounds(new Rectangle(376, 67, 72, 24));
    Company.setBounds(new Rectangle(264, 22, 103, 22));
    Company.setFont(new java.awt.Font("SansSerif", 0, 13));
    PTelephone.setBounds(new Rectangle(376, 23, 70, 22));
    PTelephone.setFont(new java.awt.Font("SansSerif", 0, 13));
    L_Id6.setText("จังหวัด");
    L_Id6.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id6.setBounds(new Rectangle(256, 47, 68, 21));
    L_Id7.setBounds(new Rectangle(270, 2, 68, 20));
    L_Id7.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id7.setText("ชื่อบริษัท");
    L_Id8.setText("รหัสไปรษณีย์");
    L_Id8.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id8.setBounds(new Rectangle(376, 47, 68, 21));
    L_Id9.setText("เบอร์โทรศัพท์");
    L_Id9.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id9.setBounds(new Rectangle(377, 2, 68, 21));
    PUpdate.setBounds(new Rectangle(622, 39, 64, 21));
    PUpdate.setLabel("Update");
    PUpdate.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        PUpdate_actionPerformed(e);
      }
    });
    PClear.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        PClear_actionPerformed(e);
      }
    });
    PClear.setLabel("Clear");
    PClear.setBounds(new Rectangle(622, 60, 64, 21));
    PInsert.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        PInsert_actionPerformed(e);
      }
    });
    PInsert.setLabel("Add");
    PInsert.setBounds(new Rectangle(622, 18, 64, 21));
    PdayS.setBounds(new Rectangle(455, 23, 36, 22));
    PmouthS.setBounds(new Rectangle(492, 24, 69, 24));
    PdayE.setBounds(new Rectangle(453, 66, 36, 22));
    PmouthE.setBounds(new Rectangle(490, 66, 69, 24));
    L_Id10.setBounds(new Rectangle(479, 1, 87, 21));
    L_Id10.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id10.setText("วันเริ่มโครงการ");
    L_Id11.setBounds(new Rectangle(469, 45, 90, 21));
    L_Id11.setFont(new java.awt.Font("Monospaced", 1, 12));
    L_Id11.setText("วันสิ้นสุดโครงการ");
    PyearS.setBounds(new Rectangle(565, 23, 47, 20));
    PyearS.setFont(new java.awt.Font("SansSerif", 0, 14));
    PyearS.setText(" ");
    PyearE.setText(" ");
    PyearE.setFont(new java.awt.Font("SansSerif", 0, 14));
    PyearE.setBounds(new Rectangle(563, 64, 47, 20));
    label1.setBounds(new Rectangle(904, 7, 71, 19));
    label1.setFont(new java.awt.Font("Dialog", 1, 14));
    label1.setForeground(Color.red);
    label1.setText("DISPLAY");
    Area.setText(" ");
    Area.setFont(new java.awt.Font("SansSerif", 0, 13));
    Area.setBounds(new Rectangle(437, 73, 54, 22));
    label6.setBounds(new Rectangle(497, 72, 32, 24));
    label6.setText("ตรว.");
    label8.setBounds(new Rectangle(615, 74, 47, 24));
    label8.setText("บาท");
    HInsert.setBounds(new Rectangle(681, 28, 64, 21));
    HInsert.setFont(new java.awt.Font("Dialog", 0, 13));
    HInsert.setLabel("Add");
    HInsert.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        HInsert_actionPerformed(e);
      }
    });
    HClear.setBounds(new Rectangle(681, 70, 64, 21));
    HClear.setFont(new java.awt.Font("Dialog", 0, 13));
    HClear.setLabel("Clear");
    HClear.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        HClear_actionPerformed(e);
      }
    });
    HUpdate.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        HUpdate_actionPerformed(e);
      }
    });
    HUpdate.setLabel("Update");
    HUpdate.setBounds(new Rectangle(681, 49, 64, 21));
    HUpdate.setFont(new java.awt.Font("Dialog", 0, 13));
    HProvince.setFont(new java.awt.Font("SansSerif", 0, 17));
    HProvince.setBounds(new Rectangle(310, 26, 62, 22));
    label7.setBounds(new Rectangle(311, 3, 62, 24));
    label7.setText("จังหวัด");
    label9.setBounds(new Rectangle(436, 51, 62, 24));
    label9.setText("พื้นที่");
    ImproveImage.setBounds(new Rectangle(248, 410, 251, 19));
    ImproveImage.setLabel("แก้ไขรูปภาพ");
    ImproveImage.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        ImproveImage_actionPerformed(e);
      }
    });
    ImproveHome.setBounds(new Rectangle(499, 410, 252, 19));
    ImproveHome.setLabel("แก้ไขข้อมูลบ้าน");
    ImproveHome.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        ImproveHome_actionPerformed(e);
      }
    });
    this.add(list1, null);
    this.add(SGrid, null);
    this.add(Insert, null);
    this.add(Update, null);
    this.add(label4, null);
    this.add(label5, null);
    this.add(ClearMap, null);
    this.add(TA1, null,TextArea.SCROLLBARS_NONE);
    this.add(label2, null);
    this.add(panel1, null);
    panel1.add(label10, null);
    panel1.add(PProjectName, null);
    panel1.add(L_Id3, null);
    panel1.add(L_Id2, null);
    panel1.add(TE_Id2, null);
    panel1.add(L_Id4, null);
    panel1.add(L_Id7, null);
    panel1.add(PNumber, null);
    panel1.add(PAmphur, null);
    panel1.add(L_Id5, null);
    panel1.add(PProvince, null);
    panel1.add(L_Id6, null);
    panel1.add(Company, null);
    panel1.add(PZipcode, null);
    panel1.add(L_Id8, null);
    panel1.add(PTelephone, null);
    panel1.add(L_Id9, null);
    panel1.add(PdayS, null);
          PdayS.addItem("วัน");
          PdayS.addItem("1");
          PdayS.addItem("2");
          PdayS.addItem("3");
          PdayS.addItem("4");
          PdayS.addItem("5");
          PdayS.addItem("6");
          PdayS.addItem("7");
          PdayS.addItem("8");
          PdayS.addItem("9");
          PdayS.addItem("10");
          PdayS.addItem("11");
          PdayS.addItem("12");
          PdayS.addItem("13");
          PdayS.addItem("14");
          PdayS.addItem("15");
          PdayS.addItem("16");
          PdayS.addItem("17");
          PdayS.addItem("18");
          PdayS.addItem("19");
          PdayS.addItem("20");
          PdayS.addItem("21");
          PdayS.addItem("22");
          PdayS.addItem("23");
          PdayS.addItem("24");
          PdayS.addItem("25");
          PdayS.addItem("26");
          PdayS.addItem("27");
          PdayS.addItem("28");
          PdayS.addItem("29");
          PdayS.addItem("30");
          PdayS.addItem("31");

         PmouthS.addItem("เดือน");
         PmouthS.addItem("มกราคม");
         PmouthS.addItem("กุมภาพันธ์");
         PmouthS.addItem("มีนาคม");
         PmouthS.addItem("เมษายน");
         PmouthS.addItem("พฤษภาคม");
         PmouthS.addItem("มิถุนายน");
         PmouthS.addItem("กรกฎาคม");
         PmouthS.addItem("สิงหาคม");
         PmouthS.addItem("กันยายน");
         PmouthS.addItem("ตุลาคม");
         PmouthS.addItem("พฤศจิกายน");
         PmouthS.addItem("ธันวาคม");


    panel1.add(PdayE, null);
          PdayE.addItem("วัน");
          PdayE.addItem("1");
          PdayE.addItem("2");
          PdayE.addItem("3");
          PdayE.addItem("4");
          PdayE.addItem("5");
          PdayE.addItem("6");
          PdayE.addItem("7");
          PdayE.addItem("8");
          PdayE.addItem("9");
          PdayE.addItem("10");
          PdayE.addItem("11");
          PdayE.addItem("12");
          PdayE.addItem("13");
          PdayE.addItem("14");
          PdayE.addItem("15");
          PdayE.addItem("16");
          PdayE.addItem("17");
          PdayE.addItem("18");
          PdayE.addItem("19");
          PdayE.addItem("20");
          PdayE.addItem("21");
          PdayE.addItem("22");
          PdayE.addItem("23");
          PdayE.addItem("24");
          PdayE.addItem("25");
          PdayE.addItem("26");
          PdayE.addItem("27");
          PdayE.addItem("28");
          PdayE.addItem("29");
          PdayE.addItem("30");
          PdayE.addItem("31");

         PmouthE.addItem("เดือน");
         PmouthE.addItem("มกราคม");
         PmouthE.addItem("กุมภาพันธ์");
         PmouthE.addItem("มีนาคม");
         PmouthE.addItem("เมษายน");
         PmouthE.addItem("พฤษภาคม");
         PmouthE.addItem("มิถุนายน");
         PmouthE.addItem("กรกฎาคม");
         PmouthE.addItem("สิงหาคม");
         PmouthE.addItem("กันยายน");
         PmouthE.addItem("ตุลาคม");
         PmouthE.addItem("พฤศจิกายน");
         PmouthE.addItem("ธันวาคม");
    panel1.add(PUpdate, null);
    panel1.add(PClear, null);
    panel1.add(PInsert, null);
    panel1.add(PyearS, null);
    panel1.add(PmouthS, null);
    panel1.add(PmouthE, null);
    panel1.add(L_Id10, null);
    panel1.add(PyearE, null);
    panel1.add(L_Id11, null);
    this.add(label1, null);
    this.add(panel2, null);
    panel2.add(label3, null);
    panel2.add(ImageSelect, null);
    panel2.add(TE_Id, null);
    panel2.add(L_Id, null);
    panel2.add(TE_Number, null);
    panel2.add(L_Address, null);
    panel2.add(HAmphur, null);
    panel2.add(L_PlayR, null);
    panel2.add(TE_Floor, null);
    panel2.add(L_Floor, null);
    panel2.add(TE_BedRoom, null);
    panel2.add(L_Bedroom, null);
    panel2.add(TE_BathRoom, null);
    panel2.add(L_Bathroom, null);
    panel2.add(TE_Kitchen, null);
    panel2.add(L_Kitchen, null);
    panel2.add(Area, null);
    panel2.add(TE_Position, null);
    panel2.add(L_Position, null);
    panel2.add(label6, null);
    panel2.add(TE_Price, null);
    panel2.add(label8, null);
    panel2.add(L_Price, null);
    panel2.add(HUpdate, null);
    panel2.add(HClear, null);
    panel2.add(HInsert, null);
    panel2.add(HProvince, null);
    panel2.add(TE_TypeHome, null);
    panel2.add(L_TypeHome, null);
    panel2.add(TE_Status, null);
    panel2.add(L_Status, null);
    panel2.add(label7, null);
    panel2.add(label9, null);
    this.add(ImproveImage, null);
    this.add(ImproveHome, null);

     PAmphur.addItem("- เลือกอำเภอ -");
     PAmphur.addItem("คลองเตย");
     PAmphur.addItem("คลองสาน");
     PAmphur.addItem("คันนายาว");
     PAmphur.addItem("จตุจักร");
     PAmphur.addItem("จอมทอง");
     PAmphur.addItem("ดอนเมือง");
     PAmphur.addItem("ดินแดง");
     PAmphur.addItem("ดุสิต");
     PAmphur.addItem("ตลิ่งชัน");
     PAmphur.addItem("ทวีวัฒนา");
     PAmphur.addItem("ทุ่งครุ");
     PAmphur.addItem("ธนบุรี");
     PAmphur.addItem("บางกอกน้อย");
     PAmphur.addItem("บางกอกใหญ่");
     PAmphur.addItem("บางกะปิ");
     PAmphur.addItem("บางขุนเทียน");
     PAmphur.addItem("บางเขน");
     PAmphur.addItem("บางคอแหลม");
     PAmphur.addItem("บางแค");
     PAmphur.addItem("บางซื่อ");
     PAmphur.addItem("บางนา");
     PAmphur.addItem("บางพลัด");
     PAmphur.addItem("บางรัก");
     PAmphur.addItem("บึงกุ่ม");
     PAmphur.addItem("ปทุมวัน");
     PAmphur.addItem("ประเวศ");
     PAmphur.addItem("ป้อมปรามศัตรูพ่าย");
     PAmphur.addItem("พญาไท");
     PAmphur.addItem("พระโขนง");
     PAmphur.addItem("พระนคร");
     PAmphur.addItem("ภาษีเจริญ");
     PAmphur.addItem("มีนบุรี");
     PAmphur.addItem("ยานนาวา");
     PAmphur.addItem("ราชเทวี");
     PAmphur.addItem("ราษฎร์บูรณะ");
     PAmphur.addItem("ลาดกระบัง");
     PAmphur.addItem("ลาดพร้าว");
     PAmphur.addItem("วังทองหลาง");
     PAmphur.addItem("วัฒนา");
     PAmphur.addItem("สวนหลวง");
     PAmphur.addItem("สะพานสูง");
     PAmphur.addItem("สัมพันธวงศ์");
     PAmphur.addItem("สาธร");
     PAmphur.addItem("สายไหม");
     PAmphur.addItem("หนองแขม");
     PAmphur.addItem("หนองจอก");
     PAmphur.addItem("หลักสี่");
     PAmphur.addItem("ห้วยขวาง");
      PProvince.addItem("- เลือกจังหวัด -");
      PProvince.addItem("กระบี่");
      PProvince.addItem("กรุงเทพฯ");
      PProvince.addItem("กาญจนบุรี");
      PProvince.addItem("กาฬสินธ์");
      PProvince.addItem("กำแพงเพชร");
      PProvince.addItem("ขอนแก่น");
      PProvince.addItem("จันทบุรี");
      PProvince.addItem("ฉะเชิงเทรา");
      PProvince.addItem("ชลบุรี");
      PProvince.addItem("ชัยนาท");
      PProvince.addItem("ชัยภูมิ");
      PProvince.addItem("ชุมพร");
      PProvince.addItem("เชียงราย");
      PProvince.addItem("เชียงใหม่");
      PProvince.addItem("ตรัง");
      PProvince.addItem("ตราด");
      PProvince.addItem("ตาก");
      PProvince.addItem("นครนายก");
      PProvince.addItem("นครปฐม");
      PProvince.addItem("นครพนม");
      PProvince.addItem("นครราชสีมา");
      PProvince.addItem("นครศรีธรรมราช");
      PProvince.addItem("นครสวรรค์");
      PProvince.addItem("นนทบุรี");
      PProvince.addItem("นราธิวาส");
      PProvince.addItem("น่าน");
      PProvince.addItem("บุรีรัมย์");
      PProvince.addItem("ปทุมธานี");
      PProvince.addItem("ประจวบคีรีขันธ์");
      PProvince.addItem("ปราจีนบุรี");
      PProvince.addItem("ปัตตานี");
      PProvince.addItem("พระนครศรีอยุธยา");
      PProvince.addItem("พะเยา");
      PProvince.addItem("พังงา");
      PProvince.addItem("พัทลุง");
      PProvince.addItem("พิษณุโลก");
      PProvince.addItem("เพชรบุรี");
      PProvince.addItem("เพชรบูรณ์");
      PProvince.addItem("แพร่");
      PProvince.addItem("ภูเก็ต");
      PProvince.addItem("มหาสารคาม");
      PProvince.addItem("มุกดาหาร");
      PProvince.addItem("แม่ฮ่องสอน");
      PProvince.addItem("ยโสธร");
      PProvince.addItem("ยะลา");
    gif = getImage(getCodeBase(),"images/T_home.gif");
    gif2 = getImage(getCodeBase(),"images/T_road.gif");
    gif3 = getImage(getCodeBase(),"images/T_floor.gif");
    T_RoadV = getImage(getCodeBase(),"images/T_RoadV.gif");
    T_Cross3 = getImage(getCodeBase(),"images/T_Cross3.gif");
    T_Cross3R = getImage(getCodeBase(),"images/T_Cross3R.gif");
    T_Cross3Up = getImage(getCodeBase(),"images/T_Cross3Up.gif");
    T_Cross3D = getImage(getCodeBase(),"images/T_Cross3D.gif");
    T_Cross4 = getImage(getCodeBase(),"images/T_Cross4.gif");
    T_Curve1 = getImage(getCodeBase(),"images/T_Curve1.gif");
    T_Curve2 = getImage(getCodeBase(),"images/T_Curve2.gif");
    T_Curve3 = getImage(getCodeBase(),"images/T_Curve3.gif");
    T_Curve4 = getImage(getCodeBase(),"images/T_Curve4.gif");
    T_Tree = getImage(getCodeBase(),"images/T_Tree.gif");
    T_RiverV = getImage(getCodeBase(),"images/T_RiverV.gif");
    T_RiverH = getImage(getCodeBase(),"images/T_RiverH.gif");
    T_HomeF = getImage(getCodeBase(),"images/T_HomeF.gif");
    T_Condo = getImage(getCodeBase(),"images/T_Condo.gif");
    T_TownHouse = getImage(getCodeBase(),"images/T_TownHouse.gif");
    T_HomeType2 = getImage(getCodeBase(),"images/T_HomeType2.gif");
    T_HomeType3 = getImage(getCodeBase(),"images/T_HomeType3.gif");

    //---------- Disable component for newproject ------------
    Update.disable();
    ImproveImage.disable();
    /*TE_Id2.disable();       L_Id2.setForeground(Color.gray);
    TE_Id.disable();        L_Id.setForeground(Color.gray);
    TE_Number.disable();   L_Address.setForeground(Color.gray);
    TE_BathRoom.disable();  L_Bathroom.setForeground(Color.gray);
    TE_BedRoom.disable();   L_Bedroom.setForeground(Color.gray);
    TE_Floor.disable();     L_Floor.setForeground(Color.gray);
    TE_Kitchen.disable();   L_Kitchen.setForeground(Color.gray);
    HAmphur.disable();     L_PlayR.setForeground(Color.gray);
    TE_Position.disable();  L_Position.setForeground(Color.gray);
    TE_Price.disable();     L_Price.setForeground(Color.gray);
    TE_Status.disable();    L_Status.setForeground(Color.gray);
    TE_TypeHome.disable();  L_TypeHome.setForeground(Color.gray);*/

    //---------- Get projectname from project table -----
    ProjectName = getProjectName();
    while(ProjectName.indexOf(';') != -1)
    {
      leng = ProjectName.length();
      semi = ProjectName.indexOf(';');
      Name = ProjectName.substring(0,semi);
      list1.addItem(Name);
      ProjectName = ProjectName.substring(semi+1,leng);
    }



  }
  public void update(Graphics g) {paint (g);}

  public void paint(Graphics g) {


      g.setColor(Color.cyan);
      g.fill3DRect(250,130,500,280,false);
      g.setColor(Color.white);
      g.fill3DRect(263,150,60,40,false);
      g.setColor(Color.black);
      g.drawLine(343,148,645,148);     //Side up
      g.drawLine(343,149,645,149);
      g.drawLine(344,390,645,390);     //Side below
      g.drawLine(344,391,645,391);
      g.drawLine(342,148,342,391);     //Side left
      g.drawLine(343,148,343,391);
      g.drawLine(644,150,644,390);     //Side right
      g.drawLine(645,150,645,390);


      g.drawImage(gif,77,129,30,30,this);
      g.drawImage(T_HomeF,77,159,30,30,this);
      g.drawImage(T_Condo,77,189,30,30,this);
      g.drawImage(T_TownHouse,77,219,30,30,this);
      g.drawImage(T_HomeType2,77,249,30,30,this);
      g.drawImage(T_HomeType3,77,279,30,30,this);
      g.drawImage(T_RiverV,77,309,30,30,this);
      g.drawImage(T_RiverH,77,339,30,30,this);
      g.drawImage(T_Tree,77,369,30,30,this);
      g.drawImage(gif3,77,399,30,30,this);

      g.drawImage(T_RoadV,107,129,30,30,this);
      g.drawImage(gif2,107,159,30,30,this);
      g.drawImage(T_Cross3,107,189,30,30,this);
      g.drawImage(T_Cross3R,107,219,30,30,this);
      g.drawImage(T_Cross3Up,107,249,30,30,this);
      g.drawImage(T_Cross3D,107,279,30,30,this);
      g.drawImage(T_Curve1,107,309,30,30,this);
      g.drawImage(T_Curve2,107,339,30,30,this);
      g.drawImage(T_Curve3,107,369,30,30,this);
      g.drawImage(T_Curve4,107,399,30,30,this);
      g.drawImage(PicStatus,278,155,30,30,this);

      if (ShowGridCheck)
      {
        g.setColor(Color.blue);
        g.drawLine(344,180,645,180);
        g.drawLine(344,210,645,210);
        g.drawLine(344,240,645,240);
        g.drawLine(344,270,645,270);
        g.drawLine(344,300,645,300);
        g.drawLine(344,330,645,330);
        g.drawLine(344,360,645,360);
        g.drawLine(374,150,374,390);
        g.drawLine(404,150,404,390);
        g.drawLine(434,150,434,390);
        g.drawLine(464,150,464,390);
        g.drawLine(494,150,494,390);
        g.drawLine(524,150,524,390);
        g.drawLine(554,150,554,390);
        g.drawLine(584,150,584,390);
        g.drawLine(614,150,614,390);
       }
        if (SelectHome)
      {
        g.setColor(Color.yellow);
        g.drawLine(selectX,selectY,selectX+30,selectY);           //Side up
        g.drawLine(selectX,selectY+1,selectX+30,selectY+1);
        g.drawLine(selectX,selectY+30,selectX+30,selectY+30);     //Side below
        g.drawLine(selectX,selectY+30+1,selectX+30,selectY+30+1);
        g.drawLine(selectX-1,selectY,selectX-1,selectY+30);       //Side left
        g.drawLine(selectX,selectY,selectX,selectY+30);
        g.drawLine(selectX+30,selectY,selectX+30,selectY+30);     //Side right
        g.drawLine(selectX+30+1,selectY,selectX+30+1,selectY+30);
       }
         for(Row=0;Row<8;Row++)
         {
          for(Col=0;Col<10;Col++)
           {
              PicTmp = PicHp[Row][Col];
              gif4 = getImage(getCodeBase(),"images/"+PicTmp+".gif");
              posX = initX+(Col*30);
              posY = initY+(Row*30);
              g.drawImage(gif4,posX,posY,30,30,this);

          }//for
         }//for
       // }//if
          if (ShowGridCheck)
      {
        g.setColor(Color.blue);
        g.drawLine(344,180,645,180);
        g.drawLine(344,210,645,210);
        g.drawLine(344,240,645,240);
        g.drawLine(344,270,645,270);
        g.drawLine(344,300,645,300);
        g.drawLine(344,330,645,330);
        g.drawLine(344,360,645,360);
        g.drawLine(374,150,374,390);
        g.drawLine(404,150,404,390);
        g.drawLine(434,150,434,390);
        g.drawLine(464,150,464,390);
        g.drawLine(494,150,494,390);
        g.drawLine(524,150,524,390);
        g.drawLine(554,150,554,390);
        g.drawLine(584,150,584,390);
        g.drawLine(614,150,614,390);
       }
        if (SelectHome)
      {
        g.setColor(Color.yellow);
        g.drawLine(selectX,selectY,selectX+30,selectY);           //Side up
        g.drawLine(selectX,selectY+1,selectX+30,selectY+1);
        g.drawLine(selectX,selectY+30,selectX+30,selectY+30);     //Side below
        g.drawLine(selectX,selectY+30+1,selectX+30,selectY+30+1);
        g.drawLine(selectX-1,selectY,selectX-1,selectY+30);       //Side left
        g.drawLine(selectX,selectY,selectX,selectY+30);
        g.drawLine(selectX+30,selectY,selectX+30,selectY+30);     //Side right
        g.drawLine(selectX+30+1,selectY,selectX+30+1,selectY+30);
       }
   }


  //Get Applet information
  public String getAppletInfo() {
    return "Applet Information";
  }


  //Get parameter info
  public String[][] getParameterInfo() {
    return null;
  }



  public void this_mousePressed(MouseEvent e) {
      x = e.getX(); y = e.getY();
      showStatus(x + "," + y);

      if ((x>=77) && (x<=107) && (y>=129) && (y<=159))
      {
        pic = "home";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=159) && (y<=189))
      {
        pic = "HomeF";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=189) && (y<=219))
      {
        pic = "Condo";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=219) && (y<=249))
      {
        pic = "TownHouse";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=249) && (y<=279))
      {
        pic = "HomeType2";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=279) && (y<=309))
      {
        pic = "HomeType3";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=309) && (y<=339))
      {
        pic = "RiverV";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=339) && (y<=369))
      {
        pic = "RiverH";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=369) && (y<=399))
      {
        pic = "Tree";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=77) && (x<=107) && (y>=399) && (y<=429))
      {
        pic = "floor";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }

      if ((x>=107) && (x<=137) && (y>=129) && (y<=159))
      {
        pic = "RoadV";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=159) && (y<=189))
      {
        pic = "road";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=189) && (y<=219))
      {
        pic = "Cross3";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=219) && (y<=249))
      {
        pic = "Cross3R";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=249) && (y<=279))
      {
        pic = "Cross3Up";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=279) && (y<=309))
      {
        pic = "Cross3D";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=309) && (y<=339))
      {
        pic = "Curve1";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=339) && (y<=369))
      {
        pic = "Curve2";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }

      if ((x>=107) && (x<=137) && (y>=369) && (y<=399))
      {
        pic = "Curve3";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }
      if ((x>=107) && (x<=137) && (y>=399) && (y<=429))
      {
        pic = "Curve4";
        PicStatus = getImage(getCodeBase(),"images/T_"+pic+".gif");
        repaint();
      }


   //-------- Check position and put image in array ---------
   if (EnableClick)
   {
      //------ Row 1 -------
      if ((x>=344) && (x<=374) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][0] = pic;
          repaint();
        }
         else { selectX=344; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 positionX=93; positionY=18;
				         SelectHome = true;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][1] = pic;
          repaint();
        }
         else { selectX=374; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=18;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }

      if ((x>=404) && (x<=434) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][2] = pic;
          repaint();
        }
         else { selectX=404; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
				         positionX=153; positionY=18;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }
      if ((x>=434) && (x<=464) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=18;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=18;
        				 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }
      if ((x>=494) && (x<=524) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=18;
        				 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=524) && (x<=554) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=18;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=18;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=18;
        				 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=150) && (y<=180))
      {
        if(ModeImage)
        {
          PicHp[0][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=150;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=18;
        				 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
   }
      //------ Row 2 -------

      if ((x>=344) && (x<=374) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=404) && (x<=434) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }
      if ((x>=434) && (x<=464) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][3] = pic;
          repaint();
        }
         else { selectX=434; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }


      }
      if ((x>=524) && (x<=554) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=48;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=48;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=180) && (y<=210))
      {
        if(ModeImage)
        {
          PicHp[1][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=180;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=48;
				         repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      //------ Row 3 -------

      if ((x>=344) && (x<=374) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }
      if ((x>=404) && (x<=434) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }
      if ((x>=434) && (x<=464) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }
      if ((x>=524) && (x<=554) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=210) && (y<=240))
      {
        if(ModeImage)
        {
          PicHp[2][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=210;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=78;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      //------ Row 4 -------

      if ((x>=344) && (x<=374) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=404) && (x<=434) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=434) && (x<=464) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=524) && (x<=554) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=240) && (y<=270))
      {
        if(ModeImage)
        {
          PicHp[3][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=240;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=108;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }

       //------ Row 5 -------

      if ((x>=344) && (x<=374) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=404) && (x<=434) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=434) && (x<=464) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=524) && (x<=554) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        { PicHp[4][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=270) && (y<=300))
      {
        if(ModeImage)
        {
          PicHp[4][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=270;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=138;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
       //------ Row 6 -------

      if ((x>=344) && (x<=374) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=404) && (x<=434) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=434) && (x<=464) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=524) && (x<=554) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=300) && (y<=330))
      {
        if(ModeImage)
        {
          PicHp[5][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=300;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=168;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }

      //------ Row 7 -------

      if ((x>=344) && (x<=374) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=404) && (x<=434) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=434) && (x<=464) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=524) && (x<=554) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=273; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=330) && (y<=360))
      {
        if(ModeImage)
        {
          PicHp[6][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=330;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=198;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      //------ Row 8 -------

      if ((x>=344) && (x<=374) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][0] = pic;
          repaint();
        }
        else { selectX=344; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=93; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=374) && (x<=404) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][1] = pic;
          repaint();
        }
        else { selectX=374; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=123; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=404) && (x<=434) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][2] = pic;
          repaint();
        }
        else { selectX=404; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=153; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=434) && (x<=464) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][3] = pic;
          repaint();
        }
        else { selectX=434; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=183; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=464) && (x<=494) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][4] = pic;
          repaint();
        }
        else { selectX=464; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=213; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=494) && (x<=524) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][5] = pic;
          repaint();
        }
        else { selectX=494; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=243; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=524) && (x<=554) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][6] = pic;
          repaint();
        }
        else { selectX=524; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 positionX=273; positionY=228;
                 SelectHome = true;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=554) && (x<=584) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][7] = pic;
          repaint();
        }
        else { selectX=554; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=303; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=584) && (x<=614) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][8] = pic;
          repaint();
        }
        else { selectX=584; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=333; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }

      }
      if ((x>=614) && (x<=644) && (y>=360) && (y<=390))
      {
        if(ModeImage)
        {
          PicHp[7][9] = pic;
          repaint();
        }
        else { selectX=614; selectY=360;
               if (checkHome(selectX,selectY))
               {
                 SelectHome = true;
                 positionX=363; positionY=228;
                 repaint();
                 SeperateHome(getHomeDetail());
                 ImageHome = false;
               }

             }
      }

  }
  public String SeperateHome(String Home) {
      leng = Home.length();
      semi = Home.indexOf(';');
      String Hid = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_Id.setText(Hid);

      leng = Home.length();
      semi = Home.indexOf(';');
      String Hnumber = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_Number.setText(Hnumber);

      leng = Home.length();
      semi = Home.indexOf(';');
      String Hamphur = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      HAmphur.setText(Hamphur);

      leng = Home.length();
      semi = Home.indexOf(';');
      String Hprovince = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      HProvince.setText(Hprovince);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HArea = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      Area.setText(HArea);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HFloor = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_Floor.setText(HFloor);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HBedroom = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_BedRoom.setText(HBedroom);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HKitchen = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_Kitchen.setText(HKitchen);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HBathroom = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_BathRoom.setText(HBathroom);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HPrice = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_Price.setText(HPrice);

      leng = Home.length();
      semi = Home.indexOf(';');
      String HType = Home.substring(0,semi);
      Home = Home.substring(semi+1,leng);
      TE_TypeHome.setText(HType);

      TE_Status.setText(Home);

      TE_Position.setText(positionX+","+positionY);
    return Home;
   }

  public boolean checkHome(int selectX,int selectY) {
    double z1 =(selectX-initX)/30.0D;
		C =Math.ceil(z1);
    double z2 =(selectY-initY)/30.0D;
		R =Math.ceil(z2);
    pic =PicHp[(int) R][(int) C];
   for(int i=0;i<7;i++)
   {
     if(pic.equals(Home[i]))
     {
       ImageHome =true;
       i=7;
      }
   }
    return ImageHome;
  }

  public void SGrid_actionPerformed(ActionEvent e) {
     if (e.getActionCommand()=="ShowGrid")
     {

         if (!ShowGridCheck)
         {  TE_Id.setText("1");
            ShowGridCheck = true ;
         } else
               { TE_Id.setText("2");
                 ShowGridCheck = false ;
               }//else
      }//if
      repaint();

  }

  public void Insert_actionPerformed(ActionEvent e) {
     if (e.getActionCommand()=="Insert")
     {

       G_nameP = PProjectName.getText();
       G_numberP = PNumber.getText();
       G_zipcodeP = PZipcode.getText();
       G_telephoneP = PTelephone.getText();
       G_companyP = Company.getText();
       G_amphurP = PAmphur.getSelectedItem();
       G_provinceP = PProvince.getSelectedItem();
       G_daySP = PdayS.getSelectedItem();
       G_mouthSP = PmouthS.getSelectedItem();
       G_yearSP = PyearS.getText();
       G_dayEP = PdayE.getSelectedItem();
       G_mouthEP = PmouthE.getSelectedItem();
       G_yearEP = PyearE.getText();
       G_nameP = G_nameP.trim();
       G_numberP = G_numberP.trim();
       G_zipcodeP = G_zipcodeP.trim();
       G_telephoneP = G_telephoneP.trim();
       G_companyP = G_companyP.trim();
       G_amphurP = G_amphurP.trim();
       G_provinceP = G_provinceP.trim();

       G_daySP = G_daySP.trim();
       G_mouthSP = G_mouthSP.trim();
       G_yearSP = G_yearSP.trim();
       G_dayEP = G_dayEP.trim();
       G_mouthEP = G_mouthEP.trim();
       G_yearEP = G_yearEP.trim();
       DateStart = (G_daySP+"/"+G_mouthSP+"/"+G_yearSP);
       DateEnd = (G_dayEP+"/"+G_mouthEP+"/"+G_yearEP);
       list1.addItem(inPictoDB());
     }
  }

  void Update_actionPerformed(ActionEvent e) {
        if (e.getActionCommand()=="Update")
     {
        ProjectID = TE_Id2.getText();
        upDateImageDba();
        TA1.setText("Update OK");
     }
  }

  void ClearMap_actionPerformed(ActionEvent e) {
   if (e.getActionCommand()=="ClearMap")
     {
        for(Row=0;Row<8;Row++)
         {
          for(Col=0;Col<10;Col++)
           {
              PicHp[Row][Col] = "";
              repaint();
          }//for
         }//for
     }
  }
  String ProjName="";
  String tmpIdImage="";
  String tmpImage2="";
  String tmpImage="";
  String id="";
  int slash;
   TextField PProjectName = new TextField();
  TextField PNumber = new TextField();
  Label L_Id4 = new Label();
  Label L_Id5 = new Label();
  Choice PAmphur = new Choice();
  Choice PProvince = new Choice();
  TextField PZipcode = new TextField();
  TextField Company = new TextField();
  TextField PTelephone = new TextField();
  Label L_Id6 = new Label();
  Label L_Id7 = new Label();
  Label L_Id8 = new Label();
  Label L_Id9 = new Label();
  Button PUpdate = new Button();
  Button PClear = new Button();
  Button PInsert = new Button();
  Choice PdayS = new Choice();
  Choice PmouthS = new Choice();
  Choice PdayE = new Choice();
  Choice PmouthE = new Choice();
  Label L_Id10 = new Label();
  Label L_Id11 = new Label();
  TextField PyearS = new TextField();
  TextField PyearE = new TextField();
  Label label1 = new Label();
  TextField Area = new TextField();
  Label label6 = new Label();
  Label label8 = new Label();
  Button HInsert = new Button();
  Button HClear = new Button();
  Button HUpdate = new Button();
  TextField HProvince = new TextField();
  Label label7 = new Label();
  Label label9 = new Label();
  Button ImproveImage = new Button();
  Button ImproveHome = new Button();

  public boolean action(Event e, Object a) {
		if (e.target instanceof List)
    {

        //---------- Disable component for newproject ------------
        Update.enable();
        TE_Id2.enable();       L_Id2.setForeground(Color.black);
        TE_Id.enable();        L_Id.setForeground(Color.black);
        TE_Number.enable();   L_Address.setForeground(Color.black);
        TE_BathRoom.enable();  L_Bathroom.setForeground(Color.black);
        TE_BedRoom.enable();   L_Bedroom.setForeground(Color.black);
        TE_Floor.enable();     L_Floor.setForeground(Color.black);
        TE_Kitchen.enable();   L_Kitchen.setForeground(Color.black);
        HAmphur.enable();     L_PlayR.setForeground(Color.black);
        TE_Position.enable();  L_Position.setForeground(Color.black);
        TE_Price.enable();     L_Price.setForeground(Color.black);
        TE_Status.enable();    L_Status.setForeground(Color.black);
        TE_TypeHome.enable();  L_TypeHome.setForeground(Color.black);
        Insert.disable();
        SelectHome = false;
      List x = (List) e.target;
      TA1.setText(" ");
      ProjName = x.getSelectedItem();
      PProjectName.setText(ProjName);

//------------- Get image from DB to Array -----------------
      tmpIdImage = getIdImage();
      leng = tmpIdImage.length();
      int charp = tmpIdImage.indexOf('#');
      DataProject = tmpIdImage.substring(0,charp);
      tmpImage = tmpIdImage.substring(charp+1,leng);
      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      String G_idP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      TE_Id2.setText(G_idP);
      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      G_numberP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      PNumber.setText(G_numberP);
      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      G_amphurP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      TA1.appendText(G_amphurP+"\n");

      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      G_provinceP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      TA1.appendText(G_provinceP+"\n");

      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      G_zipcodeP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      PZipcode.setText(G_zipcodeP);

      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      G_telephoneP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      PTelephone.setText(G_telephoneP);

      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      G_companyP = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      Company.setText(G_companyP);

      leng = DataProject.length();
      semi = DataProject.indexOf(';');
      DateStart = DataProject.substring(0,semi);
      DataProject = DataProject.substring(semi+1,leng);
      TA1.appendText(DateStart+"\n");
      DateEnd =DataProject;
      TA1.appendText(DateEnd+"\n");

      Row=0;
      Col=0;
      int i;
      for(Row=0;Row<8;Row++)
      {
        for(Col=0;Col<10;Col++)
        {
           leng = tmpImage.length();
           semi = tmpImage.indexOf(';');
           pic = tmpImage.substring(0,semi);
           PicHp[Row][Col] = pic;
           tmpImage = tmpImage.substring(semi+1,leng);
         }
       }
     repaint();
     pic="";          //Clear cursor mouse
			return true;
		}
		return false;
	}


  public String getProjectName()
	{
      String ProName="";
			try	{
            url = new URL("http://kling/test/GetProNameS");
        		file = url.openStream();

			}//try
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					ProName+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return ProName;
	}


//-------------------------------------------------------------------------------

public String inPictoDB()
	{
    String inp="";
    String ImageStr="";
    String Temp="";


 //    TA1.setText(G_nameP);
 		try	{
          for(Row=0;Row<8;Row++)
          {
           for(Col=0;Col<10;Col++)
           {
             Temp = PicHp[Row][Col]+";";
             ImageStr = ImageStr+Temp;
           }//for
          }//for
         // list1.addItem(ImageStr);
          //--- Define URL link to servlet file is insert image to DB -----
          url = new URL("http://kling/test/InsertImageS?RESERVIMAGE="+ImageStr+"&PROJECTNAME="+G_nameP+
          "&PNUMBER="+G_numberP+"&PZIPCODE="+G_zipcodeP+"&PTELEPHONE="+G_telephoneP+"&COMPANY="+G_companyP+
          "&PAMPHUR="+G_amphurP+"&PPROVINCE="+G_provinceP+"&DATESTART="+DateStart+"&DATEEND="+DateEnd);
           //  url = new URL("http://kling/test/Webboard?IMAGE="+ImageStr);
        		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");    */
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}

  public String getIdImage()
  {
    String Name="";
    InputStream file1 = null;
 	  byte[] bytestream;
    String ProImage="";

    try	{
          //TE_BathRoom.setText(ProjName);
          URL url = new URL("http://kling/test/GetImageS?NAME="+ProjName);
          file1 = url.openStream();
          //TE_Number.setText(ProjName);

			  }//try
			  catch (IOException ioe) {

        }
        catch (Exception e) {
          e.printStackTrace();
          return null;
        }

	 	try	{
				  bytestream = new byte[2000];
				  //code.setText("");
				  for (int i = 0; i < 2000; i++ )
				  {
					   bytestream[i] = 0;
				  }
          while (file1.read(bytestream) > 0) {

					   ProImage+=new String(bytestream);
				    }
			   }
			   catch (IOException ioe) { }
    //if(Test>1)
      // return getProjectName();
    return ProImage;
  }
//---------------------------- Update image ------------
  public String upDateImageDba()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
 		try	{
          for(Row=0;Row<8;Row++)
          {
           for(Col=0;Col<10;Col++)
           {
             Temp = PicHp[Row][Col]+";";
             ImageStr = ImageStr+Temp;
           }//for
          }//for
          //--- Define URL link to servlet file is insert image to DB -----
          url = new URL("http://kling/test/UpdateImageDbaS?IMAGE="+ImageStr+"&PROJECTID="+ProjectID);
          file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");    */
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}

  public String getHomeDetail()
  {
    String Name="";
    InputStream file1 = null;
 	  byte[] bytestream;
    String HomeDetail="";

    try	{
          ProjectId=TE_Id2.getText();
          URL url = new URL("http://kling/test/GetHomeDetailS?POSITIONX="+positionX+"&POSITIONY="+positionY+"&PROJECTID="+ProjectId);
          file1 = url.openStream();
          //TE_Number.setText(ProjName);

			  }//try
			  catch (IOException ioe) {

        }
        catch (Exception e) {
          e.printStackTrace();
          return null;
        }

	 	try	{
				  bytestream = new byte[2000];
				  //code.setText("");
				  for (int i = 0; i < 2000; i++ )
				  {
					   bytestream[i] = 0;
				  }
          while (file1.read(bytestream) > 0) {

					   HomeDetail+=new String(bytestream);
				    }
			   }
			   catch (IOException ioe) { }
    //if(Test>1)
      // return getProjectName();
    return HomeDetail;
  }


public String insertProject()
	{
    String inp="";
    String ImageStr="";
    String Temp="";


 		try	{
          //--- Define URL link to servlet file is insert image to DB -----
          url = new URL("http://kling/test/InsertProjectS?PROJECTNAME="+G_nameP+
          "&PNUMBER="+G_numberP+"&PZIPCODE="+G_zipcodeP+"&PTELEPHONE="+G_telephoneP+"&COMPANY="+G_companyP+
          "&PAMPHUR="+G_amphurP+"&PPROVINCE="+G_provinceP+"&DATESTART="+DateStart+"&DATEEND="+DateEnd);
        		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");    */
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				bytestream = new byte[2000];
				//code.setText("");
				for (int i = 0; i < 2000; i++ )
				{
					bytestream[i] = 0;
				}
				while (file.read(bytestream) > 0) {
					inp+=new String(bytestream);
				}
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}
      return inp;
	}

  void PUpdate_actionPerformed(ActionEvent e) {
       G_nameP = PProjectName.getText();
       G_numberP = PNumber.getText();
       G_zipcodeP = PZipcode.getText();
       G_telephoneP = PTelephone.getText();
       G_companyP = Company.getText();
       G_amphurP = PAmphur.getSelectedItem();
       G_provinceP = PProvince.getSelectedItem();
       G_daySP = PdayS.getSelectedItem();
       G_mouthSP = PmouthS.getSelectedItem();
       G_yearSP = PyearS.getText();
       G_dayEP = PdayE.getSelectedItem();
       G_mouthEP = PmouthE.getSelectedItem();
       G_yearEP = PyearE.getText();
       G_nameP = G_nameP.trim();
       G_numberP = G_numberP.trim();
       G_zipcodeP = G_zipcodeP.trim();
       G_telephoneP = G_telephoneP.trim();
       G_companyP = G_companyP.trim();
       G_amphurP = G_amphurP.trim();
       G_provinceP = G_provinceP.trim();

       G_daySP = G_daySP.trim();
       G_mouthSP = G_mouthSP.trim();
       G_yearSP = G_yearSP.trim();
       G_dayEP = G_dayEP.trim();
       G_mouthEP = G_mouthEP.trim();
       G_yearEP = G_yearEP.trim();
       DateStart = (G_daySP+"/"+G_mouthSP+"/"+G_yearSP);
       DateEnd = (G_dayEP+"/"+G_mouthEP+"/"+G_yearEP);
       TA1.setText(updateProject());
       list1.removeAll();
       ProjectName = getProjectName();
    while(ProjectName.indexOf(';') != -1)
    {
      leng = ProjectName.length();
      semi = ProjectName.indexOf(';');
      Name = ProjectName.substring(0,semi);
      list1.addItem(Name);
      ProjectName = ProjectName.substring(semi+1,leng);
    }

  }

  void SGrid1_actionPerformed(ActionEvent e) {

  }

  void PClear_actionPerformed(ActionEvent e) {
   if (e.getActionCommand()=="Clear")
     {
       PProjectName.setText("");
       TE_Id2.setText("");
       PNumber.setText("");
       Company.setText("");
       PTelephone.setText("");
       PZipcode.setText("");

     }
  }

  void PInsert_actionPerformed(ActionEvent e) {

       G_nameP = PProjectName.getText();
       G_numberP = PNumber.getText();
       G_zipcodeP = PZipcode.getText();
       G_telephoneP = PTelephone.getText();
       G_companyP = Company.getText();
       G_amphurP = PAmphur.getSelectedItem();
       G_provinceP = PProvince.getSelectedItem();
       G_daySP = PdayS.getSelectedItem();
       G_mouthSP = PmouthS.getSelectedItem();
       G_yearSP = PyearS.getText();
       G_dayEP = PdayE.getSelectedItem();
       G_mouthEP = PmouthE.getSelectedItem();
       G_yearEP = PyearE.getText();
       G_nameP = G_nameP.trim();
       G_numberP = G_numberP.trim();
       G_zipcodeP = G_zipcodeP.trim();
       G_telephoneP = G_telephoneP.trim();
       G_companyP = G_companyP.trim();
       G_amphurP = G_amphurP.trim();
       G_provinceP = G_provinceP.trim();

       G_daySP = G_daySP.trim();
       G_mouthSP = G_mouthSP.trim();
       G_yearSP = G_yearSP.trim();
       G_dayEP = G_dayEP.trim();
       G_mouthEP = G_mouthEP.trim();
       G_yearEP = G_yearEP.trim();
       DateStart = (G_daySP+"/"+G_mouthSP+"/"+G_yearSP);
       DateEnd = (G_dayEP+"/"+G_mouthEP+"/"+G_yearEP);
       TA1.setText(insertProject());
  }

  void button2_actionPerformed(ActionEvent e) {

  }

  void HInsert_actionPerformed(ActionEvent e) {
   if (e.getActionCommand()=="Add")
    {

            Hid = TE_Id.getText();
            Hid = Hid.trim();
         Hnumber=TE_Number.getText();
         Hnumber=Hnumber.trim();
         Hamphur=HAmphur.getText();
         Hamphur=Hamphur.trim();
       Hprovince=HProvince.getText();
       Hprovince=Hprovince.trim();
           HType=TE_TypeHome.getText();
           HType=HType.trim();
         HStatus=TE_Status.getText();
         HStatus=HStatus.trim();
          HFloor=TE_Floor.getText();
          HFloor=HFloor.trim();
        HBedroom=TE_BedRoom.getText();
        HBedroom=HBedroom.trim();
       HBathroom=TE_BathRoom.getText();
       HBathroom=HBathroom.trim();
        HKitchen=TE_Kitchen.getText();
        HKitchen=HKitchen.trim();
           HArea=Area.getText();
           HArea=HArea.trim();
          HPrice=TE_Price.getText();
          HPrice=HPrice.trim();
       HPositionX=Integer.toString(positionX);
       HPositionY=Integer.toString(positionY);
       TA1.setText(insertHome());
    }

  }

  void HClear_actionPerformed(ActionEvent e) {
    if (e.getActionCommand()=="Clear")
    {
       TE_Id.setText("");
       TE_Number.setText("");
       HAmphur.setText("");
       HProvince.setText("");
       TE_TypeHome.setText("");
       TE_Status.setText("");
       TE_Position.setText("");
       TE_Floor.setText("");
       TE_BedRoom.setText("");
       TE_BathRoom.setText("");
       TE_Kitchen.setText("");
       Area.setText("");
       TE_Price.setText("");
       TE_Position.setText("");

    }
  }

  void HUpdate_actionPerformed(ActionEvent e) {
    if (e.getActionCommand()=="Update")
     {
            Hid = TE_Id.getText();
         Hnumber=TE_Number.getText();
         Hamphur=HAmphur.getText();
       Hprovince=HProvince.getText();

           HType=TE_TypeHome.getText();
         HStatus=TE_Status.getText();
          HFloor=TE_Floor.getText();
        HBedroom=TE_BedRoom.getText();
       HBathroom=TE_BathRoom.getText();
        HKitchen=TE_Kitchen.getText();
           HArea=Area.getText();
          HPrice=TE_Price.getText();
       String HPosition=TE_Position.getText();
       leng = HPosition.length();
       int comma = HPosition.indexOf(',');
       HPositionX= HPosition.substring(0,comma);
       HPositionY= HPosition.substring(comma+1,leng);
       TA1.setText(updateHome());
     }

  }
  void ImproveImage_actionPerformed(ActionEvent e) {
     if (e.getActionCommand()=="แก้ไขรูปภาพ")
     {
       ModeImage = true;
       SelectHome = false;
       TA1.setText("แก้ไขรูปภาพ");
       SelectHome = false;
       ImproveImage.disable();
       ImproveHome.enable();
       repaint();
     }
  }

  void ImproveHome_actionPerformed(ActionEvent e) {
    if (e.getActionCommand()=="แก้ไขข้อมูลบ้าน")
     {
       ModeImage = false;
       SelectHome = true;
       TA1.setText("แก้ไขข้อมูลบ้าน");
       ImproveHome.disable();
       ImproveImage.enable();
     }
  }


//-------------------------------------------------------------------------------
public String updateHome()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
    String Projectid="";

 		try	{
          Projectid = TE_Id2.getText();
          Projectid = Projectid.trim();
          //--- Define URL link to servlet file is insert image to DB -----
          url = new URL("http://kling/test/UpdateHomeS?HOMEID="+Hid+"&HOMENUMBER="+Hnumber+
          "&HAMPHUR="+Hamphur+"&HPROVINCE="+Hprovince+"&AREA="+HArea+"&FLOOR="+HFloor+"&BEDROOM="+HBedroom+"&KITCHENROOM="+HKitchen+"&BATHROOM="+HBathroom+"&PRICE="+HPrice+
          "&XPOSITION="+HPositionX+"&YPOSITION="+HPositionY+"&STATUSRESERV="+HStatus+"&HOMETYPE="+HType+"&PROJECTID="+Projectid);
           //  url = new URL("http://kling/test/Webboard?IMAGE="+ImageStr);
        		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");    */
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				    bytestream = new byte[2000];
				    //code.setText("");
				    for (int i = 0; i < 2000; i++ )
				    {
					    bytestream[i] = 0;
				    }
				    while (file.read(bytestream) > 0) { inp+=new String(bytestream);}
			   }
			   catch (IOException ioe) {
         //code.setText("I/O ERROR");
         }
      return inp;
    }

//-------------------------------------------------------------------------------
public String insertHome()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
    String Projectid="";

 		try	{
          Projectid = TE_Id2.getText();
          Projectid = Projectid.trim();
          //--- Define URL link to servlet file is insert image to DB -----
          url = new URL("http://kling/test/InsertHomeS?HOMEID="+Hid+"&HOMENUMBER="+Hnumber+
          "&HAMPHUR="+Hamphur+"&HPROVINCE="+Hprovince+"&AREA="+HArea+"&FLOOR="+HFloor+"&BEDROOM="+HBedroom+"&KITCHENROOM="+HKitchen+"&BATHROOM="+HBathroom+"&PRICE="+HPrice+
          "&XPOSITION="+HPositionX+"&YPOSITION="+HPositionY+"&STATUSRESERV="+HStatus+"&HOMETYPE="+HType+"&PROJECTID="+Projectid);
           //  url = new URL("http://kling/test/Webboard?IMAGE="+ImageStr);
        		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");    */
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				    bytestream = new byte[2000];
				    //code.setText("");
				    for (int i = 0; i < 2000; i++ )
				    {
					    bytestream[i] = 0;
				    }
				    while (file.read(bytestream) > 0) { inp+=new String(bytestream);}
			   }
			   catch (IOException ioe) {
         //code.setText("I/O ERROR");
         }
      return inp;
    }

//-------------------------------------------------------------------------------
public String updateProject()
	{
    String inp="";
    String ImageStr="";
    String Temp="";
    String Projectid="";

 		try	{
          Projectid = TE_Id2.getText();
          Projectid = Projectid.trim();
          //--- Define URL link to servlet file is insert image to DB -----
          url = new URL("http://kling/test/UpdateProjectS?PROJECTID="+Projectid+"&PROJECTNAME="+G_nameP+
          "&PNUMBER="+G_numberP+"&PZIPCODE="+G_zipcodeP+"&PTELEPHONE="+G_telephoneP+"&COMPANY="+G_companyP+
          "&PAMPHUR="+G_amphurP+"&PPROVINCE="+G_provinceP+"&DATESTART="+DateStart+"&DATEEND="+DateEnd);

       		 file = url.openStream();
			 }
			catch (MalformedURLException mfURLe) {
				/*code.setText("File \"");
				code.append(check.getSelectedCheckbox().getLabel());
				code.append("\"not found");    */
			}
			catch (IOException ioe) {
				//code.setText("I/O ERROR");
			}

	 		try	{
				    bytestream = new byte[2000];
				    //code.setText("");
				    for (int i = 0; i < 2000; i++ )
				    {
					    bytestream[i] = 0;
				    }
				    while (file.read(bytestream) > 0) { inp+=new String(bytestream);}
			   }
			   catch (IOException ioe) {
         //code.setText("I/O ERROR");
         }
      return inp;
    }


 }
//<applet code= "DbaManagement.class" width=100% height=100%></applet>

