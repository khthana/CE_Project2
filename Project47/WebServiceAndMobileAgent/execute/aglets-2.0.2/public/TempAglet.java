import com.ibm.aglet.*;
import com.ibm.aglet.*;
import java.net.URL;

public class TempAglet extends Aglet {
  public void out(String x){System.out.println(x);}
  public void run(){
    out("*************\nStart");
    AgletProxy proxy=this.getProxy();
    try{
      AgletProxy proxyNew=this.getAgletContext().createAglet(null,"SimpleAglet",null);
      proxyNew.sendMessage(new Message("Destroy"));
      out("Return to Base!!!");
      Thread.sleep(1*1000l);
      out("Stop");
      proxy.dispose();
      out("If see this I'm not Stop!!!");
    }catch(Exception e){System.out.println(e);}
  }
}