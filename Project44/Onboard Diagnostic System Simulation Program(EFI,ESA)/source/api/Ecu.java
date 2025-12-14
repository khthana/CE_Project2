/* 
	Definition for Ecu Class
*/

package api;
import java.io.*;
import java.text.*;
import java.util.*;
import java.lang.*;
public class Ecu 
{
	/* Define Monitoring signal Unit */

	public Object [][] data = new Object[22][4];
	public double [] dashData = new double[14];
	public boolean [] dashDataB = new boolean[9];

	public static final String MAP_UNIT = "mBar" ;	
	public static final String THOTTLE_UNIT = "%" ;
	public static final String RPM_UNIT = "rpm" ;
	public static final String WATER_TEMP_UNIT = "Degree C" ;
	public static final String AIR_TEMP_UNIT = "Degree C" ;
	public static final String O2_UNIT = "Volt" ;
	public static final String SPEED_UNIT = "Kph" ;
	public static final String BATT_ECU_UNIT = "Volt" ;
	public static final String TT_ECU_UNIT = "Volt" ;
	
	/* Ecu Rom Code
	*/
	public static Object f_data [][] = new Object[20][14];
	public static Object a_data [][] = new Object[20][14];

	public static double [][] fuel_rom = new double[20][13];
	public static double [][] adv_rom  = new double[20][13];
	
	public static final double [] rpmV = 
		{	450, 600, 675, 925, 1150,
			1375, 1600, 1825, 2050, 2300,
			2525, 2750, 3200, 3650, 4125,
			4575, 5025, 5500, 6400, 7486 
		};

	public static final double [] mbarV =
		{	134, 306, 420, 535, 650,
			764, 879, 937, 994, 1051,
			1108, 1165, 1222 
		};

	public static final String [] rpmV_Col = 
		{	" 450"," 600"," 675"," 925","1150",
			"1375","1600","1825","2050","2300",
			"2525","2750","3200","3650","4125",
			"4575","5025","5500","6400","7486" 
		};

	public static final String [] mbarV_Col =
		{	"rpm / mbar"," 134"," 306"," 420"," 535"," 650",
			" 764"," 879"," 937"," 994","1051",
			"1108","1165", "1222" 
		};


	/* Input Signal From Sensor
	*/
	public Sensor pim;
	public Sensor idl;
	public Sensor vta;
	public Sensor g1;
	public Sensor g;
	public Sensor ne_plus;
	public Sensor ne_sub;
	public Sensor knk;
	public Sensor thw;
	public Sensor tha;
	public Sensor ox;
	public Sensor spd;
	public Sensor sp2;
	public Sensor b;
	public Sensor sta;
	public Sensor nsw;
	public Sensor ac1;
	public Sensor act;
	public Sensor tt;
	public Sensor igf;
	public Sensor b_k;
	public Sensor rp;
	public Sensor w = new Sensor();

	/* Internal Signal
	*/
	public Sensor e01;
	public Sensor e02;
	public Sensor no_1;
	public Sensor no_2;
	public Sensor ht;
	public Sensor rso;
	public Sensor rsc;
	public Sensor sel;
	public Sensor isc;
	public Sensor igt;
	public Sensor g_2;
	public Sensor g_l;
	public Sensor s1;
	public Sensor s2;
	public Sensor sl;
	public Sensor e1;
	public Sensor vf;
	public Sensor e21;
	public Sensor te1;
	public Sensor vax;
	public Sensor te2;
	public Sensor vc;
	public Sensor e2;
	public Sensor od1;
	public Sensor od2;
	public Sensor ksw;

	public Sensor bk;
	public Sensor ed;
	public Sensor fc;
	public Sensor els;
	public Sensor batt;
	public Sensor b1;

	/* Monitoring Signal */
	
	public double map ;				// manipulate absolute pressure	
	public double thottle ;			// thottle position 
	public double rpm ;				// RPM
	public double water_temp ;		// Water Temparature
	public double air_temp ;			// Air Temparature
	public double o2 ;				// Oxygen sensor
	public double speed ;			// Vechicle speed sensor
	public double batt_ecu ;			// Battery value
	public double tt_ecu ;			// Battery test value

