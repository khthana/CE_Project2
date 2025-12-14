package olala;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface Count extends EJBObject
{
	public int count()
	throws RemoteException;

}