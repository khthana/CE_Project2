using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    public class Classlist
    {
        public int Start;
        public int Stop;
        public int stLine;
        public string procType;
        public string arg;
        public string name;
        public Classlist next;
        public argvs firstA;
        public argvs specA;
    }
    public class argvs : Classlist
    {
        public argvs()
        {
            maxrange = "";
            minrange = "";
        }
        public string Argument;
        public string type;
        public string maxrange;
        public string minrange;
        public argvs NextA;
    }
}
