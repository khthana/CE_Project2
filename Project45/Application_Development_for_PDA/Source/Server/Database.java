/*
 * Database.java
 *
 * Created on 9 กุมภาพันธ์ 2546, 15:23 น.
 */

package PalmData;

/**
 *
 * @author  Man
 */
import java.sql.*;
import java.util.*;


public class Database { 
    private Connection con;
    private Statement stmt1;
    private ResultSet rs;
    private ResultSetMetaData rsm;
    private String SQL;
    /** Creates new Database */
    public Database() {        
    }
    private void setConnection(){
        try {
            Class.forName ("sun.jdbc.odbc.JdbcOdbcDriver");  
            String URL = "jdbc:odbc:myData";				
            con = DriverManager.getConnection(URL,"","");
            stmt1 = con.createStatement();
        } catch (ClassNotFoundException e) {
            System.err.print (e.getMessage ());			
        } catch (SQLException e) {				
            System.err.print (e.getMessage ());			
        }
    }
    private void releaseConnection(){
        try{
            if (con!=null)
                con.close();
        }catch(SQLException se){
            System.err.print(se.getMessage());
        }
    }
    public String getData(String table,String area,String kind,String con4,
        String con5,String con6,String con7,String con8,String con9,String con10,String con11,String con12,String con13,String con14,String con15,String con16,String con17,String con18){
        String text = "",sql="",cause="",f="";   
        int i=1,j=1;
        try {	
                setConnection();  
                
                if (!table.equals("*")) {
                    cause = "main.Menu Like '"+table+"' ";
                    
                    
                    if (!area.equals("0"))
                        cause += " AND main.Area Like '"+area+"'";
                    
                    if (!kind.equals("0"))
                        cause += " AND main.Kind Like '"+kind+"'";
                 
                    if (!con4.equals("0"))
                        cause += " AND main.condition Like '"+con4+"'";
                    
                //    if (!con5.equals("0"))
                        cause += " AND main.Karaoke Like '"+con5+"'";
                    
                    if (!con6.equals("0"))
                       {cause += " AND Credit_D.credit Like '"+con6+"'";
                        f+=",Credit_D ";
                        cause += " AND main.ID = Credit_D.res_id ";};
                    
                    if (!con7.equals("0"))
                       {cause += " AND Credit_A.credit Like '"+con7+"'";
                        f+=",Credit_A ";
                        cause += " AND main.ID = Credit_A.res_id ";};
                           
                  //  if (!con8.equals("0"))
                        cause += " AND main.Resturant_Capacity Like '"+con8+"'";                                  
                           
                    if (!con9.equals("0"))
                        cause += " AND main.Private_Room Like '"+con9+"'";                             
                           
                    if (!con10.equals("0"))
                        cause += " AND main.Private_Room_Capacity Like '"+con10+"'";                         

                  //  if (!con11.equals("0"))
                        cause += " AND main.Price Like '"+con11+"'";
            
                    if (!con12.equals("0"))
                        cause += " AND "+ con12 + " > main.open AND "+ con12 +" < main.close ";

                    if (!con13.equals("0"))
                        cause += " AND main.Nation_Music Like '"+con13+"'";                       

                    if (!con14.equals("0"))
                        cause += " AND main.Kind_Music Like '"+con14+"'";                             

                 //   if (!con15.equals("0"))
                        cause += " AND main.Live_Music Like '"+con15+"'";                             
                        
                    if (!con16.equals("0"))
                        cause += " AND main.Cocktail Like '"+con16+"'";                             
                        
                    if (!con17.equals("0"))
                        cause += " AND main.Buffet Like '"+con17+"'";                             
                        
                    if (!con18.equals("0"))
                        cause += " AND main.Internet Like '"+con18+"'";                             
           
  }
                else
                {               
               
                    cause = " ( " + 
                    " main.Name            Like '%"+kind+"%'"  + " or " +
                    " main.Address         Like '%"+kind+"%'"  + " or " + 
                    " Area.Name            Like '%"+kind+"%'"  + " or " +
                    " main.Tel             Like '%"+kind+"%'"  + " or " +
                    " Type.Name            Like '%"+kind+"%'"  + " or " +
           //         " main.Promotion       Like '%"+kind+"%'"  + " or " +                    
           //         " main.Recommend       Like '%"+kind+"%'"  + " or " +
                    " main.Promotion_Card  Like '%"+kind+"%'"  + " or " +
                    " main.Card_Accepted   Like '%"+kind+"%'"  + " or " +
                    " Pro_flag.Promotion   Like '%"+kind+"%'"  + " or " +
           //         " Karaoke.detail       Like '%"+kind+"%'"  + " or " +
                    " Condition.Detail      Like '%"+kind+"%'" + " or " +
           //         " Res_Cap.Capacity      Like '%"+kind+"%'" + " or " +
           //         " Private_Number.detail Like '%"+kind+"%'" + " or " +
           //         " Private_Cap.Capacity  Like '%"+kind+"%'" + " or " +
           //         " Price.Price           Like '%"+kind+"%'" + " or " +
           //         " Nation_Music.Detail   Like '%"+kind+"%'" + " or " +
                    " Kind_Music.Detail     Like '%"+kind+"%'" + 
           //         " Live_Music.detail     Like '%"+kind+"%'" + " or " +                   
           //         " Cocktail.detail       Like '%"+kind+"%'" + " or " +
           //         " Internet.detail       Like '%"+kind+"%'" + " or " +                    
           //         " Buffet.detail         Like '%"+kind+"%'" +
                    
                     " ) "
                    ;
                };    
             //   sql = "SELECT main.Name, main.Address, "+
             //   "main.Tel,Area.Name AS Area, Type.Name AS Type,main.Recommend,main.Promotion,Condition.Detail "+
             //   "FROM (Area INNER JOIN Food_Travel main ON Area.AreaID = main.Area) "+
             //   "INNER JOIN Type ON main.Kind = Type.ID "+
            //    "INNER JOIN Condition ON main.Condition = Condition.id "+
                
            //  "INNER JOIN Karaoke ON main.Karaoke = Karaoke.id "+
             //   "WHERE "+cause;
                
               sql = //"SELECT main.Name, main.Address, "+
          //      "main.Tel,Area.Name AS Area, Type.Name AS Type,main.Recommend,main.Promotion "+
              //  "FROM (Area INNER JOIN Food_Travel main ON Area.AreaID = main.Area)"+
               // "INNER JOIN Type ON main.Kind = Type.ID "+
                   
                  "SELECT  main.Name, main.Address as Add , main.Tel,Area.Name AS Area, Type.Name AS Type, "+
                 //" main.Promotion,Condition.Detail  as Condition "+
                  "Condition.Detail as Condition, " +
                  "main.Promotion_Card As Discount,main.Time, "+
              //    "Private_Number.detail as [Private Room],Private_Cap.Capacity as [Privete Room], "+
                  "Kind_Music.detail as [Music] "+

/*                  "main.Promotion,Condition.Detail as Condition,Karaoke.detail as Karaoke, Res_Cap.Capacity as Size," +
                  "main.Promotion_Card As [Discount For],main.Card_Accepted As [Card Accepted],main.Time, "+
                  "Private_Number.detail as [Private Room],Private_Cap.Capacity as [Privete Room],Price.Price,Nation_Music.detail as [Music Language], "+
                  "Kind_Music.detail as [Music Kind],Live_Music.detail as [Live Music],Cocktail.detail as Cocktail,Buffet.detail as Buffet,Internet.detail as Internet "+
*/ 
                  "FROM ((Area INNER JOIN Food_Travel  main ON Area.AreaID = main.Area) INNER JOIN Type ON main.Kind = Type.ID)"+
                  ",Condition,Karaoke,Res_Cap " + ",Private_Number,Private_Cap,Price,Nation_Music,Kind_Music,Live_Music,Cocktail,Internet,Buffet,Pro_flag "+
                  f+
                  " where main.Condition = Condition.id and main.Karaoke = Karaoke.id and main.Resturant_Capacity = Res_Cap.id and " +
                  " main.Private_Room = Private_Number.id AND main.Private_Room_Capacity = Private_Cap.id AND main.Price = Price.id and main.Nation_Music = Nation_Music.id and " +
                  " main.Kind_Music = Kind_Music.id And main.Live_Music =Live_Music.id AND main.Cocktail = Cocktail.id AND Main.Internet = Internet.id And main.Buffet = Buffet.id AND main.Pro_flag=Pro_flag.id And "+
                  cause;
 
                //FROM ((Area INNER JOIN Food_Travel  main ON Area.AreaID = main.Area) INNER JOIN Type ON main.Kind = Type.ID), Condition 
//where  main.Condition = Condition.ID;
                  
 //               "WHERE "+cause;

                System.out.print("\nSQL "+sql+"\n");                
		rs = stmt1.executeQuery(sql);		
                rsm = rs.getMetaData();
                
/*                while (rs.next()){                    
                    text += j+".";
                    text += rs.getString(1)+"\n";
                    j++;
                    for (i=2;i<=rsm.getColumnCount();i++)
                        text += rsm.getColumnName(i)+" : "+rs.getString(i)+"\n";  
                    if (!table.equals("3")) text+="\n";
		}
*/
                while (rs.next()){                    
                 if(j<9)   text += j+".";
                 if(j<9)   text += rs.getString(1)+"\n";
                 if((j>4)&(j<9))   text += rsm.getColumnName(3)+" : "+rs.getString(3)+"\n";
                    j++;
                    for (i=2;i<=rsm.getColumnCount();i++)
                       if (j<6) text += rsm.getColumnName(i)+" : "+rs.getString(i)+"\n";
                     //  if ((j<10)&(j>5)) text += rsm.getColumnName(3)+" : "+rs.getString(3)+"\n";
                   // };
                    //    if (j>5) text += rsm.getColumnName(3)+" : "+rs.getString(3);//+"\n";
                   // };
                    if ((!table.equals("3"))&&(j<10)) text+="\n";
                    
		}
        if (j>1) text+="Found = "+(j-1);
        if (j>5) {
            text+="\n"+"There're many resturants,Please Choose again! \n";
        };
             //   text+="";
		rs.close();
                System.out.println(text);
                releaseConnection();
        } catch (SQLException e) {				
            System.err.print (e.getMessage ());			
        }
        return text;
    }
    
    public String getDataList(String table){
        String options = "",ch = "";
        int j=1;
        try{
            setConnection();
            SQL = "SELECT Label FROM Label WHERE Table='"+table+"'";
            rs = stmt1.executeQuery(SQL);
            if (rs.next())
                options = rs.getString(1)+"$";
            SQL = "SELECT Name FROM "+table;
            rs = stmt1.executeQuery(SQL);
            rsm = rs.getMetaData();            
            
            while (rs.next()){                
                ch += rs.getString(1)+"\n";                
            }
            options += j+"#"+ch;
            rs.close();
            releaseConnection();
        }catch(SQLException e) {
            System.err.print("Database "+e.getMessage());
        }
        System.out.println(options);
        return options;
    }
    /*public static void main(String[] arg ){
        Database d = new Database();
        System.out.println(d.getDataList("Area"));
    }*/
}