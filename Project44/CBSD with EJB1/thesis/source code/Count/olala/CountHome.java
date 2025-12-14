package olala;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface CountHome extends EJBHome
{
	public Count create()
	throws CreateException, RemoteException;

	public Count create(int val)
	throws CreateException, RemoteException;

}