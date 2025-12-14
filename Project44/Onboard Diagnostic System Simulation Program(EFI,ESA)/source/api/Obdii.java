/***********************************************************************/
/* Declaration of OBD II Class*/
/***********************************************************************/
package api;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;

public class Obdii extends Ecu

{
	
	public String [][] obdRows = new String[50][3];

	private String [] faultcode = new String [100] ;
	
	private int fc = 0;
	
	public Obdii() 
	{
		super();
	}
	
	public Obdii(Sensor [] sensors)
	{
		super(sensors);
		this.print(1);
		fc = 0;
//		ofc = 0;
	}
	
	public void checkFaultCode()
	{
		System.out.print("Check Fault Code");
		
		if ((ne_sub.value < 370) || (ne_sub.value > 650)
				|| (ne_plus.value < 370) || (ne_plus.value > 650))
		{
			faultcode[fc] = "P0654";
			fc++;
		}

		if ((g.value < 185) || (g.value > 325) ||
			(g1.value < 185) || (g1.value > 325) )
		{
			faultcode[fc] = "P0654";
			fc++;
		}

		if (speed < 0)
		{
			faultcode[fc] = "P0500";
			fc++;
			faultcode[fc] = "P0502";
			fc++;
		}
		
		if (rpm < 0)
		{
			faultcode[fc] = "P0654";
			fc++;
			faultcode[fc] = "P0505";
			fc++;
			faultcode[fc] = "P0506";
			fc++;
		}
		
		if (rpm > 3000 && idl_status)
		{
			faultcode[fc] = "P0505";
			fc++;
			faultcode[fc] = "P0507";
			fc++;

		}

		if ((w.value > 14) || (w.value < 9))
		{
			faultcode[fc] = "P0650";
			fc++;
		}

		if (o2 < 0.1)
		{
			faultcode[fc] = "P0130";
			fc++;
			faultcode[fc] = "P0131";
			fc++;

		}

		if (o2 > 0.9)
		{
			faultcode[fc] = "P0130";
			fc++;
			faultcode[fc] = "P0132";
			fc++;

		}
		
		if (map < 0)
		{
			faultcode[fc] = "P0105";
			fc++;
			faultcode[fc] = "P0107";
			fc++;

		}

		if ( map > 1051)
		{
			faultcode[fc] = "P0105";
			fc++;
			faultcode[fc] = "P0108";
			fc++;
		}

		if (vta.value < 0.1)
		{
			faultcode[fc] = "P0120";
			fc++;
			faultcode[fc] = "P0122";
			fc++;
		}
		
		if (vta.value > 4.5 )
		{
			faultcode[fc] = "P0120";
			fc++;
			faultcode[fc] = "P0123";
			fc++;
		}
		
		if (idl.value < 0)
		{
			faultcode[fc] = "P0505";
			fc++;
			faultcode[fc] = "P0508";
			fc++;
		}

		if (idl.value > 14)
		{
			faultcode[fc] = "P0505";
			fc++;
			faultcode[fc] = "P0509";
			fc++;
		}

		if (knk.value < 0)
		{
			faultcode[fc] = "P0325";
			fc++;
			faultcode[fc] = "P1605";
			fc++;
			faultcode[fc] = "P0327";
			fc++;
		}

		if (knk.value > 20000)
		{
			faultcode[fc] = "P0325";
			fc++;
			faultcode[fc] = "P0328";
			fc++;
		}
		
		if (batt_ecu < 0 )
		{
			faultcode[fc] = "P0560";
			fc++;
			faultcode[fc] = "P0562";
			fc++;

		}
		
		if (batt_ecu > 20)
		{
			faultcode[fc] = "P0560";
			fc++;
			faultcode[fc] = "P0563";
			fc++;

		}

		if (water_temp > 120)
		{
			faultcode[fc] = "P0115";
			fc++;
			faultcode[fc] = "P0118";
			fc++;
		}

		if (water_temp < 10)
		{
			faultcode[fc] = "P0115";
			fc++;
			faultcode[fc] = "P0117";
			fc++;
		}

		if (air_temp > 90)
		{
			faultcode[fc] = "P0070";
			fc++;
			faultcode[fc] = "P0073";
			fc++;
		}

		if (air_temp < -5)
		{
			faultcode[fc] = "P0070";
			fc++;
			faultcode[fc] = "P0072";
			fc++;
		}

		if (ac1.value < 0)
		{
			faultcode[fc] = "P0530";
			fc++;
			faultcode[fc] = "P0532";
			fc++;

		}

		if (ac1.value > 9)
		{
			faultcode[fc] = "P0530";
			fc++;
			faultcode[fc] = "P0533";
			fc++;

		}

		if (act.value < 4.5)
		{
			faultcode[fc] = "P0530";
			fc++;
			faultcode[fc] = "P0532";
			fc++;
		}

		if (act.value > 9)
		{
			faultcode[fc] = "P0530";
			fc++;
			faultcode[fc] = "P0533";
			fc++;
		}
		
		if (sta.value > 14)
		{
			faultcode[fc] = "P0615";
			fc++;
			faultcode[fc] = "P0617";
			fc++;
			faultcode[fc] = "P1500";
			fc++;

		}

		if (sta.value < 0)
		{
			faultcode[fc] = "P0615";
			fc++;
			faultcode[fc] = "P0616";
			fc++;
			faultcode[fc] = "P1500";
			fc++;

		}

		if (bk.value > 14)
		{
			faultcode[fc] = "P0570";
			fc++;
			faultcode[fc] = "P0572";
			fc++;

		}

		if (bk.value < 0)
		{
			faultcode[fc] = "P0570";
			fc++;
			faultcode[fc] = "P0571";
			fc++;

		}
		
		if ((igf.value < 0) || (igf.value > 14))
		{
			faultcode[fc] = "P1300";
			fc++;
		}
		
		if ((nsw.value < 0) || (nsw.value > 14))
		{
			faultcode[fc] = "P1899";
			fc++;
		}

	}

