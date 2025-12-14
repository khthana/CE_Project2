import olala.*;

import javax.ejb.*;
import javax.naming.*;
import java.util.*;

public class ConverterClient
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

		try {
			Context ctx = getInitialContext();
			ConverterHome home = (ConverterHome) ctx.lookup("Converter");
			Converter the_ejb = home.create();
			System.out.println("the_ejb = " + the_ejb.toString());

			// to do: call business methods
            double euro=the_ejb.yenToEuro(100);
            System.out.println("100 yen = "+euro+" euro");
            double yen=the_ejb.dollarToYen(100);
            System.out.println("100 dollar = "+yen+" yen");
            
			the_ejb.remove();
		}
		catch (Exception e) {
			e.printStackTrace();
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