//FROM BOOK PAGE147
import java.io.*;
import java.net.*;
import java.util.*;
import java.sql.*;
import com.ibm.aglet.*;
import com.ibm.aglet.event.*;

public class UpdateStockBaby extends Aglet{

  AgletProxy parentProxy;
  byte[] id,quantity;
  Vector dest, login;
  AgletProxy originParent;
  String input,output="";
  int counter=-1;
  private boolean hasMoreElements(Vector vector){
    return !vector.isEmpty();
  }
  private Object nextElement(Vector vector){
    if (!hasMoreElements(vector)) return null;
    Object temp=vector.firstElement();
    vector.removeElementAt(0);
    return temp;
  }
  public void onCreation(Object init){
    parentProxy=(AgletProxy)((Object[])init)[0];
    id=(byte[])((Object[])init)[1];
    quantity=(byte[])((Object[])init)[2];
    dest=(Vector)((Object[])init)[3];
    login=(Vector)((Object[])init)[4];
    try{
      out("*-*CREATION TRY1:"+counter);
      dispatch(new URL(toString((byte[])nextElement(dest))));
      out("*-*CREATION TRY2:"+counter);
    }catch(Exception e){out(""+e);}
  }
  public void run(){
    try{
      counter++;
      out("*-*PROJECTION:"+counter);
      if(counter>0){
        String dbHost=toString((byte[])nextElement(login));
        String username=toString((byte[])nextElement(login));
        String password=toString((byte[])nextElement(login));
        boolean canBuy=buyIt(Integer.parseInt(toString(id)), Integer.parseInt(toString(quantity)), dbHost, username, password);
        if(canBuy){
          parentProxy.sendMessage(new Message("Result from baby",new Boolean(true)));
          dispose();
        }
      }
      while (hasMoreElements(dest)){
        try {
          String temp=toString((byte[])nextElement(dest));
          out("\n**GOTO "+temp+" AS NUMBER "+counter+"\n");
          this.dispatch(new URL(temp));
        }catch (Exception e) {out("Cannot dispatch:" + e);}
      }
      parentProxy.sendOnewayMessage(new Message("Result from baby",new Boolean(false)));
      dispose();
    }catch (Exception e) {out("OUTTER " + e);}
  }
  private boolean buyIt(int id, int quantity, String host, String username, String password){
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection c = DriverManager.getConnection(host, username, password);
      Statement s = c.createStatement();
      ResultSet r = s.executeQuery("select * from DVD");
      int oldQuantity=-1,newQuantity;
      while(r.next()){
        if(r.getInt("ID")==id){
          oldQuantity=r.getInt("quantity");
        }
      }
      out(""+id);
      out("OLD QTY:"+oldQuantity);
      if (oldQuantity<=0) return false;
      newQuantity=oldQuantity-quantity;
      out("NEW QTY:"+newQuantity);
      if (newQuantity<0) return false;
      s.executeUpdate("update DVD set QUANTITY = \"" + newQuantity +"\" where id = \"" + id +"\"");
      s.close();
      c.close();
      return true;
    }catch(Exception e){out(""+e);}
    return false;
  }
  //UTILITIES
  public static String toString(byte[] x){//Change byte array to String
      String output="";
      for(int i=0;i<x.length;i++)
        output+=(char)x[i];
      return output;
/*    try{
      return decrypt(x, "thi*sIs=Pas!swo+rd");
    }catch(Exception e){return null;}*/
  }
  public static byte[] toBytes(String x){//Change String to byte array
      return x.getBytes();
/*    try{
      return encrypt(x,"thi*sIs=Pas!swo+rd");
    }catch(Exception e){return null;}*/
  }
  public static void out(String x){System.out.println(x);}
  public static String clockSay(){
    return ((new java.text.SimpleDateFormat("yyyy-MMMM-dd HH:mm:ss.SSS aaa",new Locale("en","US"))).format(new java.util.Date()));
  }
}