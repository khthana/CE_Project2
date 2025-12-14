import java.util.*;
class BusLine
{
	String bus;
	int[] visit;
	boolean flag = false;		//check already visit?

	//Constructor
	BusLine(String a, int[] b)
	{
		bus = a;
		visit = b;
	}

	BusLine()
	{    
		this(null,null);
	}

	//Method
	public boolean getFlag()
	{
		return flag;
	}

	public void changeFlag()
	{
		flag = true;
	}
};
	
class BusStop
{
	int stopNo;
	String busPass[];

	BusStop(int a, String[] b)
	{
		stopNo = a;
		busPass = b;
	}

	BusStop()
	{
		this(0,null);
	}
};

class Database 
{
	static public int maxStop = 63;
	static public int maxLine = 70;

	int[] a0 = {2,4,5,8,11,13,14,29,31,32,39,49,48};				//ac 1 go
	int[] a1 = {48,49,39,32,31,29,14,13,11,8,5,4,2};				//ac 1 back
	int[] a2 = {48,49,39,32,31,29,19,26,20,58,62};					//2 go
	int[] a3 = {62,58,20,26,19,29,31,32,39,49,48};					//2 back
	int[] a4 = {51,52,54};																//4 go
	int[] a5 = {54,52,51};																//4 back
	int[] a6 = {48,49,39,32,31,29,19,26,20,58,59,60,63};		//ac 6 go
	int[] a7 = {63,60,59,58,20,26,19,29,31,32,39,49,48};		//ac 6 back
	int[] a8 = {45,46,38,30,12,13,15,16,18,27,22,28,23};		//11 go
	int[] a9 = {23,28,22,27,18,16,15,13,12,30,38,46,45};		//11 back
	int[] a10 = {45,46,38,30,12,13,11,8,5,4,2};						//ac 12 go
	int[] a11 = {2,4,5,8,11,13,12,30,38,46,45};						//ac 12 back
	int[] a12 = {3,4,5,8,7,43,42};													//ac 14 go
	int[] a13 = {42,43,7,8,5,4,3};													//ac 14 back
	int[] a14 = {41,43,42};															//15 go
	int[] a15 = {42,43,41};															//15 back
	int[] a16 = {41,43,7,8,11,13,15,16,17,28,23};					//ac 18 go
	int[] a17 = {23,28,17,16,15,13,11,8,7,43,41};					//ac 18 back
	int[] a18 = {1,4,2};																	//ac 19 go
	int[] a19 = {2,4,1};																	//ac 19 back
	int[] a20 = {3,4,6,25,10,16,18,27,21,26,19,29,34,35,40,52,53};	//ac 20 go
	int[] a21 = {53,52,40,35,34,29,19,26,21,27,18,16,10,25,6,4,3};	//ac 20 back
	int[] a22 = {1,4,5,8,11,13,14,29,34,35,40,52,51};				//22 go
	int[] a23 = {51,52,40,35,34,29,14,13,11,8,5,4,1};				//22 back
	int[] a24 = {45,46,38,30,36,32,31,29,19,26,20,58,62};	//23 go
	int[] a25 = {62,58,20,26,19,29,31,32,36,30,38,46,45};	//23 back
	int[] a26 = {45,46,47,49,39,32,31,29,19,26,20,58,59,60,61};		//38 go
	int[] a27 = {61,60,59,58,20,26,19,29,31,32,39,49,47,46,45};		//38 back
	int[] a28 = {48,49,39,32,31,29,14,13,11,8,9,25,10,16,18,27,24,55,56};	//40 go
	int[] a29 = {56,55,24,27,18,16,10,25,9,8,11,13,14,29,31,32,39,49,48};	//40 back
	int[] a30 = {51,52,40,35,34,29,19,26,20,58,62};				//45 go
	int[] a31 = {62,58,20,26,19,29,34,35,40,52,51};				//45 back
	int[] a32 = {51,52,40,35,34,29,19,26,20,58,59,60,61};	//46 go
	int[] a33 = {61,60,59,58,20,26,19,29,34,35,40,52,51};	//46 back
	int[] a34 = {48,49,39,32,31,29,19,26,20,58,59,60,61};	//48 go
	int[] a35 = {61,60,59,58,20,26,19,29,31,32,39,49,48};	//48 back
	int[] a36 = {2,4,5,8,11,13,14,29,34,35,33};						//71 go
	int[] a37 = {33,35,34,29,14,13,11,8,5,4,2};						//71 back
	int[] a38 = {45,46,38,30,36,32,33,35,37};							//72 go
	int[] a39 = {37,35,33,32,36,30,38,46,45};							//72 back
	int[] a40 = {1,4,5,8,11,13,15,16,17,28,23};						//ac 92 go
	int[] a41 = {23,28,17,16,15,13,11,8,5,4,1};						//ac 92 back
	int[] a42 = {45,46,38,30,12,13,11,8,5,4,6};						//93 go
	int[] a43 = {6,4,5,8,11,13,12,30,38,46,45};						//93 back
	int[] a44 = {42,43,44,46,47,49,39,32,33};							//98 go
	int[] a45 = {33,32,39,49,47,46,44,43,42};							//98 back
	int[] a46 = {2,4,5,8,11,13,14,29,34,35,40,52,51};				//109 go
	int[] a47 = {51,52,40,35,34,29,14,13,11,8,5,4,2};				//109 back
	int[] a48 = {3,4,5,8,11,13,12,30,38,46,45};						//113 go
	int[] a49 = {45,46,38,30,12,13,11,8,5,4,3};						//113 back
	int[] a50 = {1,4,5,8,11,13,14,29,19,26,20,58,62};				//ac 126 go
	int[] a51 = {62,58,20,26,19,29,14,13,11,8,5,4,1};				//ac 126 back
	int[] a52 = {33,35,34,29,14,13,15,16,18,27,24,55,57,60,61};	//133 go
	int[] a53 = {61,60,57,55,24,27,18,16,15,13,14,29,34,35,33};	//133 back
	int[] a54 = {41,43,44,46,47,49,50,52,54};							//136 go
	int[] a55 = {54,52,50,49,47,46,44,43,41};							//136 back
	int[] a56 = {41,43,7,8,5,4,1};														//137 go
	int[] a57 = {1,4,5,8,7,43,41};														//137 back
	int[] a58 = {1,4,3};																	//143 go
	int[] a59 = {3,4,1};																	//143 back
	int[] a60 = {1,4,6,25,10,16,18,27,24,55,57,60,63};			//145 go
	int[] a61 = {63,60,57,55,24,27,18,16,10,25,6,4,1};			//145 back
	int[] a62 = {51,52,40,35,37};													//149 go
	int[] a63 = {37,35,40,52,51};													//149 back
	int[] a64 = {53,52,54};															//205 go
	int[] a65 = {54,52,53};															//205 back
	int[] a66 = {41,43,44,46,38,30,12,13,15,16,18,27,24,55,56};	//206 go
	int[] a67 = {56,55,24,27,18,16,15,13,12,30,38,46,44,43,41};	//206 back
	int[] a68 = {5,4,6,25,10,16,18,27,24,55,57,60,61};			//207 go
	int[] a69 = {61,60,57,55,24,27,18,16,10,25,6,4,5};			//207 back

