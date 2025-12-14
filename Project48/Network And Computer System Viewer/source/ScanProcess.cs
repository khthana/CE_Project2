using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
//My Include
//Include for ScanProcess Function
using System.Threading;
using System.IO;
using System.Diagnostics;
using System.Net; 
using Org.Snmp.Snmp_pp;

namespace Org.Snmp.Snmp_pp
{
	/// <summary>
	/// Summary description for Class2.
	/// </summary>
	public class CScanProcess
	{
		
		private string tmp1;
		private string tmp2;
		private string tmp3;
		private string tmp4;
		public int OverAllHost;
		public bool isAlive = true;
		public bool RPValid = true;

		public CScanProcess(){}
	
		public void InitialScanProcess(string tmp_1,string tmp_2,string tmp_3,string tmp_4)
		{
			tmp1 = tmp_1;
			tmp2 = tmp_2;
			tmp3 = tmp_3;
			tmp4 = tmp_4;
			isAlive = true;
		}
	
	
		public void ScanProcess()
		{

			string[] IPArray = new string[20];
			string[] ScannerArray = new string[20];
			int IPCount=1;
			string hostName = Dns.GetHostName();
			Console.WriteLine("Host Name = " + hostName);
			IPHostEntry local = Dns.GetHostByName(hostName);    
			foreach(IPAddress ipaddress in local.AddressList)
			{
				IPArray[IPCount] = ipaddress.ToString(); 
				ScannerArray[IPCount] = ":"+ipaddress.ToString()+"|"+hostName+"|";
				IPCount++;
			}

			bool  HaveScanner = false;
			
			string FileToOpen;
			string StartIP = tmp1;
			string SecondIP = tmp2;
			string PortInPut = tmp3;

			//IP Function
			//Find "." Position From Start IP String.
			int FirstDot = StartIP.IndexOf(".",0);
			int SecondDot = StartIP.IndexOf(".",FirstDot+1);
			int ThirdDot = StartIP.IndexOf(".",SecondDot+1);
			//Get Each Numeric Portion From Start IP String. 
			//Ex 161.246.5.122 ==> 161 246 5 122
			string StartFirst = StartIP.Substring(0,FirstDot);
			string StartSecond = StartIP.Substring(FirstDot+1,SecondDot-(FirstDot+1));
			string StartThird = StartIP.Substring(SecondDot+1,ThirdDot-(SecondDot+1));
			string StartForth = StartIP.Substring(ThirdDot+1,StartIP.Length-(ThirdDot+1));

			//Find "." Position From Stop IP String.
			FirstDot = SecondIP.IndexOf(".",0);
			SecondDot = SecondIP.IndexOf(".",FirstDot+1);
			ThirdDot = SecondIP.IndexOf(".",SecondDot+1);
			//Get Each Numeric Portion From Stop IP String.
			string EndFirst = SecondIP.Substring(0,FirstDot);
			string EndSecond = SecondIP.Substring(FirstDot+1,SecondDot-(FirstDot+1));
			string EndThird = SecondIP.Substring(SecondDot+1,ThirdDot-(SecondDot+1));
			string EndForth = SecondIP.Substring(ThirdDot+1,SecondIP.Length-(ThirdDot+1));
			
			//Compare Each Portion of Start and Stop IP and create the Stop Argument for Nmap
			string StopIP = "";
			if (StartFirst != EndFirst){ StopIP += EndFirst;StopIP += "."; }
			if (StartSecond != EndSecond){ StopIP += EndSecond;StopIP += "."; }
			if (StartThird != EndThird){ StopIP += EndThird;StopIP += "."; }
			if (StartForth != EndForth){ StopIP += EndForth; }
			//Insert "-" Infront of Stop Argument
			if (StopIP.Length >1) 
			{
				String tmp = "-";
				tmp += StopIP;
				StopIP=tmp;
			}

			//Create Nmap Argument
			string Arg = " -sT ";
			//Concat the Start and Stop IP Portion into Argument
			Arg += StartIP;
			Arg += StopIP;

			//Port Function
			string Port = "";
			bool GetPort = true;
			int GetPortINDEX = 0;
			//Get port and convert from "x-y" into "x,y".
			while(GetPort)
			{
				if (PortInPut.IndexOf(",",GetPortINDEX)!= -1)
				{
					string CheckScore = PortInPut.Substring(GetPortINDEX,PortInPut.IndexOf(",",GetPortINDEX)-GetPortINDEX);
					if (CheckScore.IndexOf("-") != -1)
					{
						int Score = PortInPut.IndexOf("-",GetPortINDEX);
						string PortTMP = PortInPut.Substring(GetPortINDEX,Score-GetPortINDEX);
						string PortTMP2 = PortInPut.Substring(Score+1,PortInPut.IndexOf(",",GetPortINDEX)-Score-1);
						long PortI = Int64.Parse(PortTMP);
						long PortJ = Int64.Parse(PortTMP2);
						for (long i = PortI;i<=PortJ;i++) { Port += i.ToString()+","; }
					}
					else
					{
						Port += PortInPut.Substring(GetPortINDEX,PortInPut.IndexOf(",",GetPortINDEX)-GetPortINDEX);
						Port += ",";
					}
					GetPortINDEX = PortInPut.IndexOf(",",GetPortINDEX)+1;
				}
				else
				{
					string CheckScore = PortInPut.Substring(GetPortINDEX,PortInPut.Length-GetPortINDEX);
					if (CheckScore.IndexOf("-") != -1)
					{
						int Score = PortInPut.IndexOf("-",GetPortINDEX);
						string PortTMP = PortInPut.Substring(GetPortINDEX,Score-GetPortINDEX);
						string PortTMP2 = PortInPut.Substring(Score+1,PortInPut.Length-Score-1);
						long PortI = Int64.Parse(PortTMP);
						long PortJ = Int64.Parse(PortTMP2);
						for (long i = PortI;i<=PortJ;i++) { Port += i.ToString()+","; }
					}
					else
						Port += PortInPut.Substring(GetPortINDEX,PortInPut.Length-GetPortINDEX);
					GetPort = false;
				}
			}//End of While Loop GetPort.

			//Concat Port portion into Argument.
			Arg += " -p ";
			Arg += PortInPut;
			
			//Concat Output portion into Argument.
			Arg += " -oN Scan.HJ ";

			//Call Nmap Function.
			Process p=null;
			try
			{
				p= new Process();
				p.StartInfo.FileName = "nmap";
				p.StartInfo.Arguments = Arg;
				p.StartInfo.CreateNoWindow = true;
				p.StartInfo.UseShellExecute = false;
				p.StartInfo.RedirectStandardError = true;
				p.StartInfo.RedirectStandardInput = true;
				p.StartInfo.RedirectStandardOutput = true;
				p.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
				p.Start();
				p.WaitForExit();
			}
			catch
			{
				MessageBox.Show("Error");
			}
			
			//Database Function.
			FileToOpen = "Scan.HJ";
			StreamReader sr = new StreamReader(FileToOpen);
			//Get String from Scan result.
			string OpenText = sr.ReadToEnd();
			sr.Close();

			//Function to check if there are any host found.
			int NextHost = 0;
			bool MoreHost = true;
			string OpenHost ="";
			if (OpenText.IndexOf("ports on ",NextHost) == -1)
				MoreHost = false;
			
			//Loop for create/write each host scan result into .ip file.
			while (MoreHost)
			{
				//Get Position of Hostname and IP
				int NextFind = OpenText.IndexOf("ports on ",NextHost)+9;
				int IPStartINDEX = OpenText.IndexOf("(",NextFind);
				int IPStopINDEX = OpenText.IndexOf(")",NextFind);

				//Get Hostname and IP.
				string HostName = OpenText.Substring(NextFind,IPStartINDEX-NextFind-1);
				string IP = OpenText.Substring(IPStartINDEX+1,IPStopINDEX-IPStartINDEX-1);
				if (HostName.IndexOf("\n")!=-1)
				{
					HostName = "Cannot Resolve Hostname";
					IP = OpenText.Substring(NextFind,OpenText.IndexOf(":",NextFind)-NextFind);
					IPStopINDEX = OpenText.IndexOf(":",NextFind);
				}
				
				int ScannerSequence = 0;
				bool NotScanner = true;
				for (int Count=0;Count<IPCount;Count++)
				{
					if (IP == IPArray[Count+1])
					{
						NotScanner = false;
						HaveScanner = true;
						ScannerSequence = Count+1;
					}
				}
				bool PortLoop = true;
				int PortINDEX = 0;
				int PortNext = 0;
				string PortEach = "";
				string OpenPort = "";

				//Get Port Open in select ip.
				while (PortLoop)
				{
					if (Port.IndexOf(",",PortNext)==-1)
					{
						PortEach = Port.Substring(PortNext,Port.Length-PortNext);
						PortLoop = false;
					}
					else
					{
						PortEach = Port.Substring(PortNext,Port.IndexOf(",",PortNext)-PortNext);
						PortNext = Port.IndexOf(",",PortNext)+1;
					}
					PortINDEX = OpenText.IndexOf(PortEach,IPStopINDEX);
					if (PortINDEX != -1)
					{
						//Get port stat but cause of shift " " in numeric port.
						string PortStat = OpenText.Substring(OpenText.IndexOf(" ",PortINDEX)+1,1);
						if (PortStat == " ")
							PortStat = OpenText.Substring(OpenText.IndexOf(" ",PortINDEX)+2,1);
						if (PortStat == " ")
							PortStat = OpenText.Substring(OpenText.IndexOf(" ",PortINDEX)+3,1);
						if (PortStat == " ")
							PortStat = OpenText.Substring(OpenText.IndexOf(" ",PortINDEX)+4,1);
						if (PortStat == " ")
							PortStat = OpenText.Substring(OpenText.IndexOf(" ",PortINDEX)+5,1);		
						if (PortStat == "o")
						{
							//Concat into string that store open port.
							bool NotPort = false;
							string NotPortStr = OpenText.Substring(PortINDEX-1,1);
							if (NotPortStr != "\n")
								NotPort = true;

							string NotPortStr2 = OpenText.Substring(PortINDEX+PortEach.Length,1);
							if (NotPortStr2 != "/") 
								NotPort = true;

							if (OpenText.IndexOf("MAC",IPStopINDEX) != -1)
							{
								if (PortINDEX >= OpenText.IndexOf("MAC",IPStopINDEX)) NotPort = true;
							}
							if (OpenText.IndexOf("All",IPStopINDEX) != -1)
							{
								if (PortINDEX >= OpenText.IndexOf("All",IPStopINDEX)) NotPort = true;
							}
							if (OpenText.IndexOf("Inter",IPStopINDEX) != -1)
							{
								if (PortINDEX >= OpenText.IndexOf("Inter",IPStopINDEX)) NotPort = true;
							}
							if (OpenText.IndexOf("Nmap",IPStopINDEX) != -1)
							{
								if (PortINDEX >= OpenText.IndexOf("Nmap",IPStopINDEX)) NotPort = true;
							}

							if (!NotPort)
							{
								OpenPort += PortEach;
								OpenPort += " ";
							}
						}
					}
				}//End of While Loop PortLoop.
				
				if (NotScanner)
				{
					//Create File .ip name and Data to save.
					/*string WriteFileName = IP;
					WriteFileName += ".IP";
					string WriteData = IP+"|"+HostName+"|"+OpenPort;
					//Store IP in OpenHost String for save into File that contain only IP.
					OpenHost += "|"+IP;
			
					//Save Data into File .ip.
					StreamWriter sw = new StreamWriter(WriteFileName,false);
					sw.Write (WriteData);
					sw.Flush();
					sw.Close();*/
					//Store Data in OpenHost string for save in to .IP File that contain all data.
					OpenHost += " : "+IP+" | "+HostName+" | "+OpenPort + " \r\n";
				}
				else
				{
					ScannerArray[ScannerSequence] += OpenPort;
				}

				//Find Next Starting point of next Host.
				NextHost = OpenText.IndexOf("ports on ",NextFind);
				if (NextHost == -1)
					MoreHost = false;
			}//End of While Loop MoreHost.

			//Find total of host that is open.
			int ConcludeINDEX = OpenText.IndexOf("complete",0);
			int HostStart = OpenText.IndexOf("(",ConcludeINDEX)+1;
			int HostStop = OpenText.IndexOf(" ",HostStart);
			string HostSum = OpenText.Substring(HostStart,HostStop-HostStart);	

			for (int Count=1;Count<IPCount;Count++)
			{
				if (OpenText.IndexOf(IPArray[Count],0) != -1)
					HaveScanner = true;
			}
			if (HaveScanner)
			{
				long TMPHostSum = Int64.Parse(HostSum)-1;
				HostSum = TMPHostSum.ToString();
			}
			OverAllHost += Int32.Parse(HostSum);
			OpenHost = OpenHost;
			//OpenHost = HostSum +" \r\n"+ OpenHost;
			
			//Save Data into Host.IP File.
			StreamWriter OP = new StreamWriter(tmp4+"_Host.IP",true);
			OP.Write (OpenHost);
			OP.Flush();
			OP.Close();
			IPCount--;
			string ScannerData = IPCount.ToString();
			for (int Count=0;Count<IPCount;Count++)
			{
				ScannerData += ScannerArray[Count+1];
			}
			StreamWriter SC = new StreamWriter("Scanner.IP",false);
			SC.Write (ScannerData);
			SC.Flush();
			SC.Close();
			
			isAlive = false;
			//txtData.Text = ScannerData;
		}
	

