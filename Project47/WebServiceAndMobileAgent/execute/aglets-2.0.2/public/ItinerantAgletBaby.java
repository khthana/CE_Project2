//FROM BOOK PAGE147
import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;
import com.ibm.aglet.event.*;

public class ItinerantAgletBaby extends Aglet{
  Vector vector;
  AgletProxy originParent;
  String input,output="";
  int counter=-1;
  public void out(String x){System.out.print(x);}
  private String doTask(String x){
    String output="";
    for(int i=x.length()-1;i>=0;i--)
      output+=x.charAt(i);
    return output;
  }
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
    input=((String)((Object[])init)[2]);
  }
  public void run(){
    try{
      counter++;
      if(counter>0){
        output += "\nNo." + counter + " Result:" +  doTask(input);
      }
      while (hasMoreElements(vector)){
        try {
          String temp=(String)nextElement(vector);
          out("\n**GOTO "+temp+" AS NUMBER "+counter+"\n");
          this.dispatch(new URL(temp));
        }catch (Exception e) {out("Cannot dispatch:" + e);}
      }
      output+="\nI've travelled for "+(counter+1)+" host(s)";
      originParent.sendOnewayMessage(new Message("Result from baby",output));
      dispose();
    }catch (Exception e) {out("OUTTER " + e);}
  }
  public boolean handleMessage(Message msg){
    if (msg.sameKind("I love you")){
      msg.sendReply("Also I.");
      return true;
    } else
      return false;
  }
 }