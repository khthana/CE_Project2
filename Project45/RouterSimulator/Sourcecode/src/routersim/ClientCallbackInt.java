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
import javax.swing.JPanel;
public interface ClientCallbackInt extends java.rmi.Remote{
public void callShowStatus(JPanel panel)throws java.rmi.RemoteException;

}