	String[] b0 = {"ac 19 go","ac 19 back","22 go","22 back","ac 92 go","ac 92 back","ac 126 go","ac 126 back","137 go","137 back","143 go","143 back","145 go","145 back"};
	String[] b1 = {"ac 1 go","ac 1 back","ac 12 go","ac 12 back","ac 19 go","ac 19 back","71 go","71 back","109 go","109 back"};
	String[] b2 = {"ac 14 go","ac 14 back","ac 20 go","ac 20 back","113 go","113 back","143 go","143 back"};
	String[] b3 = {"ac 1 go","ac 1 back","ac 12 go","ac 12 back","ac 14 go","ac 14 back","ac 19 go","ac 19 back","ac 20 go","ac 20 back","22 go","22 back","71 go","71 back","ac 92 go","ac 92 back","93 go","93 back","109 go","109 back","113 go","113 back","ac 126 go","ac 126 back","137 go","137 back","143 go","143 back","145 go","145 back","207 go","207 back"};
	String[] b4 = {"ac 1 go","ac 1 back","ac 12 go","ac 12 back","ac 14 go","ac 14 back","22 go","22 back","71 go","71 back","ac 92 go","ac 92 back","93 go","93 back","109 go","109 back","113 go","113 back","ac 126 go","ac 126 back","137 go","137 back","207 go","207 back"}; //5
	String[] b5 = {"ac 20 go","ac 20 back","93 go","93 back","145 go","145 back","207 go","207 back"};
	String[] b6 = {"ac 14 go","ac 14 back","ac 18 go","ac 18 back","137 go","137 back"};
	String[] b7 = {"ac 1 go","ac 1 back","ac 12 go","ac 12 back","ac 14 go","ac 14 back","ac 18 go","ac 18 back","22 go","22 back","40 go","40 back","71 go","71 back","ac 92 go","ac 92 back","93 go","93 back","109 go","109 back","113 go","113 back","ac 126 go","ac 126 back","137 go","137 back"};
	String[] b8 = {"40 go","40 back"};
	String[] b9 = {"ac 20 go","ac 20 back","40 go","40 back","145 go","145 back","207 go","207 back"}; //10
	String[] b10 = {"ac 1 go","ac 1 back","ac 12 go","ac 12 back","ac 18 go","ac 18 back","22 go","22 back","40 go","40 back","71 go","71 back","ac 92 go","ac 92 back","93 go","93 back","109 go","109 back","113 go","113 back","ac 126 go","ac 126 back"};
	String[] b11 = {"11 go","11 back","ac 12 go","ac 12 back","93 go","93 back","113 go","113 back","206 go","206 back"};
	String[] b12 = {"ac 1 go","ac 1 back","11 go","11 back","ac 12 go","ac 12 back","ac 18 go","ac 18 back","22 go","22 back","40 go","40 back","71 go","71 back","ac 92 go","ac 92 back","93 go","93 back","109 go","109 back","113 go","113 back","ac 126 go","ac 126 back","133 go","133 back","206 go","206 back"};
	String[] b13 = {"ac 1 go","ac 1 back","22 go","22 back","40 go","40 back","71 go","71 back","109 go","109 back","ac 126 go","ac 126 back","133 go","133 back"};
	String[] b14 = {"11 go","11 back","ac 18 go","ac 18 back","ac 92 go","ac 92 back","133 go","133 back","206 go","206 back"}; //15
	String[] b15 = {"11 go","11 back","ac 18 go","ac 18 back","ac 20 go","ac 20 back","40 go","40 back","ac 92 go","ac 92 back","133 go","133 back","145 go","145 back","206 go","206 back","207 go","207 back"};
	String[] b16 = {"ac 18 go","ac 18 back","ac 92 go","ac 92 back"};
	String[] b17 = {"11 go","11 back","ac 20 go","ac 20 back","40 go","40 back","133 go","133 back","145 go","145 back","206 go","206 back","207 go","207 back"};
	String[] b18 = {"2 go","2 back","ac 6 go","ac 6 back","ac 20 go","ac 20 back","23 go","23 back","38 go","38 back","45 go","45 back","46 go","46 back","48 go","48 back","ac 126 go","ac 126 back"};
	String[] b19 = {"2 go","2 back","ac 6 go","ac 6 back","23 go","23 back","38 go","38 back","45 go","45 back","46 go","46 back","48 go","48 back","ac 126 go","ac 126 back"}; //20
	String[] b20 = {"ac 20 go","ac 20 back"};
	String[] b21=  {"11 go","11 back"};
	String[] b22 = {"11 go","11 back","ac 18 go","ac 18 back","ac 92 go","ac 92 back"};
	String[] b23 = {"40 go","40 back","133 go","133 back","145 go","145 back","206 go","206 back","207 go","207 back"};
	String[] b24 = {"ac 20 go","ac 20 back","40 go","40 back","145 go","145 back","207 go","207 back"}; //25
	String[] b25 = {"2 go","2 back","ac 6 go","ac 6 back","ac 20 go","ac 20 back","23 go","23 back","38 go","38 back","45 go","45 back","46 go","46 back","48 go","48 back","ac 126 go","ac 126 back"};
	String[] b26 = {"11 go","11 back","ac 20 go","ac 20 back","40 go","40 back","133 go","133 back","145 go","145 back","206 go","206 back","207 go","207 back"};
	String[] b27 = {"11 go","11 back","ac 18 go","ac 18 back","ac 92 go","ac 92 back"};
	String[] b28 = {"ac 1 go","ac 1 back","2 go","2 back","ac 6 go","ac 6 back","ac 20 go","ac 20 back","22 go","22 back","23 go","23 back","38 go","38 back","40 go","40 back","45 go","45 back","46 go","46 back","48 go","48 back","71 go","71 back","109 go","109 back","ac 126 go","ac 126 back","133 go","133 back"};
	String[] b29 = {"11 go","11 back","ac 12 go","ac 12 back","23 go","23 back","72 go","72 back","93 go","93 back","113 go","113 back","206 go","206 back"}; //30
	String[] b30 = {"ac 1 go","ac 1 back","2 go","2 back","ac 6 go","ac 6 back","23 go","23 back","38 go","38 back","40 go","40 back","48 go","48 back"};
	String[] b31 = {"ac 1 go","ac 1 back","2 go","2 back","ac 6 go","ac 6 back","23 go","23 back","38 go","38 back","40 go","40 back","48 go","48 back","72 go","72 back","98 go","98 back"};
	String[] b32 = {"71 go","71 back","72 go","72 back","98 go","98 back","133 go","133 back"};
	String[] b33 = {"ac 20 go","ac 20 back","22 go","22 back","45 go","45 back","46 go","46 back","71 go","71 back","109 go","109 back","133 go","133 back"};
	String[] b34 = {"ac 20 go","ac 20 back","22 go","22 back","45 go","45 back","46 go","46 back","71 go","71 back","72 go","72 back","109 go","109 back","133 go","133 back","149 go","149 back"}; //35
	String[] b35 = {"23 go","23 back","72 go","72 back"};
	String[] b36 = {"72 go","72 back","149 go","149 back"};
	String[] b37 = {"11 go","11 back","ac 12 go","ac 12 back","23 go","23 back","72 go","72 back","93 go","93 back","113 go","113 back","206 go","206 back"};
	String[] b38 = {"ac 1 go","ac 1 back","2 go","2 back","ac 6 go","ac 6 back","38 go","38 back","40 go","40 back","48 go","48 back","98 go","98 back"};
	String[] b39 = {"ac 20 go","ac 20 back","22 go","22 back","45 go","45 back","46 go","46 back","109 go","109 back","149 go","149 back"}; //40
	String[] b40 = {"ac 15 go","ac 15 back","ac 18 go","ac 18 back","136 go","136 back","137 go","137 back","206 go","206 back"}; 
	String[] b41 = {"ac 14 go","ac 14 back","ac 15 go","ac 15 back","98 go","98 back"};
	String[] b42 = {"ac 14 go","ac 14 back","ac 15 go","ac 15 back","ac 18 go","ac 18 back","98 go","98 back","136 go","136 back","137 go","137 back","206 go","206 back"};
	String[] b43 = {"98 go","98 back","136 go","136 back","206 go","206 back"};
	String[] b44 = {"11 go","11 back","ac 12 go","ac 12 back","23 go","23 back","38 go","38 back","72 go","72 back","93 go","93 back","113 go","113 back"}; //45
	String[] b45 = {"11 go","11 back","ac 12 go","ac 12 back","23 go","23 back","38 go","38 back","72 go","72 back","93 go","93 back","98 go","98 back","113 go","113 back","136 go","136 back","206 go","206 back"};
	String[] b46 = {"38 go","38 back","98 go","98 back","136 go","136 back"};
	String[] b47 = {"ac 1 go","ac 1 back","2 go","2 back","ac 6 go","ac 6 back","40 go","40 back","48 go","48 back"};
	String[] b48 = {"ac 1 go","ac 1 back","2 go","2 back","ac 6 go","ac 6 back","38 go","38 back","40 go","40 back","48 go","48 back","98 go","98 back","136 go","136 back"};
	String[] b49 = {"136 go","136 back"}; //50
	String[] b50 = {"4 go","4 back","22 go","22 back","45 go","45 back","46 go","46 back","109 go","109 back","149 go","149 back"};
	String[] b51 = {"4 go","4 back","ac 20 go","ac 20 back","22 go","22 back","45 go","45 back","46 go","46 back","109 go","109 back","136 go","136 back","149 go","149 back","205 go","205 back"};
	String[] b52 = {"ac 20 go","ac 20 back","205 go","205 back"};
	String[] b53 = {"4 go","4 back","136 go","136 back","205 go","205 back"};
	String[] b54 = {"40 go","40 back","133 go","133 back","145 go","145 back","206 go","206 back","207 go","207 back"}; //55
	String[] b55 = {"40 go","40 back","206 go","206 back"};
	String[] b56 = {"133 go","133 back","145 go","145 back","207 go","207 back"};
	String[] b57 = {"2 go","2 back","ac 6 go","ac 6 back","23 go","23 back","38 go","38 back","45 go","45 back","46 go","46 back","48 go","48 back","ac 126 go","ac 126 back"};
	String[] b58 = {"ac 6 go","ac 6 back","38 go","38 back","46 go","46 back","48 go","48 back"};
	String[] b59 = {"ac 6 go","ac 6 back","38 go","38 back","46 go","46 back","48 go","48 back","133 go","133 back","145 go","145 back","207 go","207 back"}; //60
	String[] b60 = {"38 go","38 back","46 go","46 back","48 go","48 back","133 go","133 back","207 go","207 back"};
	String[] b61 = {"2 go","2 back","23 go","23 back","45 go","45 back","ac 126 go","ac 126 back"};
	String[] b62 = {"ac 6 go","ac 6 back","145 go","145 back"};

