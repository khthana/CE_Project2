import com.ibm.aglet.*;
import com.ibm.aglet.*;
import java.net.URL;

public class Commander extends Aglet {
  public void out(String x){System.out.println(x);}
  public void run(){
    out("*************\nStart");
    Message myName=new Message("Hello Kea");
    AgletProxy proxy=this.getProxy();
    try{
      AgletProxy proxyNew=this.getAgletContext().createAglet(null,"CreateAgletListener",null);

      proxyNew.sendMessage(myName);

      Thread.sleep(3000l);
      out("Stop");
      proxy.dispose();
      out("If see this I'm not Stop!!!");
    }catch(Exception e){System.out.println(e);}
  }
}