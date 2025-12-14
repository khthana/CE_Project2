package Spider2;
import Sagent2.Specification;
import java.util.*;
import java.io.*;
import java.awt.event.*;
import java.sql.*;
import java.net.*;
import oracle.sql.*;
import java.lang.*;
import oracle.jdbc.driver.*;
import Sagent.MTThai;
import Sagent2.Profile;
import javax.mail.*;
import javax.activation.*;
import javax.mail.internet.*;
import java.util.Properties;
public class ControlServer implements ActionListener,WindowListener,Runnable,MouseListener{
  static Thread serverThread;
  static ControlServer server;
  static ControlServerInterface ServerI = new ControlServerInterface();
  static TimeControl timeControl;
  static Vector task = new Vector();
  static AppletServer appletServer;
  public Task newTask;
  public Task SpiderTask;
  public int CrawlerCount,FormattorCount;
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  Statement stmt2 = null;
  ResultSet rst = null;
  public ControlServer() {
    CrawlerCount = 1;
    FormattorCount = 1;
    serverThread = new Thread(this);
    ServerI.setSize(399,299);
    ServerI.setLocation(50,50);
    ServerI.apply.addActionListener(this);
    ServerI.addSearch.addActionListener(this);
    ServerI.addSpider.addActionListener(this);
    ServerI.removeTime.addActionListener(this);
    ServerI.TimeList.addMouseListener(this);
    ServerI.removeall.addActionListener(this);
    ServerI.addWindowListener(this);
    newTask = new Task("Run Spider");
    task.addElement(newTask);
    ServerI.TimeList.add(newTask.taskName);
    newTask = new Task("Search Offline");
    task.addElement(newTask);
    ServerI.TimeList.add(newTask.taskName);
    timeControl = new TimeControl(this);
    ServerI.crawler.setVisible(false);
    ServerI.CrawlerLabel.setVisible(false);
    ServerI.formattor.setVisible(false);
    ServerI.FormattorLabel.setVisible(false);
    ServerI.show();
    
    appletServer = new AppletServer(this);
    appletServer.start();
  }
  public static void main(String args[]){
    server = new ControlServer();
    server.start();
  }
  public void start(){
    serverThread.start();
    timeControl.start();
  }
  public void run(){
  }
  public void runSpider(Task task){
    SpiderTask = task;
    Spider spider = new Spider(this,CrawlerCount,FormattorCount,task);
    spider.start();
  }
  public void checkValidateUser(){
  }
  public void SearchOffline(Task task){
    try
    {
      ServerI.status.append("Connecting to Database.........");
      driver.registerDriver(new OracleDriver());
      conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
      conn.setAutoCommit(true);
      stmt = conn.createStatement();
      stmt2 = conn.createStatement();
      ServerI.status.append("Connected\n");
    }catch(Exception e){
      ServerI.status.append("Fail to connect to Database.\n");
    }
    try
    {
      String username,SearchTable;
      Profile profile;
      SearchTable = "";
      rst = stmt.executeQuery("select username from member_attribute");
      while(rst.next())
      {
        username = rst.getString(1);
        ServerI.status.append(username+":\n");
        profile = new Profile();
        profile.ReadXML(new URL("http://161.246.5.185:8080/profile/"+username+".xml"));
        ResultSet rstemp = stmt2.executeQuery("select SEARCH from PROJECT");
        for(int i=0;i<profile.count;i++)
        {
          ServerI.status.append("   property : "+i+"\n");
          if(rstemp.next())
          {
            SearchTable = rstemp.getString(1);
          }
          String sizeQS;
          String priceQS;
          String provinceQS;
          String areaQS;
          Vector QS = new Vector();
          String QueryString,QueryString1;
          sizeQS = "";
          priceQS = "";
          provinceQS = "";
          areaQS = "";
          QueryString = "";
          QueryString1 = "";
          switch(profile.property[i].size){
            case(0):sizeQS = "space>=0";break;
            case(1):sizeQS = "space<50";break;
            case(2):sizeQS = "space>=50 and space<100";break;
            case(3):sizeQS = "space>=100 and space<150";break;
            case(4):sizeQS = "space>=150 and space<200";break;
            case(5):sizeQS = "space>=200";break;
          }
          switch(profile.property[i].price){
            case(0):priceQS = "price>=0";break;
            case(1):priceQS = "price<8000"; break;
            case(2):priceQS = "price>=8000 and price<15000";break;
            case(3):priceQS = "price>=15000 and price<50000"; break;
            case(4):priceQS = "price>=50000 and price<100000"; break;
            case(5):priceQS = "price>=100000 and price<500000"; break;
            case(6):priceQS = "price>=500000 and price<1000000"; break;
            case(7):priceQS = "price>=1000000 and price<5000000"; break;
            case(8):priceQS = "price>=5000000 and price<10000000"; break;
            case(9):priceQS = "price>=10000000"; break;
          }
          provinceQS = "province='"+profile.property[i].province+"'";
          if(profile.property[i].area.compareTo("All")!=0)
          {
            areaQS = "area='"+profile.property[i].area+"'";
            QS.addElement(areaQS);
          }
          QS.addElement(sizeQS);
          QS.addElement(priceQS);
          QS.addElement(provinceQS);
          Enumeration e = QS.elements();
          if(e.hasMoreElements())
          {
            QueryString = "where";
            while(e.hasMoreElements())
            {
              QueryString = QueryString + " " + (String)e.nextElement()+" and";
            }
            QueryString = QueryString.substring(0,QueryString.length()-3);
          }
          int colorswitch=0;
            QS.addElement(new String("property='"+profile.property[i].type+"'"));
            QS.addElement(new String("need_to='"+profile.property[i].need_to+"'"));
            if(profile.property[i].bedroom!=0)QS.addElement(new String("bedroom='"+profile.property[i].bedroom+"'"));
            if(profile.property[i].bathroom!=0)QS.addElement(new String("bathroom='"+profile.property[i].bathroom+"'"));
            if(profile.property[i].kitchen.compareTo("Yes")==0)QS.addElement(new String("kitchen='"+profile.property[i].kitchen+"'"));
            if(profile.property[i].laundry.compareTo("Yes")==0)QS.addElement(new String("laundry='"+profile.property[i].laundry+"'"));
            if(profile.property[i].funished.compareTo("Yes")==0)QS.addElement(new String("furnished='"+profile.property[i].funished+"'"));
            if(profile.property[i].swimming_pool.compareTo("Yes")==0)QS.addElement(new String("swimming_pool='"+profile.property[i].swimming_pool+"'"));
            e = QS.elements();
            if(e.hasMoreElements())
            {
              QueryString1 = "where";
              while(e.hasMoreElements())
              {
                QueryString1 = QueryString1 + " " + (String)e.nextElement()+" and";
              }
              QueryString1 = QueryString1.substring(0,QueryString1.length()-3);
            }
            boolean found = false;
            ResultSet rst2 = stmt2.executeQuery("select property,need_to,name,street_address,province,area,space,price,floor,bedroom,bathroom,kitchen,laundry,furnished,air_condition,cable_tv,parking,security,swimming_pool,fitness,product_id,more_info_url from product_attribute "+QueryString1+" order by price");
            if(rst2.next())
            {
              found = true;
              ServerI.status.append("     found in product_attribute\n");
            }
            rst2 = stmt2.executeQuery("select province,area,space,price,more_info,address,bed,name from "+SearchTable+" "+QueryString+"order by price");
            if(rst2.next())
            {
              found = true;
              ServerI.status.append("     found in "+SearchTable+"\n");
            }
          if((profile.property[i].found.compareTo("No")==0))
          {
            if((found))
            {
              String password,name,lastname,email;
              name = "";
              password = "";
              lastname = "";
              email = "";
              profile.property[i].found = "Yes";
              rst2 = stmt2.executeQuery("select password,name,lastname,email from member_attribute where username='"+username+"'");
              if(rst2.next()){
                password = rst2.getString(1);
                name = rst2.getString(2);
                lastname = rst2.getString(3);
                email = rst2.getString(4);
              }
              Properties props = new Properties();
              props.put("mail.smtp.host","chaokhun.kmitl.ac.th");
              Session session = Session.getDefaultInstance(props, null);
              try {
                MimeMessage msg = new MimeMessage(session);
                String html = "<html><body>Please <form name=\"form1\" method=\"post\" action=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.MailToD\">  <input type=\"hidden\" name=\"username\" value=\""+username+"\">  <input type=\"hidden\" name=\"password\" value=\""+password+"\">  <input type=\"submit\" name=\"Submit\" value=\"Click\"></form>Here to See your Product... </body></html>";
                msg.setContent(html,"text/html");
                msg.setFrom(new InternetAddress("zatan007@RealAgent.com"));
                InternetAddress[] address = {new InternetAddress(email)};
                msg.setRecipients(Message.RecipientType.TO, address);
                msg.setSubject(name+" "+lastname+", You Have new Product Found !!");
                msg.setSentDate(new java.util.Date());
                ServerI.status.append("   Sending Mail....\n");
                Transport.send(msg);
                ServerI.status.append("   Sent.\n");
                } catch (MessagingException mex) {
                    mex.printStackTrace();
                    Exception ex = null;
                    if ((ex = mex.getNextException()) != null) {
                      ex.printStackTrace();
                    }
                }
            }else profile.property[i].found = "No";
          }
          profile.writeXml(username);
        }
      }
      ServerI.status.append("Done Offline Searching.\n");
      task.Running = false;
    }catch(Exception e){
      ServerI.status.append("Fail to Execute Query.\n");
    }
  }

