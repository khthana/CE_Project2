using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;
namespace W
{
    public class HostUser : User
    {
        public HostUser(string name,System.Net.IPEndPoint ipep,DateTime con)
        {
            this.name = name;
            this.ipEndPoint = ipep;
            this.connectionTime = con;
        }
    }
}