	/*int[] a0 = {0,2};
	int[] a1 = {2,0};
	int[] a2 = {3,2,1};
	int[] a3 = {1,2,3};
	int[] a4 = {0,1};
	int[] a5 = {1,0};
	
	String[] b0 = {"1 go","1 back","3 go","3 back"};
	String[] b1 = {"2 go","2 back","3 go","3 back"};
	String[] b2 = {"1 go","1 back","2 go","2 back"};
	String[] b3 = {"2 go","2 back"};	 */

	BusLine[] bl = new BusLine[maxLine];
	BusStop[] bs = new BusStop[maxStop];

	public Database()
	{
		System.out.println("Creating Database...");

		/*bl[0] = new BusLine("1 go", a0);
		bl[1] = new BusLine("1 back", a1);
		bl[2] = new BusLine("2 go", a2);
		bl[3] = new BusLine("2 back", a3);
		bl[4] = new BusLine("3 go", a4);
		bl[5] = new BusLine("3 back", a5);

		bs[0] = new BusStop(0, b0);
		bs[1] = new BusStop(1, b1);
		bs[2] = new BusStop(2, b2);
		bs[3] = new BusStop(3, b3);	*/

		bl[0] = new BusLine("ac 1 go",a0);
		bl[1] = new BusLine("ac 1 back",a1);
		bl[2] = new BusLine("2 go",a2);
		bl[3] = new BusLine("2 back",a3);
		bl[4] = new BusLine("4 go",a4);
		bl[5] = new BusLine("4 back",a5);
		bl[6] = new BusLine("ac 6 go",a6);
		bl[7] = new BusLine("ac 6 back",a7);
		bl[8] = new BusLine("11 go",a8);
		bl[9] = new BusLine("11 back",a9);
		bl[10] = new BusLine("ac 12 go",a10);
		bl[11] = new BusLine("ac 12 back",a11);
		bl[12] = new BusLine("ac 14 go",a12);
		bl[13] = new BusLine("ac 14 back",a13);
		bl[14] = new BusLine("ac 15 go",a14);
		bl[15] = new BusLine("ac 15 back",a15);
		bl[16] = new BusLine("ac 18 go",a16);
		bl[17] = new BusLine("ac 18 back",a17);
		bl[18] = new BusLine("ac 19 go",a18);
		bl[19] = new BusLine("ac 19 back",a19);
		bl[20] = new BusLine("ac 20 go",a20);
		bl[21] = new BusLine("ac 20 back",a21);
		bl[22] = new BusLine("22 go",a22);
		bl[23] = new BusLine("22 back",a23);
		bl[24] = new BusLine("23 go",a24);
		bl[25] = new BusLine("23 back",a25);
		bl[26] = new BusLine("38 go",a26);
		bl[27] = new BusLine("38 back",a27);
		bl[28] = new BusLine("40 go",a28);
		bl[29] = new BusLine("40 back",a29);
		bl[30] = new BusLine("45 go",a30);
		bl[31] = new BusLine("45 back",a31);
		bl[32] = new BusLine("46 go",a32);
		bl[33] = new BusLine("46 back",a33);
		bl[34] = new BusLine("48 go",a34);
		bl[35] = new BusLine("48 back",a35);
		bl[36] = new BusLine("71 go",a36);
		bl[37] = new BusLine("71 back",a37);
		bl[38] = new BusLine("72 go",a38);
		bl[39] = new BusLine("72 back",a39);
		bl[40] = new BusLine("ac 92 go",a40);
		bl[41] = new BusLine("ac 92 back",a41);
		bl[42] = new BusLine("93 go",a42);
		bl[43] = new BusLine("93 back",a43);
		bl[44] = new BusLine("98 go",a44);
		bl[45] = new BusLine("98 back",a45);
		bl[46] = new BusLine("109 go",a46);
		bl[47] = new BusLine("109 back",a47);
		bl[48] = new BusLine("113 go",a48);
		bl[49] = new BusLine("113 back",a49);
		bl[50] = new BusLine("ac 126 go",a50);
		bl[51] = new BusLine("ac 126 back",a51);
		bl[52] = new BusLine("133 go",a52);
		bl[53] = new BusLine("133 back",a53);
		bl[54] = new BusLine("136 go",a54);
		bl[55] = new BusLine("136 back",a55);
		bl[56] = new BusLine("137 go",a56);
		bl[57] = new BusLine("137 back",a57);
		bl[58] = new BusLine("143 go",a58);
		bl[59] = new BusLine("143 back",a59);
		bl[60] = new BusLine("145 go",a60);
		bl[61] = new BusLine("145 back",a61);
		bl[62] = new BusLine("149 go",a62);
		bl[63] = new BusLine("149 back",a63);
		bl[64] = new BusLine("205 go",a64);
		bl[65] = new BusLine("205 back",a65);
		bl[66] = new BusLine("206 go",a66);
		bl[67] = new BusLine("206 back",a67);
		bl[68] = new BusLine("207 go",a68);
		bl[69] = new BusLine("207 back",a69);

		bs[0] = new BusStop(1,b0);
		bs[1] = new BusStop(2,b1);
		bs[2] = new BusStop(3,b2);
		bs[3] = new BusStop(4,b3);
		bs[4] = new BusStop(5,b4);
		bs[5] = new BusStop(6,b5);
		bs[6] = new BusStop(7,b6);
		bs[7] = new BusStop(8,b7);
		bs[8] = new BusStop(9,b8);
		bs[9] = new BusStop(10,b9);
		bs[10] = new BusStop(11,b10);
		bs[11] = new BusStop(12,b11);
		bs[12] = new BusStop(13,b12);
		bs[13] = new BusStop(14,b13);
		bs[14] = new BusStop(15,b14);
		bs[15] = new BusStop(16,b15);
		bs[16] = new BusStop(17,b16);
		bs[17] = new BusStop(18,b17);
		bs[18] = new BusStop(19,b18);
		bs[19] = new BusStop(20,b19);
		bs[20] = new BusStop(21,b20);
		bs[21] = new BusStop(22,b21);
		bs[22] = new BusStop(23,b22);
		bs[23] = new BusStop(24,b23);
		bs[24] = new BusStop(25,b24);
		bs[25] = new BusStop(26,b25);
		bs[26] = new BusStop(27,b26);
		bs[27] = new BusStop(28,b27);
		bs[28] = new BusStop(29,b28);
		bs[29] = new BusStop(30,b29);
		bs[30] = new BusStop(31,b30);
		bs[31] = new BusStop(32,b31);
		bs[32] = new BusStop(33,b32);
		bs[33] = new BusStop(34,b33);
		bs[34] = new BusStop(35,b34);
		bs[35] = new BusStop(36,b35);
		bs[36] = new BusStop(37,b36);
		bs[37] = new BusStop(38,b37);
		bs[38] = new BusStop(39,b38);
		bs[39] = new BusStop(40,b39);
		bs[40] = new BusStop(41,b40);
		bs[41] = new BusStop(42,b41);
		bs[42] = new BusStop(43,b42);
		bs[43] = new BusStop(44,b43);
		bs[44] = new BusStop(45,b44);
		bs[45] = new BusStop(46,b45);
		bs[46] = new BusStop(47,b46);
		bs[47] = new BusStop(48,b47);
		bs[48] = new BusStop(49,b48);
		bs[49] = new BusStop(50,b49);
		bs[50] = new BusStop(51,b50);
		bs[51] = new BusStop(52,b51);
		bs[52] = new BusStop(53,b52);
		bs[53] = new BusStop(54,b53);
		bs[54] = new BusStop(55,b54);
		bs[55] = new BusStop(56,b55);
		bs[56] = new BusStop(57,b56);
		bs[57] = new BusStop(58,b57);
		bs[58] = new BusStop(59,b58);
		bs[59] = new BusStop(60,b59);
		bs[60] = new BusStop(61,b60);
		bs[61] = new BusStop(62,b61);
		bs[62] = new BusStop(63,b62);

		System.out.println("Create Database Complete.");
	};

