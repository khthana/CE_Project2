import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;
import com.ibm.aglet.event.*;

public class Slave extends Aglet{
  Object result=null;
  String resultString="";
  Vector vector;
  int max;
  public void out(String x){System.out.print(x);}
  public void onCreation(Object init){
    max=((Integer)((Object[])init)[0]).intValue();
  }
  public void run(){
    try{
      long start=System.currentTimeMillis();
      resultString="\nResult:"+doTask(max)+" Time used:"+(System.currentTimeMillis()-start)+" mS";
      result=resultString;
    }catch (Exception e) {out("" + e);}
  }

  private String doTask(int stop){
    String output="";
    long sum=0;
    for(int i=0;i<stop;i++){
      sum+=i;
    }
    out("CURRENT TIME:"+System.currentTimeMillis());
    return ""+sum;
  }

  public boolean handleMessage(Message msg){
    if(msg.sameKind("I want your result, slave!")){
      out("\nMaster want result now!!");
      msg.sendReply(result);
      return true;
    } else
    return false;
  }
}