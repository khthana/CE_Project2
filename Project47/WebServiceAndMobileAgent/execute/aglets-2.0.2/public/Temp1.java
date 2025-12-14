import com.ibm.aglet.*;
import com.ibm.aglet.*;
import java.io.*;
import java.net.URL;

public class Temp1 extends Aglet {
  public void out(String x){System.out.println(x);}
  public void run(){
    try{
      URL destination=new URL("atp://127.0.0.1:4999");
      File directory=new File("C:/TEMP");
      AgletContext context=getAgletContext();
      AgletProxy thisProxy=getProxy();
      Object[] init=new Object[] {directory,thisProxy};
      AgletProxy proxy=context.createAglet(getCodeBase(),"ListingAglet1",init);
      proxy.dispatch(destination);
    }catch(Exception e){System.out.println("Temp ERROR "+e);}
  }
  public boolean handleMessage(Message msg){
    if(msg.sameKind("Listing")){
      String[] list=(String[])msg.getArg();
      for(int i=0;i<list.length;)
        out(i+": "+list[i++]);
        return true;
    }else
      return false;
  }
}
