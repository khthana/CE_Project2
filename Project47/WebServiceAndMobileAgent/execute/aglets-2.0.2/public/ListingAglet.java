import com.ibm.aglet.*;
import com.ibm.aglet.event.*;
import javax.swing.*;
import java.io.*;
public class ListingAglet extends Aglet {
  public void out(String x){
    System.out.println(x);
  }
  boolean retracted = false;
  File dir=null;
  String [] list;
  public void onCreation(Object init){
    dir=(File)init;
    addMobilityListener(
        new MobilityAdapter(){
            public void onArrival(MobilityEvent me){
              try{
                if(retracted){
                  //Displays list at origin.
                  for (int i=0;i<list.length;)
                    out(i+": "+list[i++]);
                }else{
                  //Obtains directory listing at remote host.
                  list=dir.list();
                }
              }
              catch(Exception e){out("ListingAglet ERROR "+e);dispose();}
            }
            public void onReverting(MobilityEvent me){
              retracted=true;
            }
        }
    );
  }
}