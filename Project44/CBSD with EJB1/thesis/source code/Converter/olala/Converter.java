package olala;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface Converter extends EJBObject
{
	public double yenToEuro(double yen)
	throws RemoteException;

	public double dollarToYen(double dollars)
	throws RemoteException;

}