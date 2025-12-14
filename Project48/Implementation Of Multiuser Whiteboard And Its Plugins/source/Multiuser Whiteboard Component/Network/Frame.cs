using System;
using System.Collections.Generic;
using System.Text;

namespace W
{
    public class Frame
    {
        public byte[] data;
        public string[] para;
        public FTYPE type;
        public CMD cmd;
        public int paraSize;
        public Frame()
        {
            paraSize = 0;
            data = null;
            para = null;
        }
    }
}
