import com.ibm.aglet.*;
import com.ibm.aglet.*;
import java.io.*;
import java.net.URL;

public class Temp7 extends Aglet {
  public void out(String x){System.out.println(x);}
  AgletProxy origin;
  public void onCreation(Object arg){
    origin=(AgletProxy)arg;
  }
  public void run(){
    try{
      origin.sendMessage(new Message("Kea"));
    }catch(Exception e){out(""+e);}
  }
}
