//FROM BOOK PAGE148
import java.util.*;
import java.net.*;
import com.ibm.aglet.*;
import com.ibm.aglet.AgletContext.*;

public class SeqItinerary extends Itinerary{
  public void out(String x){System.out.print(x);}
  private Vector _destinations=null;
  //Constructs
  SeqItinerary(URL origin,Vector destinations){
    super(origin);
    _destinations=(Vector)destinations.clone();
  }
  //Dispath
  public void go(){
    URL dest=getNextDestination();
    if(dest!=null){
      _destinations.removeElementAt(0);
      try{
        go(dest);
      }catch(Exception e){
        // If failed skip and go to next place.
        go();
      }
    }
  }
  public boolean hasMoreDestinations(){
    return _destinations.size()>0;
  }
  public URL getNextDestination(){
    if(hasMoreDestinations())
      return (URL)_destinations.firstElement();
    else
      return null;
  }
}