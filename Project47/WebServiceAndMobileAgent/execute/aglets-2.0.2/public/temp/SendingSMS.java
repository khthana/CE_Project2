import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.*;
import java.net.*;
import java.util.*;
import java.io.*;
import com.ibm.aglet.*;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import mobileagent.ServerApp;

public class SendingSMS{
  static byte[] bit=new byte[8];
  static ServerApp app;
  AgletProxy temp=null;
  public Object returnAgletResult(String name,Object init){
    try{
      if(name.equals(""))return null;
      if(init==null)init="";
      AgletProxy proxy=null;
      proxy=app.startAglet(new URL("atp://127.0.0.1:4000"),name,((Object)toBytes((String)init)));
      Object reply=null;
      short count=0;
      while(reply==null){
        try{
          reply = proxy.sendMessage(new Message(
              "God Father wanna know"));
        }catch(Exception e){out(""+e);}
        if(count++>10){out("Time out");break;}
        Thread.sleep(500);
      }
      proxy.dispose(); //Killing Parent
      return reply;
    }
    catch(Exception e){out("ZXCV"+e);}
    return null;
  }

  public static void main(String args[]) {
    try {
      SendingSMS sms=new SendingSMS();
      app = new ServerApp();
      app.initServer(app) ;
      String temp=(String)(new SendingSMS()).returnAgletResult("FetchDBParent",null);
      out("\n****\n"+temp+"\n****\n");
      System.exit(0);
    }
    catch (Exception e) {
      System.out.println("Error in main()"+e);
    }
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
