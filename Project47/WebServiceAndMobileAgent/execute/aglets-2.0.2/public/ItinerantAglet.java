//FROM BOOK PAGE147
import java.io.*;
import java.net.*;
import com.ibm.aglet.*;
import com.ibm.aglet.event.*;

public class ItinerantAglet extends Aglet{
  public void out(String x){System.out.print(x);}
  private Itinerary _itinerary=null;
  public void onCreation(Object init){
    try{
      _itinerary=(Itinerary)init;
      addMobilityListener(
          new MobilityAdapter(){
        public void onArrival(MobilityEvent me){
          try{
            if(_itinerary.hasMoreDestinations()){
              _itinerary.go();
            }else{
              dispose();
            }
          }catch(Exception e){
            //Failed to dispatch.
          }
        }
      }
      );
      _itinerary.init(this);
    }catch(Exception e){
      //Failed to initialize the itinerary
    }
  }
}