	public boolean idl_status ;		// yes = idle speed signal
	public boolean knk_status ;		// yes = knock signal
	public boolean sta_status ;		// yes = starting signal
	public boolean nsw_status ;		// yes = idle gear
	public boolean ac_status ;		// yes = air condition open
	public boolean igf_status ;		// yes = ignition confirm
	public boolean bk_status ;		// yes = brake 


	/* EFI output */
	
	public double duration;
	public double duration_basic;
	public double fuel_value;

	/* ESA output */
	public double advance_basic;
	public double advance;

	/* OBD output */
	public boolean mil;

	public Ecu()
	{

	pim = new Sensor();
	idl = new Sensor();
	vta = new Sensor();
	g1 = new Sensor();
	g = new Sensor();
	ne_plus = new Sensor();
	ne_sub = new Sensor();
	knk = new Sensor();
	thw = new Sensor();
	tha = new Sensor();
	ox = new Sensor();
	spd = new Sensor();
	sp2 = new Sensor();
	b = new Sensor();
	sta = new Sensor();
	nsw = new Sensor();
	ac1 = new Sensor();
	act = new Sensor();
	tt = new Sensor();
	igf = new Sensor();
	bk = new Sensor();
	rp = new Sensor();

}

	public Ecu(Sensor [] sensors)
	{
		for(int i = 0 ; i < sensors.length ; i++)
		{
			switch (sensors[i].type)
			{
				 case Sensor.E01 : { e01 = sensors[i]; break; }
				 case Sensor.E02 : { e02 = sensors[i]; break; }
				 case Sensor.NO_1 : { no_1 = sensors[i]; break; }
				 case Sensor.NO_2 : { no_2 = sensors[i]; break; }
				 case Sensor.HT : {	ht = sensors[i]; break; }
				 case Sensor.RSO : { rso = sensors[i]; break; }
				 case Sensor.RSC : { rsc = sensors[i]; break; }
				 case Sensor.SEL : { sel = sensors[i]; break; }
				 case Sensor.ISC : { isc = sensors[i]; break; }
				 case Sensor.IGT : { igt = sensors[i]; break; }
				 case Sensor.G_2 : { g_2 = sensors[i]; break; }
				 case Sensor.G_L : { g_l = sensors[i]; break; }
				 case Sensor.G : { g = sensors[i]; break; }
				 case Sensor.G1 : { g1 = sensors[i]; break; }
				 case Sensor.NE_PLUS : { ne_plus = sensors[i]; break; }
				 case Sensor.NE_SUB : { ne_sub = sensors[i]; break; }
				 case Sensor.IGF : { igf = sensors[i]; break; }
				 case Sensor.SP2 : { sp2 = sensors[i]; break; }
				 case Sensor.S1 : { s1 = sensors[i]; break; }
				 case Sensor.S2 : { s2 = sensors[i]; break; }
				 case Sensor.SL : { sl = sensors[i]; break; }
				 case Sensor.E1 : { e1 = sensors[i]; break; }
				 case Sensor.VF : { vf = sensors[i]; break; }
				 case Sensor.E21 : { e21 = sensors[i]; break; }
				 case Sensor.TT : { tt = sensors[i]; break; }
				 case Sensor.TE1 : { te1 = sensors[i]; break; }
				 case Sensor.OX : {	ox = sensors[i]; break; }
				 case Sensor.VAX : { vax = sensors[i]; break; }
				 case Sensor.TE2 : { te2 = sensors[i]; break; }
				 case Sensor.KNK : { knk = sensors[i]; break; }
				 case Sensor.THW : { thw = sensors[i]; break; }
				 case Sensor.IDL : { idl = sensors[i]; break; }
				 case Sensor.THA : { tha = sensors[i]; break; }
				 case Sensor.VTA : { vta = sensors[i]; break; }
				 case Sensor.PIM : { pim = sensors[i]; break; }
				 case Sensor.VC : { vc = sensors[i]; break; }
				 case Sensor.E2 : { e2 = sensors[i]; break; }
				 case Sensor.STA : { sta = sensors[i]; break; }
				 case Sensor.NSW : { nsw = sensors[i]; break; }
				 case Sensor.AC1 : { ac1 = sensors[i]; break; }
				 case Sensor.ACT : { act = sensors[i]; break; }
				 case Sensor.SPD : { spd = sensors[i]; break; }
				 case Sensor.OD1 : { od1 = sensors[i]; break; }
				 case Sensor.OD2 : { od2 = sensors[i]; break; }
				 case Sensor.KSW : { ksw = sensors[i]; break; }
				 case Sensor.W : { w = sensors[i]; break; }
				 case Sensor.BK : { bk = sensors[i]; break; }
				 case Sensor.RP : { rp = sensors[i]; break; }
				 case Sensor.ED : { ed = sensors[i]; break; }
				 case Sensor.FC : { fc = sensors[i]; break; }
				 case Sensor.ELS : { els = sensors[i]; break; }
				 case Sensor.B : { b = sensors[i]; break; }
				 case Sensor.BATT : { batt = sensors[i]; break; }
				 case Sensor.B1 : { b1 = sensors[i]; break; }
				
			default :
			
			}
		}
	

	 map =(pim.value * 250 );
	 thottle =((vta.value - 0.1)*100) / 4.4 ;
	 rpm = ((( g1.value - 185 )*53.37 ) + (( g.value - 185 )*53.37 ) 
			+ (( ne_plus.value - 370 )*26.79 )+ (( ne_sub.value - 370 )*26.79 ))/4 ;
	 
	 water_temp = 40 - (10*thw.value/1000) ;
	 air_temp =   40 - (10*tha.value/1000) ;
	 o2 = ox.value;
	 speed = (spd.value + sp2.value)/2;	// speed

	 batt_ecu = b.value;
	 tt_ecu = tt.value;

	 if ( idl.value >= 5 ) idl_status = true;
		else idl_status = false;

	 if ( knk.value < 7000 ) knk_status = false;
		else knk_status = true;

	 if ( sta.value >= 6 ) sta_status = true ;
		else sta_status = false;
	
	 if ( nsw.value <= 5 ) nsw_status = true ;
		else nsw_status = false;

	 if ( igf.value >= 5 ) igf_status = true;
		else igf_status = false;

	 if ( (ac1.value >= 0 ) && (ac1.value <= 3) 
			&& (act.value >= 4.5) && (act.value <= 5.5 )) ac_status = true;
	 else ac_status = false;

	 if ( bk.value >= 5 ) bk_status = true;
	else bk_status = false;

	/* Ready to compute duration & advance */
	if (rpm < 7500)
	{
	
	int ri = 0,ci = 0;
	
	while (rpm >= rpmV[ri+1])
		ri++;

	while (map >= mbarV[ci+1])
		ci++;

	double f1,f2;
	double a1,a2;

	if (rpm < rpmV[0])
	{
		f1 = fuel_rom[ri][ci];
		f2 = fuel_rom[ri][ci+1];
		a1 = adv_rom[ri][ci];
		a2 = adv_rom[ri][ci+1];

	}
	else 
	{
	f1 = (((rpm - rpmV[ri] )/( rpmV[ri+1]-rpmV[ri] )) 
				* (fuel_rom[ri+1][ci] - fuel_rom[ri][ci])) 
				+ fuel_rom[ri][ci]; 

	f2 = (((rpm - rpmV[ri] )/( rpmV[ri+1]-rpmV[ri] )) 
				* (fuel_rom[ri+1][ci+1] - fuel_rom[ri][ci+1])) 
				+ fuel_rom[ri][ci+1];

	a1 = (((rpm - rpmV[ri] )/( rpmV[ri+1]-rpmV[ri] )) 
				* (adv_rom[ri+1][ci] - adv_rom[ri][ci])) 
				+ adv_rom[ri][ci]; 

	a2 = (((rpm - rpmV[ri] )/( rpmV[ri+1]-rpmV[ri] )) 
				* (adv_rom[ri+1][ci+1] - adv_rom[ri][ci+1])) 
				+ adv_rom[ri][ci+1];
	
	}
		
	if (map <= mbarV[0])
	{		
		fuel_value = f1;
		advance_basic = a1;
	} 
	else 
	{
	fuel_value = (((map - mbarV[ci] )/( mbarV[ci+1]-mbarV[ci] )) 
				* (f2 - f1)) 
				+ f1;

	advance_basic = (((map - mbarV[ci] )/( mbarV[ci+1]-mbarV[ci] )) 
				* (a2 - a1)) 
				+ a1;
	
	}

	duration_basic = fuel_value/40;
	duration = duration_basic;
	advance = advance_basic;

	/* Update duration from Air Temparature*/
	if (air_temp <= -30 )
	{
		duration = duration*1.075;
	}
	else if((air_temp > -30 )&& (air_temp <= 52.5))
	{
		duration = duration*(1.03 - 0.0015*(air_temp)) ;
	}
	else duration = duration_basic*0.95 ;
	
	/* Update duration from Oxygen sensor */ 
	if (o2 > 0.9)
	{	
		duration = duration - 0.5;
	}
	else if (o2 < 0.1)
	{
		duration = duration + 0.5;
	}

	/* Increase duration from Water Temparature*/
	if (water_temp <= 0 )
	{
		duration = duration*1.075;
	}
	else if((water_temp > 0 )&& (water_temp <= 95))
	{
		duration = duration*(1.075 - 0.001316*(water_temp)) ;
	}
	else duration = duration_basic*0.95 ;
	
	/* Increase duration when Starting Engine */
	if (sta_status)
	{
		duration = duration*1.1;
	}

	/* Update duration when Accelating */

	if(thottle > 0)
		{
			duration = duration*(1+(thottle/500));
		}
	else if(rpm > 3600)
		{
			duration = 0;
		}
	else if((water_temp > -30) && (water_temp <= 30))
		{
			if (rpm > ( 2800 - 26.67*water_temp))
			{
				duration = 0;
			}
		}
	else if((water_temp > 30) && (water_temp <= 70))
		{
			if (rpm > ( 2300 - 10*water_temp ))
			{
				duration = 0;
			}
		}
	else if((water_temp > 70) && (rpm > 2000))
		{
			duration = 0;
		}


	// have more 
	/* Update duration from battery */

	if (batt_ecu <=10 )
	{
		duration = duration_basic + 0.75;
	}
	else if((batt_ecu > 10 )&& (batt_ecu <= 16))
	{
		duration = duration_basic + (1.58 - 0.083*(batt_ecu)) ;
	}
	else duration = duration_basic + 0.25 ;
	
	}

	if (rpm > 7500)
	{
		duration = 0;
	}

	/*end of Increasing duration */

	/* Update Advance from Water Temparature */
	
	if (water_temp > 110)
	{
		advance = advance - 0.5;
	}
	else if((water_temp > 100) && (water_temp <= 110))
	{
		advance = advance + (5 - 0.05*water_temp);
	}
	else if ((water_temp > 60) && (water_temp <= 100))
	{
		advance = advance;
	}
	else if ((water_temp > 50) && (water_temp <= 60))
	{
		advance = advance + (1.2 - 0.05*water_temp);
	}
	else if ((water_temp > 30) && (water_temp <= 50))
	{
		advance = advance - 0.5;
	}
	else if ((water_temp > 0) && (water_temp <= 30))
	{
		advance = advance + (1 - 0.05*water_temp);
	}
	else if (water_temp <= 0)
	{
		advance = advance+1;
	}

	/* Update Advance Engine Knock */
	if (knk_status)
	{
		if (knk.value < 14000)
		{
			advance = advance + (2 - 0.000285*knk.value);
		}
		else advance = advance - 2;
	}


	/* minimum & maximum Advance Limit */
	
	if (advance > 46)
	{	
		advance = 46;
	}

	if (advance < 8 )
	{
		advance = 8;
	}

	}

