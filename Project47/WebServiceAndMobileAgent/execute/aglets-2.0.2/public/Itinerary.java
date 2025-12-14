//FROM BOOK PAGE147
import java.io.*;
import java.net.*;
import com.ibm.aglet.*;
import com.ibm.aglet.AgletContext.*;

public abstract class Itinerary implements Serializable{
  public void out(String x){System.out.print(x);}
  protected URL _origin=null;
  protected AgletProxy _aglet=null;
  //Constructs the itinerary with information of origin.
  public Itinerary(URL origin){
    _origin=origin;
  }
  //Initializes the itinerary with a reference to the itinerant
  public void init(Aglet aglet){
    _aglet=aglet.getAgletContext().getAgletProxy(aglet.getAgletID());
    go();
  }
  //Gets the origin information
  public URL getOrigin(){
    return _origin;
  }
  //Makes the itinerant aglet dispatch to the specified location.
  protected void go(URL destination) throws Exception{
    _aglet.dispatch(destination);
  }
  //Below methods to be implemented in subclass.
  public abstract void go();
  public abstract boolean hasMoreDestinations();
  public abstract URL getNextDestination();
}