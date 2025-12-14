import com.ibm.aglet.*;
import com.ibm.aglet.event.*;
import java.io.*;
import java.net.URL;

public class Temp2 extends Aglet {
  public void out(String x){System.out.println(x);}
  public void run(){
    try{
      URL destination = new URL("atp://127.0.0.1:4999");
      File directory = new File("C:/TEMP");
      AgletProxy proxy = getAgletContext().createAglet(getCodeBase(),
          "ListingAglet", directory);
      proxy = proxy.dispatch(destination);
      proxy = getAgletContext().retractAglet(destination, proxy.getAgletID());
      proxy.dispose();
    }catch(Exception e){
      out("Temp2 ERROR "+e);
    }
  }
}
