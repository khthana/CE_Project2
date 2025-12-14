import mobileagent.AgletRMIServer;
import java.rmi.*;
import java.rmi.server.*;
import java.io.*;
import java.util.*;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;

public class AgletRMIClientKea{
  static byte[] bit=new byte[8];
  public static void main(String[] arg){
    try{
//      System.setProperty("java.security.policy","c:\\aglets-2.0.2\\public\\policy.all");
      long start = System.currentTimeMillis();
//      System.setSecurityManager(new RMISecurityManager());
//      System.out.println("Security Manager is loaded");

      System.out.println("Got remote object");
      System.out.println("\n**GONE");
/*      out(""+((AgletRMIServer)Naming.lookup("//127.0.0.1:1099/RMIATPServer")).showAll());
      Thread.sleep(2000);
      System.out.println("\n**BACKED");*/
//      out(""+((AgletRMIServer)Naming.lookup("//127.0.0.1:1099/RMIATPServer")).updateStock("OlalaMovie",10002,3));
      System.out.println("\n**BACKED");
      out(""+((AgletRMIServer)Naming.lookup("//127.0.0.1:1099/RMIATPServer")).showAll());
      out("\nTIME USED:"+(System.currentTimeMillis()-start)+" mS.");

    }catch (RemoteException exc){
          System.out.println("Error in lookup: " + exc.toString());
    }catch (java.net.MalformedURLException exc){
         System.out.println( "Malformed URL: " + exc.toString());
    }catch (java.rmi.NotBoundException exc){
         System.out.println("NotBound: " + exc.toString());
    }catch(Exception e){
         System.out.println("Exception "+e);
    }
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