	public BusLine getBusLine(String pb)
	{
		BusLine ret = new BusLine();
		for (int i = 0; i < maxLine; i++)
		{
			if (bl[i].bus == pb)
			{
				ret = bl[i];
				break;
			}
		}
		return ret;
	};

	public BusStop getBusStop(int pa)
	{
		BusStop ret = new BusStop();
		for (int i = 0; i < maxStop; i++)
		{
			if (bs[i].stopNo == pa)
			{
				ret = bs[i];
				break;
			}
		}
		return ret;
	};
}

//Node object
class Node
{
	String busline;
	int startfrom,spanfrom;
	boolean isgoal = false;

	//Constructure of Node
	public Node(String pi,int pj,int pk)
	{
		//System.out.println("Create Node "+pi+", start from "+pj+", span from "+pk);
		busline = pi;
		startfrom = pj;
		spanfrom = pk;
	}

	public Node(String pi,int pj)
	{
		//System.out.println("Create Node "+pi+", start from "+pj+" and no mother node");
		busline = pi;
		startfrom = pj;
		spanfrom = -1;
	}

	public Node()
	{
		this(null,0);
	}

	//return is goal Method
	public boolean isGoal()
	{
		return isgoal;
	}

	//set goal Method
	public void setGoal()
	{
		isgoal = true;
	}

