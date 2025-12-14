using System;
using System.Collections.Generic;
using System.Text;
using System.Net;

namespace W
{
    public class Setting
    {
        IPEndPoint ipEndPoint;
        public IPEndPoint IPEP
        {
            set
            {
            }
            get
            {
                return ipEndPoint;
            }
        }
        IPAddress multicastIP;
        public IPAddress MulticastIP
        {
            set
            {
            }
            get
            {
                return multicastIP;
            }
        }
        int multicastPort;
        public int MulticastPort
        {
            set
            {
            }
            get
            {
                return multicastPort;
            }
        }
        int ttl;
        public int TTL
        {
            set
            {
            }
            get
            {
                return ttl;
            }
        }
        public Setting()
        {
            ttl = 32;
            multicastPort = 3242;
            multicastIP = IPAddress.Parse("224.100.0.1");
            
            IPHostEntry ipEntry = Dns.GetHostEntry(Dns.GetHostName());
            IPAddress[] ipAddr = ipEntry.AddressList;
            if (ipAddr.Length != 0)
            {
                ipEndPoint = new IPEndPoint(ipAddr[0], multicastPort);
            }
        }
    }
}
