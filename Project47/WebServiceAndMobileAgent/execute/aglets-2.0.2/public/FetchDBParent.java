import java.util.*;
import java.io.*;
import java.net.*;
import com.ibm.aglet.*;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;

public class FetchDBParent extends Aglet {
  static byte[] bit=new byte[8];
  static long TIMEOUT=10000;
  long start;
  boolean resultAllDone=false;
  short babyAnswerCounter=0;
  String result="";
  String[] destinations={
      "atp://161.246.6.130:4000"
//      ,"atp://161.246.6.115:4434"
//      ,"atp://127.0.0.1:4555"
  };
  String[][] login={
      {"jdbc:mysql://localhost/mysql","",""}
//      ,{"jdbc:mysql://localhost/mysql","",""}
//      ,{"jdbc:mysql://localhost/mysql","",""}
  };
  public void onCreation(Object init){
    start=System.currentTimeMillis();
    AgletProxy parentProxy=this.getAgletContext().getAgletProxy(this.getAgletID());
    for(int i=0;i<destinations.length;i++){
      try{
        Object[] initArg=new Object[]{
            toBytes(login[i][0]), // Database host
            toBytes(login[i][1]), // Database username
            toBytes(login[i][2]), // Database password
            parentProxy,
            toBytes(destinations[i]),
        };
        this.getAgletContext().createAglet(this.getCodeBase(),"FetchDBBaby", initArg);
      }catch(Exception e){out(""+e);}
    }
  }
  public boolean handleMessage(Message msg){
    try{
      if(msg.sameKind("God Father wanna know")){
        if(System.currentTimeMillis()-start>TIMEOUT)resultAllDone=true; //IF TIMEOUT RETURN RESULT ANYWAY
        if(resultAllDone)
          msg.sendReply(result);
        else
          msg.sendReply(null);
        return true;
      }
      if(msg.sameKind("Result from baby")){
      	babyAnswerCounter++;
        Object answer=msg.getArg();
        byte[] dest  =(byte[])((Object[])answer)[0];
        byte[] output=(byte[])((Object[])answer)[1];
        //Sum answers from babies

        out("When "+clockSay()+" baby from "+toString(dest)+" answered that\n"+toString(output)+"\n");
        result+=toString(output);

        if(babyAnswerCounter>=destinations.length)resultAllDone=true;

        return true;
      }
      return false;
    }catch(Exception e){}
    return false;
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