	//get node name Method
	public String getNodeName()
	{
		return busline;
	}

	//get start from Method
	public int getNodeStartFrom()
	{
		return startfrom;
	}

	//get span from Method
	public int getSpanFrom()
	{
		return spanfrom;
	}
};

//Result Object
class Result
{
	int[] backtk;
	Vector lud = new Vector();

	public Result(int[] a,Vector b)
	{
		backtk = a;
		lud = b;
	}
};

//Queue Object
class Queue
{
	private String[] queue;
	int tail, head, len;

	//Constructure of Queue
	public Queue(int num)
	{
		queue = new String[num];
		head = tail = 0;
		len = num;
	}

	//enqueue method
	public void enqueue(String s)
	{
		System.out.println("enqueue "+s);
		queue[tail] = s;
		tail++;
		//System.out.println("queue tail : "+tail);
	}

	//dequeue method
	public String dequeue()
	{
		System.out.println("dequeue "+ queue[head]);
		String ret = queue[head];
		head++;
		//System.out.println("queue head : "+head);
		//System.out.println("queue tail : "+tail);
		return ret;
	}

	//check queue is empty?
	public boolean isEmpty()
	{
		return tail == head;
	}

	//get queue head
	public String head()
	{
		return queue[head];
	}

	public int getHeadIndex()
	{
		int turn = 0;
		for (int i = 0; i < len; i++)
		{
			if (i == head)
			{
				turn = i;
				break;
			}
		}
		return turn;
	}
};

