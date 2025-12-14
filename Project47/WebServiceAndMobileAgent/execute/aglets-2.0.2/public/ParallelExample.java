import com.ibm.aglet.*;
import com.ibm.aglet.event.*;
import java.io.*;
import java.net.URL;
import java.util.*;

public class ParallelExample extends Aglet{
  public void out(String x){
    System.out.println(x);
  }
  public void onCreation(Object init){
    Vector itinerary=new Vector();
    try{
      itinerary.addElement(new URL("atp://127.0.0.1:4000"));
      itinerary.addElement(new URL("atp://127.0.0.1:4999"));
      itinerary.addElement(new URL("atp://127.0.0.1:4555"));
    }catch(Exception e){out(""+e);}
    AgletContext context=getAgletContext();
    AgletProxy parent=getProxy();
    Enumeration enumeration=itinerary.elements();
    while(enumeration.hasMoreElements()){
      try{
        AgletProxy worker=context.createAglet(getCodeBase(),"Worker",parent);
        worker.dispatch((URL)enumeration.nextElement());
      }catch(Exception e){out(""+e);}
    }
  }
  public boolean handleMessage(Message msg){
    if(msg.sameKind("Result")){
      Object arg=msg.getArg("Result");
      out(""+(String)arg);
    }
      return true;
  }
}