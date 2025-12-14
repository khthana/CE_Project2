import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;
import java.sql.*;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
public class FetchDBBaby extends Aglet {
  long start;
  byte[] dbHost, dbUsername, dbPassword, output, dest;
  static byte[] bit=new byte[8];
  AgletProxy daddyProxy=null;
  short counter=-1;
  public void dispatchAtFirstTimeToDest(){
    counter++;
    if(counter>0)return;
    try{
      dispatch(new URL(toString(dest)));
    }catch(Exception e){
    }finally{
      try{
        //out("************Baby "+dest+" suicide!!!");
        daddyProxy.sendMessage(new Message("Result from baby","I can't dispatch!!"));
      }catch(Exception ee){}
      //dispose(); //No matter what..I must die
    }
  }
  public void onCreation(Object init){
    start=System.currentTimeMillis();
    try{
      dbHost=(byte[])((Object[])init)[0];
      dbUsername=(byte[])((Object[])init)[1];
      dbPassword=(byte[])((Object[])init)[2];
      daddyProxy=(AgletProxy)((Object[])init)[3];
      dest =(byte[])((Object[])init)[4];
      out("ONCREATION Host:"+dbHost+" User:"+dbUsername+" Password:"+dbPassword+" DEST:"+toString(dest));
    }catch(Exception e){out(""+e);}
    //dispose();
  }
  public void run() {
    try{
      dispatchAtFirstTimeToDest();
      //** DO SOMETHING TO GET RESULT
      String tempOutput=showDVD(toString(dbHost), toString(dbUsername), toString(dbPassword));
      output=toBytes(tempOutput);
      //**
      Object result[]={
      	dest,
      	output
      };
      daddyProxy.sendMessage(new Message("Result from baby",result));
      out("When "+clockSay()+" I answer daddy that\n"+toString((byte[])((Object[])result)[1]));
    }catch(Exception e){out("Baby Except"+e);}
    dispose(); //No matter what..I must die
  }
  //TASKS
  private String showDVD(String host, String username, String password){
    String output="";
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection c = DriverManager.getConnection(host, username, password);
      Statement s = c.createStatement();
      ResultSet r = s.executeQuery("select * from DVD");
      while (r.next())
        output+=(r.getInt(1) + ";" + r.getString(2) + ";" + r.getString(3) + ";" + r.getFloat(4) + ";" + r.getString(5))+";\n";
      s.close();
      c.close();
    }catch(Exception e){out(""+e);}
    return output;
  }
  //UTILITIES
  public static String toString(byte[] x){//Change byte array to String
      String output="";
      for(int i=0;i<x.length;i++)
        output+=(char)x[i];
      return output;
/*    try{
      return decrypt(x, "!@#$%^&*");
    }catch(Exception e){return null;}*/
  }
  public static byte[] toBytes(String x){//Change String to byte array
      return x.getBytes();
/*    try{
      return encrypt(x,"!@#$%^&*");
    }catch(Exception e){return null;}*/
  }
  public static void out(String x){System.out.println(x);}
  public static String clockSay(){
    return ((new java.text.SimpleDateFormat("yyyy-MMMM-dd HH:mm:ss.SSS aaa",new Locale("en","US"))).format(new java.util.Date()));
  }
  public static String decrypt(byte[] data,String key)throws
      NoSuchAlgorithmException,InvalidKeyException,IllegalBlockSizeException,IOException,
      NoSuchPaddingException,BadPaddingException,InvalidAlgorithmParameterException{
    Cipher cipher = Cipher.getInstance("PBEWithMD5AndDES");
    PBEParameterSpec pps = new PBEParameterSpec(bit,16);
    cipher.init(Cipher.DECRYPT_MODE,GetKey(key),pps);
    byte[] DECRYPT=cipher.doFinal(data);
    String output="";
    for(int i=0;i<DECRYPT.length;i++)
      output+=(char)(DECRYPT[i]);
    return output;
  }
  public static byte[] encrypt(String data,String key)throws
      NoSuchAlgorithmException,InvalidKeyException,IllegalBlockSizeException,IOException,
      NoSuchPaddingException,BadPaddingException,InvalidAlgorithmParameterException {
    Cipher cipher = Cipher.getInstance("PBEWithMD5AndDES");
    PBEParameterSpec pps = new PBEParameterSpec(bit,16);
    cipher.init(Cipher.ENCRYPT_MODE,GetKey(key),pps);
    return cipher.doFinal(data.getBytes());
  }
  private static SecretKey GetKey(String k){
    try
    {
      PBEKeySpec Spec = new PBEKeySpec(k.toCharArray());
      SecretKeyFactory Fac = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
      return Fac.generateSecret(Spec);
    }
    catch(Exception e){}
    return null;
  }
}
