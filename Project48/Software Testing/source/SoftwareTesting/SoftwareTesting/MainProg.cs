using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class MainProg
    {
        public int Start;
        public int Stop;
        public int stLine; 
        public string mainType;
        public string arg;
    }

    class argv : MainProg
    {
        public string Argument;
        public argv Next;
    }
}
