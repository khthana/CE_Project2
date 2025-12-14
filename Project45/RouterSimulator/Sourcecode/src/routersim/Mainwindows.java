package routersim;

//-- connect server
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.net.MalformedURLException;
import java.rmi.UnmarshalException;
import java.rmi.NotBoundException;
import java.rmi.registry.*;
import java.rmi.server.*;
import java.rmi.RMISecurityManager;
import java.rmi.AccessException;

import javax.swing.UIManager;
import java.awt.*;
import javax.swing.JPanel;
import javax.swing.*;
import java.util.*;
import com.incors.plaf.alloy.*;

public class Mainwindows {

  static Vector Clientlist = new Vector();

  //-- Application constructor
  public Mainwindows() {

    //-- 1 is admin mode( design mode )
    ModeDialog app = new ModeDialog();
  }

  //--Main method
  public static void main(String[] args) {

    //-- This Application use Alloy Look and Feel by default
    //-- com.incors.plaf.alloy.AlloyTheme theme = new com.incors.plaf.alloy.themes.glass.GlassTheme();
    //-- com.incors.plaf.alloy.AlloyTheme theme = new com.incors.plaf.alloy.themes.acid.AcidTheme();

    JFrame.setDefaultLookAndFeelDecorated(true);
    JDialog.setDefaultLookAndFeelDecorated(true);

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

    new Mainwindows();
  }
}