//Int Stack Object
class IntStack extends Stack
{
	//push int method
	public void intPush(int i)
	{
		push(new Integer(i));
		System.out.println("Push '"+i+"' into stack");
	}

	//pop int method
	public int intPop()
	{
		System.out.println("Pop stack");
		return ((Integer) pop()).intValue();
	}
};

//node for Iterative
class IdsNode extends Node
{
	IntStack child_stack = new IntStack();
	int depth;
	boolean flag = false;

	//Constructure
	public IdsNode(String pi,int pj,int pk,int pl)
	{
		//System.out.println("Create Node "+pi+", start from "+pj+", span from "+pk+", depth "+pl);
		busline = pi;
		startfrom = pj;
		spanfrom = pk;
		depth = pl;
	}

	public IdsNode(String pi,int pj,int pk)
	{
		//System.out.println("Create Node "+pi+", start from "+pj+" and no mother node");
		busline = pi;
		startfrom = pj;
		spanfrom = -1;
		depth = pk;
	}

	public IdsNode()
	{
		this(null,0,0);
	}

	public boolean getFlag()
	{
		return flag;
	}

	public void setFlag()
	{
		flag = true;
	}
	
	public IntStack getCStack()
	{
		return child_stack;
	}

	public int getDepth()
	{
		return depth;
	}
};

//main program(router object)
class Router
{
	int goalnum = 0;
	int maxDepth = 5;
	Database db = new Database();
	
	public Result[] route(int[] input)
	{
		//1. check input
		int begin = input[0];
		int finish = input[1];

		if ((begin < 0) && (begin > 3))
		{
			System.out.println("Incorrect Start Node.");
		}
		if ((finish < 0) && (finish >3))
		{
			System.out.println("Incorrect Goal Node.");
		}
		if (begin == finish)
		{
			System.out.println("Start and Goal are the same Node.");
		}

		Result[] ret = new Result[goalnum];

		if (input[2] == 0)
		{
			ret = findwayback(breadth(begin,finish),begin,finish);
		}
		else if (input[2] == 1)
		{
			ret = findwayback(iterative(begin,finish),begin,finish);
		}
		return ret;
	};
	
	//breadth method
	public  Node[] breadth(int start, int goal)
	{
		int maxStop = 63;
		int maxLine = 70;
		//int maxDepth = 5;
		
		int currentNode = 0;
		int depth;
		int lastNodeOfThisLevel;
		//int goalnum = 0;

		//Database db = new Database();
		Queue queue = new Queue(5000);

		//2. look at start node that has any bus line
		BusStop root = new BusStop();
		root = db.getBusStop(start);
		Node[] node = new Node[5000];
		Vector check = new Vector();

		for (int i = 0; i < root.busPass.length; i++)
		{
			node[i] = new Node(root.busPass[i],root.stopNo);
			queue.enqueue(root.busPass[i]);
			db.getBusLine(root.busPass[i]).flag = true;
			currentNode = i;
		}
		//System.out.println("Create root Node Complete.");
		//System.out.println("currentNode : "+currentNode+"\n");
		IntStack stack = new IntStack();
		depth = 1;
		lastNodeOfThisLevel = currentNode;

		//3. while loop
outer:while ((queue.isEmpty() == false) && (depth <= maxDepth))
		{
			String head = queue.head();
			int index = queue.getHeadIndex();
			//System.out.println("index : "+index);
			int startfrom = node[index].getNodeStartFrom();

			int temp = 0;
			BusLine run = new BusLine();
			run = db.getBusLine(head);

			//4. look at head of queue what is next stop?
			for (int i = 0; i < run.visit.length; i++)
			{
				if (run.visit[i] == startfrom)
				{
					temp = i;
					break;
				}
			}

			for (int i = temp+1; i < run.visit.length; i++)
			{
				//5. check that stop is goal?
				if (run.visit[i] == goal)
				{
					node[index].setGoal();
					goalnum++;
					System.out.println("Goal node is : "+node[index].busline);
				}

				BusStop stp = new BusStop();
				stp = db.getBusStop(run.visit[i]);
				for (int j = 0; j < stp.busPass.length; j++)
				{
					if (db.getBusLine(stp.busPass[j]).flag == false)
					{
						boolean same = false;
						for (int k = 0; k < check.size(); k++)
						{
							if (check.elementAt(k) == stp.busPass[j])
							{
								same = true;
								break;
							}
						}
						if (same == false)
						{
							node[currentNode+1] = new Node(stp.busPass[j],stp.stopNo,index);
							queue.enqueue(stp.busPass[j]);
							stack.intPush(currentNode+1);
							currentNode++;
							check.addElement(stp.busPass[j]);
							//System.out.println("currentNode ="+currentNode+"\n");
						}
					}//end if
				}//end for j
			}//end for i
			check.removeAllElements();
			queue.dequeue();
			if (index == lastNodeOfThisLevel)
			{
				depth++;
				lastNodeOfThisLevel = currentNode;
				while (stack.empty() == false)
				{
					int pop = stack.intPop();
					db.getBusLine(node[pop].busline).flag = true;
				}
			}
			//System.out.println("Last Node of this Level : "+lastNodeOfThisLevel);
			//System.out.println("Depth : "+depth);
			//System.out.println("isEmpty : "+queue.isEmpty());
		}//end while ,finish search

		Node[] ret = new Node[currentNode+1];
		for (int i = 0; i < currentNode+1; i++)
		{
			ret[i] = new Node(node[i].getNodeName(),node[i].getNodeStartFrom(),node[i].getSpanFrom());
			if (node[i].isGoal() == true)
			{
				ret[i].setGoal();
			}
		}
		return ret;
	};//end breadth