	public int  getFaultCode(int ofc )
	{

		SimpleDateFormat formatter = new SimpleDateFormat ("HH:mm:ss:SSS");
		Date time = new Date(); 

		System.out.println("Check Fault Code");

		Connection connection;
		Statement statement;
		ResultSet r1;
		
		String url = "jdbc:odbc:obdii";
		String username = "obdii";
		String password = "obdii";
		
		try { 
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				connection = DriverManager.getConnection(url,username,password);
				System.out.println("Connection Complete");
				
				String fault = "";
				for(int i = 0; i < fc ; i++)
				{
					if (i == fc-1)
					{
						fault = fault+"'"+faultcode[i]+"'";
					}
					else fault = fault+"'"+faultcode[i]+"',";
				}

				String query = "select * from faultcode where id in ("+fault+") ";
				
				if(fc > 0)
				{
					mil = true;
					statement = connection.createStatement();
					r1 = statement.executeQuery(query);
				
					int i = 0;	
					while (r1.next())
					{
						Vector temp = new Vector();
						time = new Date();
						String T = formatter.format(time);
						String P = new String(r1.getString("id"));
						String D = new String(r1.getString("def"));
						
	//				    System.out.println("ofc = "+ofc);
						if (ofc < 49)
						{
						obdRows[ofc][0] = P;
						obdRows[ofc][1] = D;
						obdRows[ofc][2] = T;
						ofc++;
						}
						else if (ofc == 49)
						{
						obdRows[ofc][0] = "Have More Malfunction";
						obdRows[ofc][1] = "";
						obdRows[ofc][2] = "";
						ofc++;
						}

//						String error = 	"Errorcode "+P+" : "+D ;					
//						System.out.println(error );
					
					}
//					System.out.println("count "+fc);
//					System.out.println("fault "+fault);
				}
				else mil = false;

			}	

		catch (ClassNotFoundException cnfx)
			{
				cnfx.printStackTrace();
				System.out.println("Class Not Found Exception");
			}

		catch ( SQLException sqlex) 
			{ 
				sqlex.printStackTrace();
				System.out.println("SQLException Unable To Connect");
			}
		
		return ofc ;
		
	}
}
