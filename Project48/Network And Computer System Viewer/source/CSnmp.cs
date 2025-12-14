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
//using Org.Snmp.Snmp_pp;

namespace Org.Snmp.Snmp_pp
{
	/// <summary>
	/// 
	/// </summary>
	public class Snmpi
	{
		//private string ip;
		private string community;
		private Snmp snmp;
		private SnmpVersion version;
		private UdpAddress udpip;
		private CTarget target;
		private Oid startOid;
		private Oid PacketOid;
		private Oid ByteOid;
		private Oid PortOid;
		private Vb vb;
		private Pdu pdu;
		private string eos;
		private string result;
		public string [,] ifNo;
		public int sizeof_ifNo;
		public long TotalPacket;
		public long TotalByte;

		public Snmpi(string arg_ip,string arg_community,string arg_oid)
		{
			eos = "\r\n";
			result = null;
			SnmpTarget.DefaultTimeout = 10000;
			SnmpTarget.DefaultRetries = 2;
			snmp = new Snmp(true);
			version = SnmpVersion.SNMPv1;
			udpip = new UdpAddress(arg_ip);
			community = arg_community;
			target = new CTarget(udpip, version, community, community);
			startOid = new Oid(arg_oid);
			vb = new Vb(startOid);
		}
		

		public void set_oid(string arg_oid)
		{
			startOid = new Oid(arg_oid);
		}

	
		public string getNext(string arg_oid)
		{
			startOid = new Oid(arg_oid);
			vb = new Vb(startOid);
			Pdu pdu = new Pdu(PduType.GetNext, vb);
			long count = 0;
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);
						
				vb = resp[0];
				Oid oid = vb.Oid;
				SnmpSyntax val;

						
				if (!oid.StartsWith(startOid))
					break;

				val = vb.Value;
				result += ":" + val;
				pdu = pdu.Clone(vb);

				count++;

			}// End While
			return result;
		}

	
		public string getEach(string arg_Oid)
		{
			startOid = new Oid(arg_Oid);
			vb = new Vb(startOid);
			bool valid = true;
			Pdu pdu = new Pdu(PduType.Get, vb);

			Pdu resp = snmp.Invoke(pdu, target);
						
			vb = resp[0];
			Oid oid = vb.Oid;
			SnmpSyntax val;

			val = vb.Value;
			//result += " : " + val + " | " +eos;
			string tmp = "";
			tmp += val;

			pdu = pdu.Clone(vb);

			return tmp;

		}
	

		public string getPortDescription()
		{
			PortOid = new Oid(".1.3.6.1.2.1.16.1.1.1.2");
			Vb Portvb = new Vb(PortOid);
			Pdu pdu = new Pdu(PduType.GetNext, Portvb);
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);
						
				Portvb = resp[0];
				Oid oid = Portvb.Oid;
				SnmpSyntax val;
				
				if (!oid.StartsWith(PortOid))
				{
					break;
				}

				val = Portvb.Value;
				result += val+"="+oid.ToString()+":";

				pdu = pdu.Clone(Portvb);
			}// End While
			return result;
		}

	
		public void getTotalPacket()
		{
			PacketOid = new Oid(".1.3.6.1.2.1.16.1.1.1.5");
			Vb Packetvb = new Vb(PacketOid);
			Pdu pdu = new Pdu(PduType.GetNext, Packetvb);
			long count = 0;
			long tmpTotal = 0;
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);
						
				Packetvb = resp[0];
				Oid oid = Packetvb.Oid;
				SnmpSyntax val;
				
				if (!oid.StartsWith(PacketOid))
				{
					if(count == 0)
						val = Packetvb.Value;
					break;
				}

				val = Packetvb.Value;
				string temp = "" ;
				temp += val;
				tmpTotal += Int64.Parse(temp);
				pdu = pdu.Clone(Packetvb);
				count++;
			}// End While
			TotalPacket = tmpTotal;
		}


		public void getTotalByte()
		{
			ByteOid = new Oid(".1.3.6.1.2.1.16.1.1.1.4");
			Vb Bytevb = new Vb(ByteOid);
			Pdu pdu = new Pdu(PduType.GetNext, Bytevb);
			long count = 0;
			long tmpTotal = 0;
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);
						
				Bytevb = resp[0];
				Oid oid = Bytevb.Oid;
				SnmpSyntax val;
				
				if (!oid.StartsWith(ByteOid))
				{
					if(count == 0)
						val = Bytevb.Value;
					break;
				}

				val = Bytevb.Value;
				string temp = "" ;
				temp += val;
				tmpTotal += Int64.Parse(temp);
				pdu = pdu.Clone(Bytevb);
				count++;
			}// End While
			TotalByte = tmpTotal;
		}


		public string getResult()
		{
			return result;
		}



	}
}
