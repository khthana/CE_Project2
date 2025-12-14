import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;

public class TestLife extends Aglet{
  int count=-1;
  Message godFatherWord;
  String input;
  String output="";
  public void dispatchAtFirstTimeTo(String dest){
    count++;
    if(count>0)return;
    try{
      dispatch(new URL(dest));
    }catch(Exception e){out(""+e);}
  }
  public void onCreation(Object x){
    input=(String)x;
  }
  public void run(){
    dispatchAtFirstTimeTo("atp://127.0.0.1:4555");
    output+="RUN RUN RUN with input->"+input; // DO SOMETHING TO GET RESULT
    for(int i=0;i<80;i++){
      if(godFatherWord!=null)
        godFatherWord.sendReply(output);
      else
        try{
          Thread.sleep(500);
        }catch(Exception e){out(""+e);}
    }
    dispose(); //No matter what..I must die
  }
  public void out(String x){System.out.println(x);}
  public boolean handleMessage(Message msg){
    if (msg.sameKind("God Father wanna know")){
      godFatherWord=msg;
      return true;
    }
    return false;
  }
}