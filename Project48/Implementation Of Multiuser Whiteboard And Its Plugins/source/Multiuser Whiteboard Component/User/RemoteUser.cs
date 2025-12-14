using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
namespace W
{
    class RemoteUser : User
    {
        private bool send;
        private bool receive;
        public RemoteUser(string name, IPEndPoint ipep,DateTime con, bool send, bool receive)
        {
            this.name = name;
            this.ipEndPoint = ipep;
            this.send = send;
            this.receive = receive;
            this.connectionTime = con;
        }
        public bool Send
        {
            set
            {
                send = value;
            }
            get
            {
                return send;
            }
        }
        public bool Receive
        {
            set
            {
                receive = value;
            }
            get
            {
                return receive;
            }
        }
    }
}
