import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.io.*;
import java.net.*;
public class HomeDetailApplet extends Applet
{
  boolean isStandalone = false;
  Choice Project = new Choice();
  TextField ImageHome = new TextField();
  TextField ImageMap = new TextField();
  TextArea detail = new TextArea();
  Button button1 = new Button();
  Button button2 = new Button();
  Label label1 = new Label();
  Label label2 = new Label();
  Label label3 = new Label();
  Label label4 = new Label();
  String ProjectName="";

  String PROJECTNAME ="";
  String IMAGEHOME = "";
  String IMAGEMAP = "";
  String DETAIL =  "";
  String CONDITION = "";
  String title = "------------------ เลือกโครงการ -----------------";


  InputStream file = null;
 	URL url;
 	byte[] bytestream;
  TextArea condition = new TextArea();
  Label label5 = new Label();
  Label label6 = new Label();
  Label label7 = new Label();
  //Construct the applet
  public HomeDetailApplet()
  {
  }

  //Initialize the applet
  public void init()
  {
    try
    {
      jbInit();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  }

  //Component initialization
  private void jbInit() throws Exception
  {
    this.setBackground(new java.awt.Color(45, 120, 190));
    this.setSize(new Dimension(480, 378));
    this.setLayout(null);
    Project.setBounds(new Rectangle(23, 33, 236, 27));
    Project.addItemListener(new java.awt.event.ItemListener() {

      public void itemStateChanged(ItemEvent e) {
        Project_itemStateChanged(e);
      }
    });
    Project.addMouseListener(new java.awt.event.MouseAdapter() {

      public void mouseClicked(MouseEvent e) {
        Project_mouseClicked(e);
      }
    });
    ImageHome.setBackground(Color.white);
    ImageHome.setBounds(new Rectangle(126, 76, 100, 26));
    ImageHome.setFont(new java.awt.Font("Dialog", 0, 16));
    ImageHome.setText(" ");
    ImageMap.setBackground(Color.white);
    ImageMap.setBounds(new Rectangle(196, 119, 101, 26));
    ImageMap.setFont(new java.awt.Font("Dialog", 0, 16));
    ImageMap.setText(" ");
    detail.setBackground(Color.white);
    detail.setBounds(new Rectangle(18, 187, 361, 80));
    detail.setText(" ");
    button1.setBounds(new Rectangle(106, 340, 66, 24));
    button1.setLabel("Add");
    button1.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        button1_actionPerformed(e);
      }
    });
    button2.setBounds(new Rectangle(218, 339, 67, 25));
    button2.setLabel("Clear");
    button2.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        button2_actionPerformed(e);
      }
    });
    label1.setBounds(new Rectangle(26, 9, 137, 23));
    label1.setFont(new java.awt.Font("Serif", 0, 20));
    label1.setText("ชื่อโครงการ");
    label2.setBounds(new Rectangle(19, 77, 98, 23));
    label2.setFont(new java.awt.Font("Serif", 0, 20));
    label2.setText(" ชื่อไฟล์รูปภาพ");
    label3.setText("ชื่อไฟล์รูปภาพแผนที่โครงการ");
    label3.setFont(new java.awt.Font("Serif", 0, 20));
    label3.setBounds(new Rectangle(20, 121, 161, 23));
    label4.setText("รายละเอียดบ้าน");
    label4.setFont(new java.awt.Font("Serif", 0, 20));
    label4.setBounds(new Rectangle(20, 163, 124, 23));
    condition.setBackground(Color.white);
    condition.setBounds(new Rectangle(21, 293, 362, 36));
    condition.setText(" ");
    label5.setBounds(new Rectangle(21, 270, 278, 23));
    label5.setFont(new java.awt.Font("Serif", 0, 20));
    label5.setText("เงื่อนไขโครงการ");
    label6.setBounds(new Rectangle(233, 77, 194, 23));
    label6.setFont(new java.awt.Font("Serif", 0, 20));
    label6.setText(".gif  เท่านั้น");
    label7.setBounds(new Rectangle(306, 121, 155, 23));
    label7.setFont(new java.awt.Font("Serif", 0, 20));
    label7.setText(".jpg  เท่านั้น");
    this.add(Project, null);
    this.add(detail, null);
    this.add(button1, null);
    this.add(button2, null);
    this.add(label1, null);
    this.add(label2, null);
    this.add(label3, null);
    this.add(label4, null);
    this.add(ImageMap, null);
    this.add(ImageHome, null);
    this.add(condition, null);
    this.add(label5, null);
    this.add(label7, null);
    this.add(label6, null);
    Project.addItem(title);
    ProjectName = getProjectName();
    while(ProjectName.indexOf(';') != -1)
    {
      int leng = ProjectName.length();
      int semi = ProjectName.indexOf(';');
      String Name = ProjectName.substring(0,semi);
      Project.addItem(Name);
      ProjectName = ProjectName.substring(semi+1,leng);
    }


  }

  void button2_actionPerformed(ActionEvent e) {
     ImageHome.setText("");
     ImageMap.setText("");
     detail.setText("");
     condition.setText("");
  }

  void button1_actionPerformed(ActionEvent e) {
     PROJECTNAME = Project.getSelectedItem();
     IMAGEHOME = ImageHome.getText();
     IMAGEMAP = ImageMap.getText();
     DETAIL =  detail.getText();
     CONDITION = condition.getText();
     detail.setText(sendDetail());
     condition.setText("");

  }

  public String sendDetail()
	{
      String ProName="";
   //   T_BathRoom.setText(Test);
			try	{
            url = new URL("http://kling/test/SendDetailS?PROJECTNAME="+PROJECTNAME+"&IMAGEHOME="+IMAGEHOME+"&IMAGEMAP="+IMAGEMAP+"&DETAIL="+DETAIL+"&CONDITION="+CONDITION);
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


  public String getProjectName()
	{
      String ProName="";
   //   T_BathRoom.setText(Test);
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
  public String oldDetail()
	{
      String ProName="";
			try	{
            url = new URL("http://kling/test/OldDetail?PROJECTNAME="+PROJECTNAME);
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

  void Project_mouseClicked(MouseEvent e) {

  }

  void Project_itemStateChanged(ItemEvent e) {
  if(Project.getSelectedItem().equals(title)) detail.setText("");
  else  PROJECTNAME = Project.getSelectedItem();
  String TmpDetail = oldDetail();
  //detail.setText(TmpDetail);
  int leng = TmpDetail.length();
  int slash = TmpDetail.indexOf('/');
  String homeimage = TmpDetail.substring(0,slash);
  ImageHome.setText(homeimage);
  TmpDetail = TmpDetail.substring(slash+1,leng);

  leng = TmpDetail.length();
  slash = TmpDetail.indexOf('/');
  String indeximage = TmpDetail.substring(0,slash);
  TmpDetail = TmpDetail.substring(slash+1,leng);
  ImageMap.setText(indeximage);

  leng = TmpDetail.length();
  slash = TmpDetail.indexOf('/');
  String conditionD = TmpDetail.substring(0,slash);
  TmpDetail = TmpDetail.substring(slash+1,leng);
  condition.setText(conditionD);
  detail.setText("");
  leng = TmpDetail.length();

 while (leng > 0){
     String TmpDetail1 = TmpDetail.substring(0,50);
     TmpDetail = TmpDetail.substring(51,leng);
     detail.appendText(TmpDetail1+"\n");
     leng = TmpDetail.length();
    }  
  }

}
