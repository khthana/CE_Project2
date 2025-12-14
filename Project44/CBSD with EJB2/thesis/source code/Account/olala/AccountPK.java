
package olala;

import java.io.Serializable;

public class AccountPK implements Serializable
{
	public String id; 

	/**
	 * @return 
	 * @SBGen Method hashcode using id
	 */
	public int hashCode() {
		// SBgen: Generate hashcode
		return (id.hashCode());
		// SBgen: End hashcode
	} 

	/**
	 * @param that 
	 * @return 
	 * @SBGen Method compare class using id
	 */
	public boolean equals(Object that) {
		// SBgen: Compare member
		if (!(that instanceof AccountPK)) 
			return false;

		AccountPK tmp = (AccountPK)that;
		return (this.id.equals(tmp.id));
		// SBgen: End compare
	} 
	public AccountPK()
	{
	}
	public AccountPK(String id)
	{
	    this.id=id;
	}
	public String toString()
	{
	    return id;
	}
}