	//iterative method
	public Node[] iterative(int start, int goal)
	{
		int currentNode = 0;
		boolean shortway = false;
		int point = 0;
		int limit = 1;
		//int goalnum = 0;
		int lastNode = 0;

		//int maxDepth = 5;
	
		//Database db = new Database();
		IdsNode[] node = new IdsNode[1000];
		IntStack tStack = new IntStack();
		Vector check = new Vector();
		
		//create root node
		node[0] = new IdsNode();
		BusStop root = new BusStop();
		root = db.getBusStop(start);

		//System.out.println("Create root node completed... and currentNode is "+currentNode);

		//while outer loop
		while ((shortway == false) && (limit <= maxDepth))
		{
			//System.out.println("limit "+limit);
			//look at start bus stop that have any buses
			for (int i = 0; i < root.busPass.length; i++)
			{
				node[i+1] = new IdsNode(root.busPass[i],root.stopNo,0,1);
				tStack.intPush(i+1);
				db.getBusLine(root.busPass[i]).flag = true;
				currentNode = i+1;
			}
			
			//reverse stack
			while (!tStack.empty())
			{
				node[0].getCStack().intPush(tStack.intPop()); 
			}
			//System.out.println("First reverse complete");

			point = node[0].getCStack().intPop();

			//while inner loop
			while ((point != 0) || (node[0].getCStack().empty() == false))
			{
				if (node[point].getFlag() == false)//if (db.getBusLine(node[point].getNodeName()).flag == false)
				{
					int temp = 0;
					//System.out.println("point(1) "+point);
					int startfrom = node[point].getNodeStartFrom();
				
					//look at the point have any buses
					BusLine run = new BusLine();
					run = db.getBusLine(node[point].getNodeName());

					for (int i = 0; i < run.visit.length; i++)
					{
						if (run.visit[i] == startfrom)
						{
							temp = i;
							break;
						}
					}

					for (int i = temp+1; i < run.visit.length; i++)
					{
						//check that stop is goal
						if (run.visit[i] == goal)
						{
							node[point].setGoal();
							goalnum++;
							shortway = true;
							System.out.println("Goal Node is : "+node[point].getNodeName());
						}
					
						if (node[point].getDepth() < limit)
						{
							//look at this stop has any busline that has never gone
							BusStop stp = new BusStop();
							stp = db.getBusStop(run.visit[i]);
							int tmp = 0;

							for (int j = 0; j < stp.busPass.length; j++)
							{
								//System.out.println(stp.busPass[j]+" "+j);
								for (int k = 1; k <= currentNode; k++)
								{
									if (node[k].getNodeName() == db.getBusLine(stp.busPass[j]).bus)
									{
										tmp = k;
										break;
									}
								}
							
								//System.out.println(db.getBusLine(stp.busPass[j]).flag);
								if ((db.getBusLine(stp.busPass[j]).flag == false) || ((db.getBusLine(stp.busPass[j]).flag == true) && ((node[point].getDepth() + 1) == node[tmp].getDepth())))
								{
									boolean same = false;
									for (int k = 0; k < check.size(); k++)
									{
										if (check.elementAt(k) == stp.busPass[j])
										{
											same = true;
											break;
										}
									}
									if (same == false)
									{
										node[currentNode+1] = new IdsNode(stp.busPass[j],stp.stopNo,point,(node[point].getDepth() + 1));
										tStack.intPush(currentNode+1);
										db.getBusLine(stp.busPass[j]).flag = true;
										currentNode++;
										check.addElement(stp.busPass[j]);
										//System.out.println("currentNode ="+currentNode+"\n");
									}
								}
							}//end for j
						}//end if depth < limit
					}//end for i
				
					check.removeAllElements();
					//reverse stack
					while (tStack.empty() == false)
					{
						node[point].getCStack().intPush(tStack.intPop()); 
					}
					//System.out.println("Second reverse complete");
					node[point].setFlag();
				}//end if flag = false

				//System.out.println("point(2) "+point);
				//change point
				if (node[point].getCStack().empty() == false)
				{
					point = node[point].getCStack().intPop();
				}
				else
				{
					point = node[point].spanfrom;
					if ((point != 0) || (node[0].getCStack().empty() == false))
					{
						while ((point != 0) && (node[point].getCStack().empty() == true)) 
						{
							point = node[point].spanfrom;
							//System.out.println("point "+point);
						}
						if ((point != 0) || (node[0].getCStack().empty() == false))
						{
							point = node[point].getCStack().intPop();
						}
					}
				}

			}//end while inner loop
			limit++;
			lastNode = currentNode;
			currentNode = 0;
			for (int i = 0; i < 70 /*maxLine*/; i++)
			{
				if (db.bl[i].flag == true)
				{
					db.bl[i].flag = false;
				}
			}
		}//end while outer loop
		
		Node[] ret = new Node[lastNode];
		for (int i = 0; i < lastNode; i++)
		{
			ret[i] = new Node(node[i+1].getNodeName(),node[i+1].getNodeStartFrom(),node[i+1].getSpanFrom()-1);
			if (node[i+1].isGoal() == true)
			{
				ret[i].setGoal();
			}
		}
		return ret;
	}//end iterative

