
package olala;

import javax.ejb.EJBHome;

import javax.ejb.FinderException;
import java.rmi.RemoteException;

import javax.ejb.CreateException;

import java.util.Enumeration;

public interface ProductHome extends EJBHome
{
	/**
	 * @return 
	 */
	public Product findByPrimaryKey(String key)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Product create(String productId, String name, String description, double basePrice)
		throws CreateException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findAllProducts()
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findCheapProducts(double maxPrice)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findExpensiveProducts(double minPrice)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findByBasePrice(double basePrice)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findByDescription(String description)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findByName(String name)
		throws FinderException, RemoteException; 
}