	public void loadRomCode(File fuel, File adv)
	{
		try
		{
			
		FileInputStream fin1 = new FileInputStream(fuel);
		BufferedReader fuel_buffer = new BufferedReader( new InputStreamReader(fin1 )) ;
		FileInputStream fin2 = new FileInputStream(adv);
		BufferedReader adv_buffer = new BufferedReader( new InputStreamReader(fin2 )) ;
		
		int row = 0 ;
		int c_temp = 0;
		while (fuel_buffer.ready())
			{
			int col = 0;
			String s = fuel_buffer.readLine();
			StringTokenizer st = new StringTokenizer(s);
			while ( st.hasMoreTokens() ){

				String temp = st.nextToken();
				fuel_rom[row][col] = Double.parseDouble(temp);
				col++;
					
				}
			row++;

			}

		/* reset row value */ 
		row = 0;

		while (adv_buffer.ready())
			{
			int col = 0;
			String s = adv_buffer.readLine();
			StringTokenizer st = new StringTokenizer(s);
			while ( st.hasMoreTokens() ){

				String temp = st.nextToken();
				adv_rom[row][col] = Double.parseDouble(temp);
				col++;
					
				}
			row++;
			c_temp = col;
			}

		fuel_buffer.close();
		adv_buffer.close();
		
		String s = "";
		DecimalFormat df2 = new DecimalFormat("#,##0.00");
		
		for(int rowx = 0 ; rowx < 20 ; rowx++)
		{
//			f_data[rowx][0] = rpmV_Col[rowx];
//			a_data[rowx][0] = rpmV_Col[rowx];

			f_data[rowx][0] = new Double(rpmV[rowx]);
			a_data[rowx][0] = new Double(rpmV[rowx]);

		for (int colx = 0 ; colx < 13 ; colx++)
		{
			f_data[rowx][colx+1] = ""+df2.format(fuel_rom[rowx][colx]);
			a_data[rowx][colx+1] = ""+df2.format(adv_rom[rowx][colx]);
		}

		}

	//	System.out.println("x : "+adv_rom[0][4]);
		
		}
		catch (FileNotFoundException fnex) 
		{
			System.out.println("File not Found");
			fnex.printStackTrace();
		}

		catch (IOException ioex) 
		{
			System.out.println("IOException");
			ioex.printStackTrace();
		}	
		
	}

