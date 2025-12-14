/***********************************************************************/
/*Declaration of Sensor Class*/
/***********************************************************************/

package api;

public class Sensor 

/***********************************************************************/
/* Sensor Signal Types */
/***********************************************************************/

{
	public static final int E01			= 1;	// ECU GROUND #1	 
	public static final int E02			= 2;	// ECU GROUND #2						
	public static final int NO_1		= 3;	// FUEL INJECTOR 1
	public static final int NO_2		= 4;	// FUEL INJECTOR 2
	public static final int HT			= 5;	// HEATING OXYGEN SENSOR
	public static final int RSO			= 6;	// ISC VALVE
	public static final int RSC			= 7;	// ISC VALVE
	public static final int SEL			= 8;	// GROUND
	public static final int ISC			= 9;	// IDLE SPEED CONTROL
	public static final int IGT			= 10;	// IGNITION SIGNAL
	public static final int G_2			= 11;	// GEAR POSITION SENSOR 1
	public static final int G_L			= 12;	// GEAR POSITION SENSOR 2
	public static final int G			= 13;	// CRANK ANGLE SENSOR
	public static final int G1			= 14;	// CRANK ANGLE SENSOR
	public static final int NE_PLUS		= 15;	// CRANK ANGLE SENSOR
	public static final int NE_SUB		= 16;	// CRANK ANGLE SENSOR
	public static final int IGF			= 17;	// IGNITION CONFIRM SIGNAL
	public static final int SP2			= 18;	// VEHICLE SPEED SENSOR 2
	public static final int S1			= 19;	// ECT SOLINIOD VALVE
	public static final int S2			= 20;	// ECT SOLINIOD VALVE
	public static final int SL			= 21;	// ECT SOLINIOD VALVE
	public static final int E1			= 22;	// ECU GROUND
	public static final int VF			= 23;	// BACKWARD VOLTAGE
	public static final int E21			= 24;	// SENSOR GROUND
	public static final int TT			= 25;	// TEST TERMINAL
	public static final int TE1			= 26;	// TEST TERMINAL
	public static final int OX			= 27;	// OXYGEN SENSOR
	public static final int VAX			= 28;	// OXYGEN SENSOR
	public static final int TE2			= 29;	// TEST TERMINAL 2
	public static final int KNK			= 30;	// KNOCK SENSOR
	public static final int THW			= 31;	// THERMOMETER WATER
	public static final int IDL			= 32;	// THOTTLE POSITION ( IDLE SPEED )
	public static final int THA			= 33;	// THERMOMETER AIR
	public static final int VTA			= 34;	// THOTLE POSITION ( ACCELLERATION )
	public static final int PIM			= 35;	// VACUUM SENSOR
	public static final int VC			= 36;	// VOLTAGE
	public static final int E2			= 37;	// SENSOR GROUND
	public static final int STA			= 38;	// START SENSOR
	public static final int NSW			= 39;	// NEURAL START SWITCH SIGNAL
	public static final int AC1			= 40;	// AIR CONDITION AMPLIFIER
	public static final int ACT			= 41;	// AIR CONDITION AMPLIFIER
	public static final int SPD			= 42;	// VEHICLE SPEED SENSOR
	public static final int OD1			= 43;	// OVERDRIVE CUT SWITCH
	public static final int OD2			= 44;	// OVERDRIVE SWITCH
	public static final int KSW			= 45;	// KICK DOWN SWITCH
	public static final int W			= 46;	// MALFUNTION INDECATIR LAMP
	public static final int BK			= 47;	// BREAK LAMP 
	public static final int RP			= 48;	// FUEL CONTROL TERMINAL
	public static final int ED			= 49;	// ED MONITOR
	public static final int FC			= 50;	// FUEL CONTROL RELAY
	public static final int ELS			= 51;	// ELECTRIC LOAD SIGNAL
	public static final int B			= 52;	// ECU INPUT VOLTAGE
	public static final int BATT		= 53;	// DIAGNOSTIC SYSTEM INPUT VOLTAGE
	public static final int B1			= 54;	// ECU INPUT VOLTAGE

/***********************************************************************/
/* Internal Values */
/***********************************************************************/

	public String name;
	public String unit;
	public double value;
	public int type = 0;

/***********************************************************************/
/* Constructor  
/***********************************************************************/
	
	public Sensor() 
	{
		this.name = "N/A";
		this.unit ="N/A";
		this.value = 0.0;
	}
	
	public Sensor(double a) 
	{
		this.name = "N/A";
		this.unit ="N/A";
		this.value = a;
	}
	
	public Sensor(String name)
	{
		this.name = name;
		this.unit ="N/A";
		this.value = 0;
	}

	public Sensor(String name, String unit, double value)
	{
		this.name = name;
		this.unit =unit;
		this.value = value;
	}
	
	public Sensor(String name, String unit, double value , int type)
	{
		this.name = name;
		this.unit =unit;
		this.value = value;
		this.type = type;
	}
	
	public Sensor(String name, double value , int type)
	{
		this.name = name;
		this.value = value;
		this.type = type;
	}
	
		public Sensor(double a, int type)
	{
		this.value = a;
		this.type = type;
		
		switch (type)
		{
				case E01 : 
 				{ 
					this.name = "E01";
					this.unit="";
					break;
				}
		
				case E02 : 
 				{ 
					this.name = "E02";
					this.unit="";
					break;
				}
		
				case NO_1 : 
 				{ 
					this.name = "NO_1";
					this.unit="Ohm";
					break;
				}
		
				case NO_2 : 
 				{ 
					this.name = "NO_2";
					this.unit="Ohm";
					break;
				}
		
				case HT : 
 				{ 
					this.name = "HT";
					this.unit="Ohm";
					break;
				}
		
				case RSO : 
 				{ 
					this.name = "RSO";
					this.unit="Ohm";
					break;
				}
		
				case RSC : 
 				{ 
					this.name = "RSC";
					this.unit="Ohm";
					break;
				}
		
				case SEL : 
 				{ 
					this.name = "SEL";
					this.unit="";
					break;
				}
		
				case ISC : 
 				{ 
					this.name = "ISC";
					this.unit="Ohm";
					break;
				}
		
				case IGT : 
 				{ 
					this.name = "IGT";
					this.unit="Volt";
					break;
				}
		
				case G_2 : 
 				{ 
					this.name = "G_2";
					this.unit="";
					break;
				}
		
				case G_L : 
 				{ 
					this.name = "G_L";
					this.unit="";
					break;
				}
		
				case G : 
 				{ 
					this.name = "G";
					this.unit="Ohm";
					break;
				}
		
				case G1 : 
 				{ 
					this.name = "G1";
					this.unit="Ohm";
					break;
				}
		
				case NE_PLUS : 
 				{ 
					this.name = "NE_PLUS";
					this.unit="Ohm";
					break;
				}
	
				case NE_SUB : 
 				{ 
					this.name = "NE_SUB";
					this.unit="Ohm";
					break;
				}
	
				case IGF : 
 				{ 
					this.name = "IGF";
					this.unit="Volt";
					break;
				}
		
				case SP2 : 
 				{ 
					this.name = "SP2";
					this.unit="Kph";
					break;
				}
		
				case S1 : 
 				{ 
					this.name = "S1";
					this.unit="N/A";
					break;
				}
		
				case S2 : 
 				{ 
					this.name = "S2";
					this.unit="N/A";
					break;
				}
		
				case SL : 
 				{ 
					this.name = "SL";
					this.unit="N/A";
					break;
				}
		
				case E1 : 
 				{ 
					this.name = "E1";
					this.unit="N/A";
					break;
				}
		
				case VF : 
 				{ 
					this.name = "VF";
					this.unit="N/A";
					break;
				}
		
				case E21 : 
 				{ 
					this.name = "E21";
					this.unit="";
					break;
				}
		
				case TT : 
 				{ 
					this.name = "TT";
					this.unit="Volt";
					break;
				}
		
				case TE1 : 
 				{ 
					this.name = "TE1";
					this.unit="Volt";
					break;
				}
		
				case OX : 
 				{ 
					this.name = "OX";
					this.unit="Volt";
					break;
				}
		
				case VAX : 
 				{ 
					this.name = "VAX";
					this.unit="Volt";
					break;
				}
		
				case TE2 : 
 				{ 
					this.name = "TE2";
					this.unit="Volt";
					break;
				}
		
				case KNK : 
 				{ 
					this.name = "KNK";
					this.unit="Hz";
					break;
				}
		
				case THW : 
 				{ 
					this.name = "THW";
					this.unit="Ohm";
					break;
				}
		
				case IDL : 
 				{ 
					this.name = "IDL";
					this.unit="Ohm";
					break;
				}
		
				case THA : 
 				{ 
					this.name = "THA";
					this.unit="Ohm";
					break;
				}
		
				case VTA : 
 				{ 
					this.name = "VTA";
					this.unit="Volt";
					break;
				}
		
				case PIM : 
 				{ 
					this.name = "PIM";
					this.unit="Volt";
					break;
				}
		
				case VC : 
 				{ 
					this.name = "VC";
					this.unit="Volt";
					break;
				}
		
				case E2 : 
 				{ 
					this.name = "E2";
					this.unit="";
					break;
				}
		
				case STA : 
 				{ 
					this.name = "STA";
					this.unit="Volt";
					break;
				}
		
				case NSW : 
 				{ 
					this.name = "NSW";
					this.unit="Volt";
					break;
				}
		
				case AC1 : 
 				{ 
					this.name = "AC1";
					this.unit="Volt";
					break;
				}
		
				case ACT : 
 				{ 
					this.name = "ACT";
					this.unit="Volt";
					break;
				}
		
				case SPD : 
 				{ 
					this.name = "SPD";
					this.unit="Kph";
					break;
				}
		
				case OD1 : 
 				{ 
					this.name = "OD1";
					this.unit="";
					break;
				}
		
				case OD2 : 
 				{ 
					this.name = "OD2";
					this.unit="";
					break;
				}
		
				case KSW : 
 				{ 
					this.name = "KSW";
					this.unit="";
					break;
				}
		
				case W : 
 				{ 
					this.name = "W";
					this.unit="Volt";
					break;
				}
		
				case BK : 
 				{ 
					this.name = "BK";
					this.unit="Volt";
					break;
				}
		
				case RP : 
 				{ 
					this.name = "RP";
					this.unit="Volt";
					break;
				}
		
				case ED : 
 				{ 
					this.name = "ED";
					this.unit="Volt";
					break;
				}
		
				case FC : 
 				{ 
					this.name = "FC";
					this.unit="";
					break;
				}
		
				case ELS : 
 				{ 
					this.name = "ELS";
					this.unit="N/A";
					break;
				}
		
				case B : 
 				{ 
					this.name = "B";
					this.unit="Volt";
					break;
				}
		 
				case BATT : 
 				{ 
					this.name = "BATT";
					this.unit="Volt";
					break;
				}
		
				case B1 : 
 				{ 
					this.name = "B1";
					this.unit="Volt";
					break;
				}
		
			default :
		}/* End Switch */

	}

/***********************************************************************/
/* Method */
/***********************************************************************/

	public void print()
	{
		System.out.println("==============");
		System.out.println("Name : "+name);
		System.out.println("Value : "+value);
		System.out.println("Unit : "+unit);
		System.out.println("Type : "+type);
		System.out.println("==============");
	}

	public String printString()
	{
		String s = "\n================="+
						"\nName : "+name+
						"\nValue : "+value+
						"\nUnit : "+unit+
						"\nType : "+type;
		return s;
	}

}