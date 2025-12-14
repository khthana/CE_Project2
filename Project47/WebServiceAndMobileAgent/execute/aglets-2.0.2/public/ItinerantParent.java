import java.util.*;
import java.net.*;
import com.ibm.aglet.*;

public class ItinerantParent extends Aglet {
  Message godFatherWord=null;
  Object result=null;
  public void onCreation(Object init){
    try{
      Vector destinations=new Vector();
      destinations.addElement("atp://127.0.0.1:4000");
      destinations.addElement("atp://127.0.0.1:4555");
      destinations.addElement("atp://127.0.0.1:4999");
      AgletProxy parentProxy=this.getAgletContext().getAgletProxy(this.getAgletID());
      Object[] initArg=new Object[] {
          parentProxy
          , destinations
          , toString((byte[])init)
      };
      URL origin=getAgletContext().getHostingURL();
      AgletProxy proxy=this.getAgletContext().createAglet(this.getCodeBase(),"ItinerantAgletBaby", initArg);
      for(int i=0;i<80;i++){
        if(result!=null){
          if(godFatherWord!=null){
            godFatherWord.sendReply(result);
            this.dispose();
          }
        }else{
          Thread.sleep(500);
        }
      }
    }catch(Exception e){out(""+e);}
  }
  public boolean handleMessage(Message msg){
    try{
      if(msg.sameKind("God Father wanna know")){
        godFatherWord=msg;
        return true;
      }
      if(msg.sameKind("Result from baby")){
        result=msg.getArg();
        return true;
      }
      return false;
    }catch(Exception e){out(""+e);}
    return false;
  }
  //UTILITIES
  public static String toString(byte[] x){//Change byte array to String
    String output="";
    for(int i=0;i<x.length;i++)
      output+=(char)(x[i]);
    return output;
  }
  public static byte[] toBytes(String x){//Change String to byte array
    return x.getBytes();
  }
  public static void out(String x){System.out.println(x);}
}