  public void actionPerformed(ActionEvent ae){
    if(ae.getSource()==ServerI.apply)
    {
      Task taskTemp;
      try{
        taskTemp  = (Task)task.elementAt(ServerI.TimeList.getSelectedIndex());
        taskTemp.time[0] = Integer.parseInt(ServerI.hour.getText());
        taskTemp.time[1] = Integer.parseInt(ServerI.miniutes.getText());
        taskTemp.time[2] = Integer.parseInt(ServerI.sec.getText());
        if(taskTemp.taskName.compareTo("Run Spider")==0)
        {
          CrawlerCount = Integer.parseInt(ServerI.crawler.getText());
          FormattorCount = Integer.parseInt(ServerI.formattor.getText());
        }
      }catch(Exception e){
        ServerI.status.append("Invalid Number.\n");
      }
    }else
    if(ae.getSource()==ServerI.addSearch)
    {
      int every=0;
      int h,m;
      h=0;m=0;
      Integer hh,mm,ss;
      try{
        every = Integer.parseInt(ServerI.every.getText());
        if(every>0){
          while(h<24){
            hh = new Integer(h);
            mm = new Integer(m);
            ss = new Integer(0);
            newTask = new Task("Search Offline--> "+hh.toString()+":"+mm.toString()+":"+ss.toString());
            newTask.time[0] = h;
            newTask.time[1] = m;
            task.addElement(newTask);
            ServerI.TimeList.addItem(newTask.taskName);
            m = m + every;
            if(m>=60)
            {
              h++;
              m = m-60;
            }
          }
        }else
        {
          newTask = new Task("Search Offline");
          task.addElement(newTask);
          ServerI.TimeList.addItem(newTask.taskName);
        }
      }catch(Exception e){
        ServerI.status.append("Invalid time\n");
      }
    }else
    if(ae.getSource()==ServerI.addSpider)
    {
      newTask = new Task("Run Spider");
      task.addElement(newTask);
      ServerI.TimeList.addItem(newTask.taskName);
    }else
    if(ae.getSource()==ServerI.removeTime)
    {
      int selected_idx = ServerI.TimeList.getSelectedIndex();
      task.removeElementAt(selected_idx);
      ServerI.TimeList.remove(selected_idx);
      ServerI.CrawlerLabel.setVisible(false);
      ServerI.crawler.setVisible(false);
      ServerI.FormattorLabel.setVisible(false);
      ServerI.formattor.setVisible(false);
    }else
    if(ae.getSource()==ServerI.removeall)
    {
      task.removeAllElements();
      ServerI.TimeList.removeAll();
      ServerI.crawler.setVisible(false);
      ServerI.formattor.setVisible(false);
      ServerI.hour.setText("0");
      ServerI.miniutes.setText("0");
      ServerI.sec.setText("0");
    }
  }
  public void windowActivated(WindowEvent we){
  }
  public void windowDeiconified(WindowEvent we){
  }
  public void windowIconified(WindowEvent we){
  }
  public void windowClosed(WindowEvent we){
  }
  public void windowClosing(WindowEvent we){
    if(we.getSource()==ServerI){
      System.exit(0);
    }
  }
  public void windowOpened(WindowEvent we){
  }
  public void windowDeactivated(WindowEvent we){
  }
  public void mouseExited(MouseEvent me){
  }
  public void mouseEntered(MouseEvent me){
  }
  public void mouseReleased(MouseEvent me){
  }
  public void mousePressed(MouseEvent me){
  }
  public void mouseClicked(MouseEvent me){
    if(me.getSource()==ServerI.TimeList)
    {
      String tmpStr;
      Task taskTemp = (Task)task.elementAt(ServerI.TimeList.getSelectedIndex());
      Integer temp = new Integer(taskTemp.time[0]);
      if(temp.intValue()<10) tmpStr = "0"+temp.toString();else tmpStr = temp.toString();
      ServerI.hour.setText(tmpStr);
      temp = new Integer(taskTemp.time[1]);
      if(temp.intValue()<10) tmpStr = "0"+temp.toString();else tmpStr = temp.toString();
      ServerI.miniutes.setText(tmpStr);
      temp = new Integer(taskTemp.time[2]);
      if(temp.intValue()<10) tmpStr = "0"+temp.toString();else tmpStr = temp.toString();
      ServerI.sec.setText(tmpStr);
      if(taskTemp.taskName.compareTo("Run Spider")==0)
      {
        Integer tempInt;
        ServerI.CrawlerLabel.setVisible(true);
        ServerI.crawler.setVisible(true);
        ServerI.FormattorLabel.setVisible(true);
        ServerI.formattor.setVisible(true);
        tempInt = new Integer(CrawlerCount);
        ServerI.crawler.setText(tempInt.toString());
        tempInt = new Integer(FormattorCount);
        ServerI.formattor.setText(tempInt.toString());
      }else
      {
        ServerI.CrawlerLabel.setVisible(false);
        ServerI.crawler.setVisible(false);
        ServerI.FormattorLabel.setVisible(false);
        ServerI.formattor.setVisible(false);
      }
    }
  }
}