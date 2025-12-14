import com.ibm.aglet.*;
import com.ibm.aglet.event.*;
import java.io.*;
import java.net.URL;

public class Worker extends Aglet{
  public void out(String x){
    System.out.println(x);
  }
  public void onCreation(Object init){
    final AgletProxy parent=(AgletProxy)init;
    addMobilityListener(
        new MobilityAdapter(){
          public void onArrival(MobilityEvent me){
            try{
              parent.sendMessage(new Message("Result ","thisIsResult"));
              dispose();
            }catch(Exception e){out(""+e);}
          }
        }
    );
  }
}