		public void HostServiceScan(string IpAddress,int SCO,string PortSpecific)
		{
			string IndexIP = "";
			for (int aa = 0;aa<IpAddress.Length;aa++)
			{
				if (IpAddress.Substring(aa,1)!=".")
					IndexIP += IpAddress.Substring(aa,1);
				else
					IndexIP += "_";
			}
			string Arg = "-sT "+IpAddress;
			if (SCO == 1)
				Arg += " -F";
			else if (SCO == 2)
			{
				Arg += " -p ";
				StreamReader TJ = new StreamReader("Trojan.info");
				string TJ_Text = TJ.ReadToEnd();
				TJ.Close();
				Arg += TJ_Text;
			}
			else if (SCO == 3)
				Arg += " -p "+PortSpecific;
			Arg += " -oN "+IndexIP+".info -P0";
			Process p=null;
			try
			{
				p= new Process();
				p.StartInfo.FileName = "nmap";
				p.StartInfo.Arguments = Arg;
				p.StartInfo.CreateNoWindow = true;
				p.StartInfo.UseShellExecute = false;
				p.StartInfo.RedirectStandardError = true;
				p.StartInfo.RedirectStandardInput = true;
				p.StartInfo.RedirectStandardOutput = true;
				p.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
				p.Start();
				p.WaitForExit();
			}
			catch
			{
				MessageBox.Show("Error");
			}

			StreamReader IPR = new StreamReader(IndexIP+".info");
			string OpenIPText = IPR.ReadToEnd();
			IPR.Close();
			string IPDisplay = "";
			
			if (SCO != 2)
			{
				int aa1 = OpenIPText.IndexOf("Interesting");
				if (aa1 == -1)
				{
					IPDisplay += "No Interest Port found on this host";
				}
				else
				{
					int aa2 = OpenIPText.IndexOf("#",aa1);		
					IPDisplay += OpenIPText.Substring(aa1,aa2-aa1);
					aa1 = OpenIPText.LastIndexOf("complete");
					IPDisplay += "# "+OpenIPText.Substring(aa1);
				}
			}
			else
			{		
				int aa1 = OpenIPText.IndexOf("SERVICE");
				int aa2 = 0;
				int tj1=0,tj2=0;
				StreamReader TJN= new StreamReader("TrojanN.info");
				string TJNText = TJN.ReadToEnd();
				TJN.Close();

				if (aa1!=-1)
				{
					IPDisplay += "Trojan port found on this host :";
					while (true)
					{
						aa1 = OpenIPText.IndexOf("\r\n",aa1);
						if (OpenIPText.Substring(aa1+4,1)=="#")
							break;
						aa2 = OpenIPText.IndexOf(" ",aa1);
						string aas1 = OpenIPText.Substring(aa1,aa2-aa1);
						tj1 = TJNText.IndexOf(aas1);
						if (tj1!=-1)
						{
							tj1 = TJNText.IndexOf(" ",tj1)+1;
							tj2 = TJNText.IndexOf("\r\n",tj1);
							string tjN = TJNText.Substring(tj1,tj2-tj1);
							IPDisplay += aas1+" : "+tjN;
						}
						aa1++;
					}
				}
				else
				{
					IPDisplay += "No Interest Port found on this host";
				}
			}

			StreamWriter IPW = new StreamWriter(IndexIP+".info",false);
			IPW.Write (IPDisplay);
			IPW.Flush();
			IPW.Close();


		}

		
		public void ReferencePointScan(string Reference_Point)
		{
			string Arg = "-sT "+Reference_Point + " -p 80 -oN RPSC.info -P0";
			Process p=null;
			try
			{
				p= new Process();
				p.StartInfo.FileName = "nmap";
				p.StartInfo.Arguments = Arg;
				p.StartInfo.CreateNoWindow = true;
				p.StartInfo.UseShellExecute = false;
				p.StartInfo.RedirectStandardError = true;
				p.StartInfo.RedirectStandardInput = true;
				p.StartInfo.RedirectStandardOutput = true;
				p.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
				p.Start();
				p.WaitForExit();
				StreamReader RPT = new StreamReader("RPSC.info");
				string RPT_Text = RPT.ReadToEnd();
				RPT.Close();
				if (RPT_Text.IndexOf("0 IP addresses (0 hosts up)")!=-1)
					RPValid = false;
			}
			catch
			{
				//MessageBox.Show("Error");
				//0 IP addresses (0 hosts up)
				RPValid = false;
			}
		}
	
	
	}
	}