	public void print(int mode )
	{
	if (mode == 0)
	{
	
	pim.print();
	idl.print();
	vta.print();
	g1.print();
	g.print();
	ne_plus.print();
	ne_sub.print();
	knk.print();
	thw.print();
	tha.print();
	ox.print();
	spd.print();
	sp2.print();
	b.print();
	sta.print();
	nsw.print();
	ac1.print();
	act.print();
	tt.print();
	igf.print();
	bk.print();
	w.print();
	}

	DecimalFormat df2 = new DecimalFormat("#,##0.00");
	DecimalFormat df0 = new DecimalFormat("#,##0");
	
	System.out.println(" map : \t\t\t"+df2.format(map)+" "+MAP_UNIT );	
	System.out.println(" thottle : \t\t\t"+df2.format(thottle)+" "+THOTTLE_UNIT );
	System.out.println(" rpm : \t\t\t"+df0.format(rpm)+" "+RPM_UNIT );
	System.out.println(" water_temp : \t\t\t"+df2.format(water_temp)+" "+WATER_TEMP_UNIT );
	System.out.println(" air_temp : \t\t\t"+df2.format(air_temp)+" "+AIR_TEMP_UNIT );
	System.out.println(" o2 : \t\t\t"+df2.format(o2)+" "+O2_UNIT );
	System.out.println(" speed : \t\t\t"+df2.format(speed)+" "+SPEED_UNIT );
	System.out.println(" batt_ecu : \t\t\t"+df2.format(batt_ecu)+" "+BATT_ECU_UNIT );
	System.out.println(" tt_ecu : \t\t\t"+df2.format(tt_ecu)+" "+TT_ECU_UNIT );

	System.out.println(" idl_status : \t\t\t"+idl_status );
	System.out.println(" knk_status : \t\t\t"+knk_status );
	System.out.println(" sta_status : \t\t\t"+sta_status );
	System.out.println(" nsw_status : \t\t\t"+nsw_status );
	System.out.println(" ac_status : \t\t\t"+ac_status );
	System.out.println(" igf_status : \t\t\t"+igf_status );
	System.out.println(" bk_status : \t\t\t"+bk_status );
	
	System.out.println("advance_basic = "+df2.format(advance_basic)+" Degree" );
	System.out.println("duration_basic = "+df2.format(duration_basic)+" ms" );

	System.out.println("advance = "+df2.format(advance)+" Degree"  );
	System.out.println("duration = "+df2.format(duration)+" ms" );

	}
	
