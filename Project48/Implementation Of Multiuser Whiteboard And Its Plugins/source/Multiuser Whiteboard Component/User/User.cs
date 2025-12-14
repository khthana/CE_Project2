using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Globalization;

namespace W
{
    public abstract class User
    {
        protected string name;
        public string Name
        {
            set
            {
                name = value;
            }
            get
            {
                return name;
            }
        }
        protected IPEndPoint ipEndPoint;
        public IPEndPoint IPEndPoint
        {
            set 
            {
                ipEndPoint = value;
            }
            get
            {
                return ipEndPoint;
            }
        }
        protected DateTime connectionTime;
        public DateTime ConnectionTime
        {
            set
            {
                connectionTime = value;
            }
            get
            {
                return connectionTime;
            }
        } 
    }
}
