using System;

namespace WindowsApplication2
{
	/// <summary>
	/// 
	/// </summary>
	public class Snmpi
	{
		private string ip;
		private string community;
		private Snmp snmp;
		private SnmpVersion version;
		private UdpAddress udpip;
		private CTarget target;
		private Oid startOid;
		private Vb vb;
		private Pdu pdu;
		private string eos;
		private string result;
		public string [,] ifNo;
		public int sizeof_ifNo;

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
		public bool getNext()
		{
			bool valid = true;
			Pdu pdu = new Pdu(PduType.GetNext, vb);
			long count = 0;
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);
						
				vb = resp[0];
				Oid oid = vb.Oid;
				SnmpSyntax val;

						
				if (!oid.StartsWith(startOid))
				{
					if(count == 0)
					{
						val = vb.Value;
						result += "error : ";
						result += oid.ToString() + " : " + val + eos;
						valid = false;
					}
					break;
				}

				val = vb.Value;
				result += oid.ToString() + " : " + val + eos;
				pdu = pdu.Clone(vb);

				count++;

			}// End While
			return valid;
		}
		public string gett()
		{
			vb = new Vb(startOid);
			Pdu pdu = new Pdu(PduType.Get, vb);
			Pdu resp = snmp.Invoke(pdu, target);
			vb = resp[0];
			Oid oid = vb.Oid;
			SnmpSyntax val = vb.Value;
			result += oid.ToString() + " : " + val + eos;
			pdu = pdu.Clone(vb);
			string values = "";
			values += val;
			return values;
		}
		public string getResult()
		{
			return result;
		}
		public void checkIfEtherUp()
		{
			string[,] ifUp;
			startOid = new Oid("1.3.6.1.2.1.2.2.1.8"); // ifOperStatus
			vb = new Vb(startOid);
			Pdu pdu = new Pdu(PduType.GetNext, vb);
			//long countwhile = 0;
			int countif = 0;
			int countether = 0;
			string str_val;
			int sizeof_ifUp;

			// variable for substring function ////////
			string buffer,buffer2;
			int index;
			///////////////////////////////////////////

			#region count ifIndex(Up) to find size of array
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);	
				vb = resp[0];
				Oid oid = vb.Oid;
				SnmpSyntax val;
		
				if (!oid.StartsWith(startOid))
				{
					break;
				}

				val = vb.Value;
				str_val = " "+val;

				if(str_val == " 1")
				{
					countif++;
					buffer = oid.ToString();
					index = buffer.LastIndexOf(".");
					buffer2 = buffer.Substring(index);
					result += "@" + buffer2;
				}

				pdu = pdu.Clone(vb);

			}// End While
			#endregion count ifIndex(Up) to find size of array

			#region put ifIndex to array
			result += "@";
			ifUp = new string[countif,2];
			sizeof_ifUp = countif;
			int ptr,ptr2;
			index = 0;
			for(int i=0;i<countif;i++)
			{
				ptr = result.IndexOf("@",index);
				ptr2 = result.IndexOf("@",ptr+1);
				index = ptr+1;
				buffer = result.Substring(index,ptr2-index);
				ifUp[i,0] = buffer;
			}
			#endregion put ifIndex to array

			#region etherStatsTable intersect with ifUp
			startOid = new Oid("1.3.6.1.2.1.16.1.1.1.2"); //etherdatasource
			vb = new Vb(startOid);
			pdu = new Pdu(PduType.GetNext, vb);
			while(true)
			{	
				Pdu resp = snmp.Invoke(pdu, target);	
				vb = resp[0];
				Oid oid = vb.Oid;
				SnmpSyntax val;
		
				if (!oid.StartsWith(startOid))
				{
					break;
				}

				val = vb.Value;
				string retVal_str = ""+val;
				string oid_str = oid.ToString();
				index = retVal_str.LastIndexOf(".");
				string retVal_cutted = retVal_str.Substring(index);
				index = oid_str.LastIndexOf(".");
				string etherIndex = oid_str.Substring(index);
				for(int i=0;i<sizeof_ifUp;i++)
				{
					if(ifUp[i,0] == retVal_cutted)
					{
						ifUp[i,1] = etherIndex;
						countether++;
						break;
					}
				}

				pdu = pdu.Clone(vb);

			}// End While
			int min_value;
			if(countether <= sizeof_ifUp)
			{
				min_value = countether;
			}
			else
			{
				min_value = sizeof_ifUp;
			}
			int sizeof_ifetherUp = min_value;
			string[,] ifetherUp = new string[sizeof_ifetherUp,2];
			int ptr_j = 0;
			for(int i=0;i<min_value;i++)
			{
				for(int j=ptr_j;j<sizeof_ifUp;j++)
				{
					if(ifUp[j,1] != null)
					{
						ifetherUp[i,0] = ifUp[j,0];
						ifetherUp[i,1] = ifUp[j,1];
						ptr_j = j+1;
						break;
					}
				}
			}
			#endregion etherStatsTable intersect with ifUp

			#region cut null index at tail of array(if it has)
			sizeof_ifNo = sizeof_ifetherUp;
			for(int i=0;i<sizeof_ifetherUp;i++)
			{
				if(ifetherUp[i,0] == null)
				{
					sizeof_ifNo = i;
					break;
				}
			}
			ifNo = new string[sizeof_ifNo,2];
			for(int i=0;i<sizeof_ifNo;i++)
			{
				ifNo[i,0] = ifetherUp[i,0];
				ifNo[i,1] = ifetherUp[i,1];
			}
		#endregion cut null index at tail of array(if it has)

		//return ifNo;
		}
		public string collect(string [,] ifNo,int sizeof_ifNo)
		{
			string initial = "1.3.6.1.2.1.2.2.1.";
			string ifInOctets = initial + "10";
			string ifInUcastPkts = initial + "11";
			string ifInNUcastPkts = initial + "12";
			string ifInDiscards = initial + "13";
			string ifOutOctets = initial + "16";
			string ifOutUcastPkts = initial + "17";
			string ifOutNUcastPkts = initial + "18";
			string ifOutDiscards = initial + "19";
			string initial2 = "1.3.6.1.2.1.16.1.1.1.";
			string octets64 = initial2 + "14";
			string octets65_127 = initial2 + "15";
			string octets128_255 = initial2 + "16";
			string octets256_511 = initial2 + "17";
			string octets512_1023 = initial2 + "18";
			string octets1024_1518 = initial2 + "19";



			//string [] temp_fr_get = new string[14]; // 14 is number of total parameter
			string recv_data = "";
			for(int i=0;i<sizeof_ifNo;i++)
			{
				recv_data += "$" + ifNo[i,0].Substring(1);
				set_oid(ifInOctets+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifInUcastPkts+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifInNUcastPkts+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifInDiscards+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifOutOctets+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifOutUcastPkts+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifOutNUcastPkts+ifNo[i,0]);
				recv_data += "%" + gett();
				set_oid(ifOutDiscards+ifNo[i,0]);
				recv_data += "%" + gett();
				string eds = ""; // Etherne Data Source
				for(int z=0;i<sizeof_ifNo;i++)
				{
					if(ifNo[z,0] == ifNo[z,0])
					{
						eds = ifNo[z,1];
						break;
					}
				}
				set_oid(octets64+eds);
				recv_data += "%" + gett();
				set_oid(octets65_127+eds);
				recv_data += "%" + gett();
				set_oid(octets128_255+eds);
				recv_data += "%" + gett();
				set_oid(octets256_511+eds);
				recv_data += "%" + gett();
				set_oid(octets512_1023+eds);
				recv_data += "%" + gett();
				set_oid(octets1024_1518+eds);
				recv_data += "%" + gett();
			}
			return recv_data+"$";
		}// end collect
	}
}
