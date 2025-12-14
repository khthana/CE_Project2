using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class allPath
    {
        public linePath pathLine;
        public allPath nextAllPath;
        public argvs argument;
    }
    class linePath
    {
        public Node toNode;
        public linePath next;
        public bool conValue;
    }

}
