import java.net.*;
import com.ibm.aglet.*;

public class SillyAglet extends Aglet {
	public void run() {
		String temp="Hello, world! I am " + getClass().getName() + ".";
		out(temp+"run");
		setText(temp);
	}
	public void onDispose() {
		String temp="Hello, world! I am " + getClass().getName() + ".";
		out(temp+"onDispose");
		setText(temp);
	}
	public void onCreation() {
		String temp="Hello, world! I am " + getClass().getName() + ".";
		out(temp+"onCreation");
		setText(temp);
	}
	public void out(String x){
		System.out.println(x);
	}
	public void out(int x){
		System.out.println(x);
	}
	public boolean handleMessage(Message msg){
    		if (msg.sameKind("Destroy")){
    			out("I got Command:"+msg);
    			try{
    				Thread.sleep(2*1000l);
    				dispose();
    			}catch (Exception e){System.out.println(e);}
    			return true;
    		}
    		if (msg.sameKind("Dispatch")){
    			out("I got Command:"+msg);
    			try{
    				Thread.sleep(2*1000l);
    				dispatch(new URL("atp://ktack:4000"));
    			}catch (Exception e){System.out.println(e);}
    			return true;
    		}
		return false;
	}

}