	public void loadData()
	{

		String s = "";
		DecimalFormat df2 = new DecimalFormat("#,##0.00");
		
		dashData[0] =  map ;					// manipulate absolute pressure	
		dashData[1] =  thottle ;					// thottle position 
		dashData[2] =  rpm ;						// RPM
		dashData[3] =  water_temp ;		// Water Temparature
		dashData[4] =  air_temp ;			// Air Temparature
		dashData[5] =  o2 ;						// Oxygen sensor
		dashData[6] =  speed ;				// Vechicle speed sensor
		dashData[7] =  batt_ecu ;			// Battery value
		dashData[8] =  tt_ecu ;					// Battery test value
		dashData[9] =  duration;
		dashData[10] =  duration_basic;
		dashData[11] =  fuel_value;
		dashData[12]=  advance_basic;
		dashData[13]=  advance;

		dashDataB[0] =  idl_status ;		// yes = idle speed signal
		dashDataB[1] =  knk_status ;	// yes = knock signal
		dashDataB[2] =  sta_status ;		// yes = starting signal
		dashDataB[3] =  nsw_status ;	// yes = idle gear
		dashDataB[4] =  ac_status ;		// yes = air condition open
		dashDataB[5] =  igf_status ;		// yes = ignition confirm
		dashDataB[6] =  bk_status ;		// yes = brake 
		dashDataB[7] =  mil;						// yes = Malfuntion Engine Indicator

		s = ""+df2.format(pim.value);
		data[0][0] = pim.name;
		data[0][1] = s;
		data[0][2] = pim.unit;
		
		s = ""+df2.format(idl.value);
		data[1][0] = idl.name;
		data[1][1] = s;
		data[1][2] = idl.unit;
		
		s = ""+df2.format(vta.value);
		data[2][0] = vta.name;
		data[2][1] = s;
		data[2][2] = vta.unit;
		
		s = ""+df2.format(g1.value);
		data[3][0] = g1.name;
		data[3][1] = s;
		data[3][2] = g1.unit;
		
		s = ""+df2.format(g.value);
		data[4][0] = g.name;
		data[4][1] = s;
		data[4][2] = g.unit;
		
		s = ""+df2.format(ne_plus.value);
		data[5][0] = ne_plus.name;
		data[5][1] = s;
		data[5][2] = ne_plus.unit;
		
		s = ""+df2.format(ne_sub.value);
		data[6][0] = ne_sub.name;
		data[6][1] = s;
		data[6][2] = ne_sub.unit;
		
		s = ""+df2.format(knk.value);
		data[7][0] = knk.name;
		data[7][1] = s;
		data[7][2] = knk.unit;
		
		s = ""+df2.format(thw.value);
		data[8][0] = thw.name;
		data[8][1] = s;
		data[8][2] = thw.unit;
		
		s = ""+df2.format(tha.value);
		data[9][0] = tha.name;
		data[9][1] = s;
		data[9][2] = tha.unit;
		
		s = ""+df2.format(ox.value);
		data[10][0] = ox.name;
		data[10][1] = s;
		data[10][2] = ox.unit;
		
		s = ""+df2.format(spd.value);
		data[11][0] = spd.name;
		data[11][1] = s;
		data[11][2] = spd.unit;
		
		s = ""+df2.format(sp2.value);
		data[12][0] = sp2.name;
		data[12][1] = s;
		data[12][2] = sp2.unit;
		
		s = ""+df2.format(b.value);
		data[13][0] = b.name;
		data[13][1] = s;
		data[13][2] = b.unit;
		
		s = ""+df2.format(sta.value);
		data[14][0] = sta.name;
		data[14][1] = s;
		data[14][2] = sta.unit;
		
		s = ""+df2.format(nsw.value);
		data[15][0] = nsw.name;
		data[15][1] = s;
		data[15][2] = nsw.unit;
		
		s = ""+df2.format(ac1.value);
		data[16][0] = ac1.name;
		data[16][1] = s;
		data[16][2] = ac1.unit;
		
		s = ""+df2.format(act.value);
		data[17][0] = act.name;
		data[17][1] = s;
		data[17][2] = act.unit;
		
		s = ""+df2.format(tt.value);
		data[18][0] = tt.name;
		data[18][1] = s;
		data[18][2] = tt.unit;
		
		s = ""+df2.format(igf.value);
		data[19][0] = igf.name;
		data[19][1] = s;
		data[19][2] = igf.unit;
		
		s = ""+df2.format(bk.value);
		data[20][0] = bk.name;
		data[20][1] = s;
		data[20][2] = bk.unit;

		s = ""+df2.format(w.value);
		data[21][0] = w.name;
		data[21][1] = s;
		data[21][2] = w.unit;

	}
}