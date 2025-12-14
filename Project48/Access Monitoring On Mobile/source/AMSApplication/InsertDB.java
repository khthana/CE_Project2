/*
 * InsertDB.java
 *
 * Created on 21 มกราคม 2549, 1:52 น.
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

/**
 *
 * @author IBM
 */
import java.sql.*;
public class InsertDB {
    String querystring;
    Statement s;
    Connection c;
    AcessMonitor GUI;
    /** Creates a new instance of InsertDB */
    public InsertDB(AcessMonitor GUI,String filename,String path,String date,String timeStart,String timeStop) {
        this.GUI = GUI;
        String ip = GUI.setip.jComboBoxip.getSelectedItem().toString();
        String url = "http://"+ip+":80/video/"+date+"/"+filename+".3gp";
        //String url = "http://161.246.5.125:80/video/"+date+"/"+filename+".3gp";
        String modifypath = path.replace("\\", "\\\\");
        String realpath = modifypath+"\\"+filename+".avi";
        String realfilename = filename+".avi";
        querystring = "insert into videofile values(null,'"+realfilename+"','"+realpath+"'," +
                "'"+url+"','"+date+"','"+timeStart+"','"+timeStop+"')";
        Insert();
        System.out.println("Insert Statement "+querystring);
    }
    public InsertDB(String username,String Password,String Email,String Tel){
        
        querystring = "insert into mobileaccount values(null,'"+username+"','"+Password+"','"+Email+"'," +
                "'"+Tel+"')";
        Insert();
        //System.out.println("insert Statement : "+querystring);
    }
     public InsertDB(AcessMonitor GUI,String[] data,String Path){
        this.GUI = GUI;
        String ip = GUI.setip.jComboBoxip.getSelectedItem().toString(); 
        String imageurl = "http://"+ip+":80/image/";
        //String imageurl = "http://161.246.5.125:80/image/";
         imageurl = imageurl+data[0]+"/"+data[1]+".png";
        String imagename = data[1]+".png";
        String modifypath = Path.replace("\\", "\\\\");
        String realpath = modifypath+"\\snap shot\\\\"+imagename;
        querystring = "insert into imagefile values(null,'"+imagename+"','"+realpath+"','"+imageurl+"','"+data[0]+"'," +
                "'"+data[2]+"')";
        Insert();
        //System.out.println("insert Statement : "+querystring);
    }
    public void Insert(){
        //String username = "root";
        //String password = "komate";
        String username = variableCode.userDB;
        String password = variableCode.passDB;
        String url = "jdbc:mysql://localhost/ams";
        String driver = "com.mysql.jdbc.Driver";
        try{
        Class.forName(driver);
        c = DriverManager.getConnection(url,username,password);
        s = c.createStatement();
        s.executeUpdate(querystring);
        s.close();
        c.close();
        }
        catch(ClassNotFoundException cnfe){
        System.err.println("Failed to Connect Database");
        System.exit(1);
        }
        catch(SQLException se){
            System.err.println("Unable to connect");
            se.printStackTrace();
        }
    }
}
