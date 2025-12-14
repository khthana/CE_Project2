package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

import java.rmi.Naming;
import java.io.*;
import java.rmi.*;
import java.awt.Image;
import java.rmi.RMISecurityManager;
import java.rmi.server.*;
import java.rmi.UnmarshalException;
import java.rmi.ConnectException;
import java.rmi.NotBoundException;
import java.io.WriteAbortedException;
import java.io.NotSerializableException;
import java.rmi.UnmarshalException;
import java.rmi.server.UnicastRemoteObject;
import javax.swing.JPanel;
import javax.swing.*;
import com.incors.plaf.alloy.*;


 class RouterServer {

    public static String localhost="";
    public static void main(String args[]) {
      com.incors.plaf.alloy.AlloyLookAndFeel.setProperty("alloy.isLookAndFeelFrameDecoration" , "true");
      com.incors.plaf.alloy.AlloyLookAndFeel.setProperty("alloy.isPopupShadowEffectEnabled" , "true");
      com.incors.plaf.alloy.AlloyLookAndFeel.setProperty("alloy.licenseCode", "2003/04/30#pearpiw1@hotmail.com#115tw59#12rkxc");

      try {
        com.incors.plaf.alloy.AlloyTheme theme = new com.incors.plaf.alloy.themes.glass.GlassTheme();
        javax.swing.LookAndFeel alloyLnF = new com.incors.plaf.alloy.AlloyLookAndFeel(theme);
        javax.swing.UIManager.setLookAndFeel(alloyLnF);

      } catch (javax.swing.UnsupportedLookAndFeelException ex) {
        // You may handle the exception here
      }
     try {

     FileWriter f1 = new FileWriter("network.dat");
     BufferedWriter b1 = new BufferedWriter(f1);
     PrintWriter p1 = new PrintWriter(b1);
     p1.print(""); //-- create blank file
     p1.close();

     FileWriter f2 = new FileWriter("config.dat");
     BufferedWriter b2 = new BufferedWriter(f2);
     PrintWriter p2 = new PrintWriter(b2);
     p2.print(""); //-- create blank file
      p2.close();


      CommandImpl    c = new CommandImpl();
      Naming.rebind("//localhost/CommandService", c);
      System.out.println("Server Ready1............. ");

      NewRouterImpl    nr = new NewRouterImpl();
      Naming.rebind("//localhost/NewRouterService", nr);
      System.out.println("Server Ready2............. ");

      PassengerImpl  pas = new PassengerImpl();
      Naming.rebind("//localhost/PassengerService",pas);
      System.out.println("Server Ready3............. ");

      RouterConsoleImpl   rcon = new RouterConsoleImpl();
      Naming.rebind("//localhost/RouterConsoleService",rcon);
      System.out.println("Server Ready4............. ");


      StatusPanelImpl    st = new StatusPanelImpl();
      Naming.rebind("//localhost/SPservice", st);
      System.out.println("Server Ready5............. ");


      ServerCallbackImpl  server = new ServerCallbackImpl();
      Naming.rebind("//localhost/ServerCallbackService", server);
      System.out.println("Server Ready6............. ");



     JOptionPane.showMessageDialog(null,"Server Ready.......","Server Message",JOptionPane.INFORMATION_MESSAGE);
    }
      catch (Exception e) {
      JOptionPane.showMessageDialog(null,"Server is not connect ","Server Message",JOptionPane.INFORMATION_MESSAGE);
      System.out.println("Exception occurred: " + e);
    }
   }
}
