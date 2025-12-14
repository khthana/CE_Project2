//FROM BOOK PAGE147
import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;
import com.ibm.aglet.event.*;

public class KeaMasterAglet extends Aglet{
  Object result;
  String resultString="";
  Vector vector;
  AgletProxy originParent;
  Object initForSlave[];
  AgletProxy slaveProxy[];
  boolean slaveAnswered[];
  int counter=0;
  int max;
  public void out(String x){System.out.print(x);}
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
    originParent=(AgletProxy)((Object[])init)[0];
    vector=(Vector)((Object[])init)[1];
    max=((Integer)((Object[])init)[2]).intValue();
    initForSlave=new Object[]{new Integer(max)};
    slaveAnswered=new boolean[vector.size()];
    slaveProxy=new AgletProxy[vector.size()];
    try{
      long start=System.currentTimeMillis();
      while (hasMoreElements(vector)){
        try {
          String temp=(String)nextElement(vector);
          slaveProxy[counter]=this.getAgletContext().createAglet(this.getCodeBase(),"Slave",initForSlave);
          slaveProxy[counter]=slaveProxy[counter].dispatch(new URL(temp));
          slaveAnswered[counter]=false;
          counter++;
        }
        catch (Exception e) {out("Cannot dispatch:" + e);}
      }
      vector.setSize(3);
    }catch (Exception e) {out("OUTTER " + e);}
    try{
      while(counter>0){
        for(int i=0;i<vector.size();i++){
          if( !slaveAnswered[i]){
            Object tempReply=null;
            try{
              out("\nMaster Ask!!!");
              tempReply = slaveProxy[i].sendMessage(new Message("I want your result, slave!"));
              if(tempReply!=null){
                slaveProxy[i].dispose();
                resultString+=(String)tempReply;
                slaveAnswered[i]=true;
              }
            }catch(Exception e){out("Cannot sendMessage: "+i+":"+e);}
          }
        }
      }
      result=resultString;
      originParent.sendMessage(new Message("result", result));
    }catch (Exception e) {out("CANNOT ANSWER:" + e);}
  }
}