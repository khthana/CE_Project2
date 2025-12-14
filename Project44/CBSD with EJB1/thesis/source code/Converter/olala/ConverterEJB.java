package olala;

import javax.ejb.*;
import java.util.*;
import javax.naming.*;

/**
 * @stereotype SessionBean
 * @remoteInterface olala.Converter
 * @homeInterface olala.ConverterHome
 * @statemode Stateless
 */
public class ConverterEJB implements javax.ejb.SessionBean
{
	public ConverterEJB()
	{
	}

	// ---------------------------------------------------------------
	// SessionBean interface implementation
	public void ejbActivate()
	{
		// to do: code goes here.

	}

	public void ejbPassivate()
	{
		// to do: code goes here.

	}

	public void ejbRemove()
	{
		// to do: code goes here.

	}

	public void setSessionContext(SessionContext ctx)
	{
		this.ctx = ctx;

		// to do: code goes here.

	}

	// ---------------------------------------------------------------
	// create methods
	public void ejbCreate()
	{
		// to do: code goes here.

	}

	// ---------------------------------------------------------------
	// business methods
	public double yenToEuro(double yen)
	{
		return yen*0.0077;
	}

	public double dollarToYen(double dollars)
	{
		return dollars*121.6000;
	}

	// ---------------------------------------------------------------
	// private fields
	private SessionContext ctx;

}