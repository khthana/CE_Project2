import java.util.*;
import java.net.*;
import com.ibm.aglet.*;

public class UpdateStockParent extends Aglet {
  static long TIMEOUT=5000;
  long start;
  Boolean result=null;
  String[] destinations={
      "atp://127.0.0.1:4000"
//      ,"atp://127.0.0.1:4999"
//      ,"atp://127.0.0.1:4555"
  };
  String[][] login={
      {"jdbc:mysql://localhost/mysql","",""}
//      ,{"jdbc:mysql://localhost/mysql","",""}
//      ,{"jdbc:mysql://localhost/mysql","",""}
  };
  public void onCreation(Object init){
    start=System.currentTimeMillis();

    int id=((Integer)((Object[])init)[0]).intValue();
    int quantity=((Integer)((Object[])init)[1]).intValue();

    AgletProxy parentProxy=this.getAgletContext().getAgletProxy(this.getAgletID());
    Vector dest=new Vector();
    for(int i=0;i<destinations.length;i++){
      dest.addElement(toBytes(destinations[i]));
    }
    Vector loginVector=new Vector();
    for(int i=0;i<destinations.length;i++){
      loginVector.addElement(toBytes(login[i][0]));
      loginVector.addElement(toBytes(login[i][1]));
      loginVector.addElement(toBytes(login[i][2]));
    }
    try{
      Object[] initArg=new Object[]{
          parentProxy,
          toBytes(String.valueOf(id)),
          toBytes(String.valueOf(quantity)),
          dest,
          loginVector
      };
      this.getAgletContext().createAglet(this.getCodeBase(),"UpdateStockBaby", initArg);
    }catch(Exception e){out(""+e);}
  }

  public boolean handleMessage(Message msg){
    try{
      if(msg.sameKind("God Father wanna know")){
        if(System.currentTimeMillis()-start>TIMEOUT)
          msg.sendReply(result); //IF TIMEOUT RETURN RESULT ANYWAY
        if(result!=null)msg.sendReply(result);
      }
      if(msg.sameKind("Result from baby")){
        result=(Boolean)msg.getArg();
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