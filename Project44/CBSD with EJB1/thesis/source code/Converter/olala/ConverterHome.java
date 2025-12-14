package olala;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface ConverterHome extends EJBHome
{
	public Converter create()
	throws CreateException, RemoteException;

}