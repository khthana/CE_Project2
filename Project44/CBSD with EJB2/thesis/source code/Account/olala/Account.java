
package olala;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;

import java.math.BigDecimal;

public interface Account extends EJBObject
{
	/**
	 * @return 
	 */
	public double getBalance()
		throws RemoteException; 

	public void deposit(double amt)
		throws RemoteException; 

	public void withdraw(double amt)
		throws RemoteException,AccountException; 

	/**
	 * @return 
	 */
	public String getId()
		throws RemoteException; 

	public void setId(String id)
		throws RemoteException; 

	/**
	 * @return 
	 */
	public String getOwnername()
		throws RemoteException; 

	public void setOwnername(String ownername)
		throws RemoteException; 
}
