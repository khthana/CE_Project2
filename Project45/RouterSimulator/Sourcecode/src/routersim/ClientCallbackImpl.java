package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */
import java.rmi.*;
import java.rmi.server.*;
import javax.swing.JPanel;

public class ClientCallbackImpl implements ClientCallbackInt{
    public ClientCallbackImpl()
    {
      super();
    }
    public void callShowStatus(JPanel panel)throws java.rmi.RemoteException
    {
      System.out.println("Callback");
      ImageMotion im = new ImageMotion();// repaint picture
      Frame3.ShowNewStatus(panel);// repaint status pane
    }
}