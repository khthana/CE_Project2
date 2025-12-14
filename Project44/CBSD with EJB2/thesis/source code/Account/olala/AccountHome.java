
package olala;

import javax.ejb.EJBHome;

import javax.ejb.FinderException;
import java.rmi.RemoteException;

import javax.ejb.CreateException;

import java.util.Enumeration;

public interface AccountHome extends EJBHome
{
	/**
	 * @return 
	 */
	public Account findByPrimaryKey(AccountPK key)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Account create(String id, String ownername)
		throws CreateException, RemoteException; 
		
	/**
	 * @return 
	 */
	public Account create(String id, String ownername, double balance)
		throws CreateException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findByOwnerName(String name)
		throws FinderException, RemoteException; 
}
