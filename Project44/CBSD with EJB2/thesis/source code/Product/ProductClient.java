import olala.*;

import javax.ejb.*;
import javax.naming.*;
import java.util.*;

public class ProductClient
{
	public static void main(String[] args)
	{
		if (args != null && args.length > 0) {
			for (int i = 0; i < args.length; i++) {
				switch(i) {
					case 0:
					url = args[i];
					break;
					case 1:
					user = args[i];
					break;
					case 2:
					password = args[i];
					break;
					default:
				}
			}
		}
        ProductHome home=null;
		try 
		{
			Context ctx = getInitialContext();
			home = (ProductHome) ctx.lookup("Product");
			
			home.create("123-456-7890","P5-350","350 Mhz Pentium",200);
			home.create("123-456-7891","P5-400","400 Mhz Pentium",300);
			home.create("123-456-7892","P5-450","450 Mhz Pentium",400);
			home.create("123-456-7893","SD-64","64 MB SDRAM",50);
			home.create("123-456-7894","SD-128","128 MB SDRAM",100);
			home.create("123-456-7895","SD-256","256 MB SDRAM",200);
		    Enumeration enum=home.findByName("SD-64");
		    System.out.println("The following product descriptions match the product name SD-64:");
		    while (enum.hasMoreElements())
		    {
		        Product prod=(Product) enum.nextElement();
		        System.out.println(prod.getDescription());
		    }
		    System.out.println("Calling finder to find all products that cost $200");
		    enum=home.findByBasePrice(200);
		    while (enum.hasMoreElements())
		    {
		        Product prod=(Product) enum.nextElement();
		        System.out.println(prod.getDescription());
		    }
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
		    if (home!=null)
		    {
		        try
		        {
		            System.out.println("Destroying products..");
		            Enumeration enum=home.findAllProducts();
		            while (enum.hasMoreElements())
		            {
		                try
		                {
		                    Product prod=(Product)enum.nextElement();
		                    prod.remove();
		                }
		                catch (Exception e)
		                {
		                    e.printStackTrace();
		                }
		            }
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		    }
			
		}

	}

	public static Context getInitialContext()
	throws NamingException
	{
		Properties p = new Properties();
		p.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
		p.put(Context.PROVIDER_URL, url);

		if (user != null) {
			p.put(Context.SECURITY_PRINCIPAL, user);
			if (password == null)
				password = "";
			p.put(Context.SECURITY_CREDENTIALS, password);
		}
		return new InitialContext(p);
	}

	static String url = "t3://172.16.102.11:7001";
	static String user = null;
	static String password = null;

}