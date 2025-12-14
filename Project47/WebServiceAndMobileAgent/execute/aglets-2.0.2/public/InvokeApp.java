import java.math.*;
import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;
import javax.swing.*;

public class InvokeApp extends Aglet{
  public void out(String x){System.out.println(x);}
  public void out(int x){System.out.println(x);}
  public void run(){
    try{
      out("OK SIR");
    }catch (Exception e){out(""+e);}
  }
  public static void main(String args[]){
    try{
      InvokeApp aglet1 = new InvokeApp();
      AgletProxy proxy = aglet1.getProxy();
//      proxy.dispatch(new URL("atp://127.0.0.1:4555"));
    }catch(Exception e){System.out.println(e);}
  }
}
