import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceFactory;
//import javax.xml.rpc.Service;
//import javax.xml.rpc.Call;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class WSAgletClient
{
  public static void out(String x){System.out.print(x);}
  public static void main(String arg[]) {
    try {

      String epAddr = "http://localhost:8080/ibmaglet/services/ProcessSQL";

      Call call = (Call) (new Service()).createCall();
      call.setTargetEndpointAddress(epAddr);

      Object init[];

      init=new Object[]{"SELECT * FROM computer;"};
      String result=(String)call.invoke(epAddr,"commandSQL",init);
      out(""+result);
    }
    catch (Exception e) {
      System.err.println(e.toString());
    }
  }
}
