import java.net.*;
import com.ibm.aglet.*;
import com.ibm.aglet.AgletContext.*;

public class CreateAgletListener extends Aglet {
  String hostPort[]={"4000","4434/test","4999"};
  int result=-1;
  public void run(){
    System.out.println("\nCreateAgletListener RUN");
    try{
      String output=this.getAgletInfo().getOrigin();
      out("ORIGIN:"+output);
//      output=this.getAgletInfo().getCodeBase();
      output=this.getAgletInfo().getAddress();
      out("ADDRESS:"+output);

      Thread.sleep(0);
    }catch(Exception e){System.out.println(e);}
  }
  public void out(String x){
    System.out.println(x);
  }
  public void out(int x){
    System.out.println(x);
  }
  public boolean handleMessage(Message msg){
    if (msg.sameKind("I love you")){
      msg.sendReply("Also I.");
      return true;
    }
    if (msg.sameKind("Kea")){
      out("Hello "+msg.getKind());
      return true;
    }
    if (msg.sameKind("Destroy")){
      out("Yes!!! I got "+msg);
      try{
        Thread.sleep(5*1000l);
        out(getClass().getName()+"Destroyed");
        dispose();
      }catch (Exception e){System.out.println(e);}
      return true;
    }
    return false;
  }
}