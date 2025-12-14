import com.ibm.aglet.*;
import com.ibm.aglet.event.*;
import javax.swing.*;
import java.io.*;
public class ListingAglet1 extends Aglet {
  public void out(String x){
    System.out.println(x);
  }
  File dir=null;
  AgletProxy proxy=null;
  public void onCreation(Object init){
    dir=(File)((Object[])init)[0];
    proxy=(AgletProxy)((Object[])init)[1];

    addMobilityListener(
        new MobilityAdapter(){
          public void onArrival(MobilityEvent me){
            try{
              proxy.sendMessage(new Message("Listing",dir.list()));
            }catch(Exception e){
              out("ListingAglet1 ERROR"+e);
              dispose();
            }
          }
        }
    );
  }
}