	//find way back method
	public Result[] findwayback(Node[] node, int start, int goal)
	{
		//System.out.println("\ncurrentNode : "+currentNode);

		Result[] res = new Result[goalnum];
		
		Vector gotostart = new Vector();
		Vector down_up_line = new Vector();

		//this section try to retrieve the way from goal to start
		BusLine back = new BusLine();
		int resnum = 0;
		//System.out.println("goalnum = "+goalnum);
		for (int i = 0; i < node.length; i++)
		{
			if (node[i].isGoal() == true)
			{
				int vgoal = goal;
				int next = i;
				while (node[next].startfrom != start)
				{
					int tmpStartfrom = 0;
					int tmpVgoal = 0;
					back = db.getBusLine(node[next].busline);
					for (int j = 0; j < back.visit.length; j++)			//find index of startfrom
					{
						if (back.visit[j] == node[next].startfrom)
						{
							tmpStartfrom = j;
							//System.out.println("tmpStartfrom : "+j);
							break;
						}
					}
					for (int j = 0; j < back.visit.length; j++)			//find the goal bus stop
					{
						if (back.visit[j] == vgoal)
						{
							tmpVgoal = j;
							//System.out.println("tmpVgoal : "+j);
							break;
						}
					}
					for (int j = tmpVgoal; j > tmpStartfrom; j--)			//add bus stop from vgoal to startfrom
					{
						gotostart.addElement(new Integer(back.visit[j]));
					}
					down_up_line.addElement(new Integer(vgoal));
					down_up_line.addElement(new Integer(node[next].startfrom));
					down_up_line.addElement(node[next].busline);

					vgoal = node[next].startfrom;
					next = node[next].spanfrom;
				}//end while
				if (node[next].startfrom == start)
				{
					int tmpVgoal = 0;
					int tmpVstart = 0;
					back = db.getBusLine(node[next].busline);
					for (int j = 0; j < back.visit.length; j++)			//find the goal bus stop
					{
						if (back.visit[j] == vgoal)
						{
							//System.out.println("vgoal = "+vgoal);
							tmpVgoal = j;
							break;
						}
					}

					for (int j = 0; j < back.visit.length; j++)
					{
						if (back.visit[j] == node[next].startfrom)
						{
							//System.out.println("vstart = "+node[next].startfrom);
							tmpVstart = j;
							break;
						}
					}

					for (int j = tmpVgoal; j >= tmpVstart; j--)
					{
						//System.out.println("addElement at "+j);
						gotostart.addElement(new Integer(back.visit[j]));
					}
					down_up_line.addElement(new Integer(vgoal));
					down_up_line.addElement(new Integer(node[next].startfrom));
					down_up_line.addElement(node[next].busline);
				}//end if startfrom = start
				
				//retrieve back from start to goal
				int[] backtrack = new int[gotostart.size()];
				Vector line_up_down = new Vector();
				for (int j = 0; j < gotostart.size(); j++)
				{
					int tmp = ((Integer) gotostart.elementAt(gotostart.size() - j - 1)).intValue();
					backtrack[j] = tmp;
				}
				for (int j = 0; j < down_up_line.size(); j++)
				{
					line_up_down.addElement(down_up_line.elementAt(down_up_line.size() - j - 1));
				}

				System.out.println("resnum = "+resnum);
				//keep backtrack & line_up_down into res object
				res[resnum] = new Result(backtrack, line_up_down);
				resnum++;
				gotostart.removeAllElements();
				backtrack = null;
				down_up_line.removeAllElements();
			}//end if isGoal = true
		}// end for i
		
		//show result
		for (int i = 0; i < goalnum; i++)
		{
			System.out.println("Route "+(i+1));
			System.out.print("Backtrack : ");
			for (int j =0; j < res[i].backtk.length; j++)
			{
				System.out.print(res[i].backtk[j]+" ");
			}
			System.out.println();

			System.out.print("line_up_down : ");
			for (int j = 0; j < res[i].lud.size(); j++)
			{
				System.out.print(res[i].lud.elementAt(j)+" ");
			}
			System.out.println("\n");
		}

		return res;

		/*********************************************************************************************************/
		/*       result are 'backtrack'(int array) and 'line_up_down'(vector) that return to display part	*/
		/*																																												*/
		/*********************************************************************************************************/

	}//end find way back method
}//end class

class Runbig
{
	public static void main(String[] args)
	{
		int[] input = new int[3];
		input[0] = Integer.parseInt(args[0]);
		input[1] = Integer.parseInt(args[1]);
		input[2] = Integer.parseInt(args[2]);
		
		//this three line that will add on top's program
		Router router = new Router();
		Result[] showing = new Result[router.goalnum];
		showing = router.route(input);
	}
};