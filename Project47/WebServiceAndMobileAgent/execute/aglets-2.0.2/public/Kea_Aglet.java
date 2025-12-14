import java.io.*;
import java.net.*;
import java.lang.*;
import com.ibm.aglet.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Kea_Aglet  extends Aglet{
  static int result=0;
  public void out(String x){System.out.println(x);}
  public void out(int x){System.out.println(x);}
  public void run() {
    System.out.println("\n*****************\nThis is System.out.println Word\n*****************");
    out("Hello, world! I am " + getClass().getName() + ".");

    try
    {
      dispatch(new URL("atp://ktack:4999"));
    }
    catch (Exception e)
    {
      out("I can't do that, sir!!!");
      out("\n***\n"+e+"\n***\n");
    }
    //		result=someClass.plusIt(result);
    out("\nCurrent result is "+result);
    //setText("Yes!! We're here.");
  }
  public Kea_Aglet() {
    out("CAN CON!");
  }
}