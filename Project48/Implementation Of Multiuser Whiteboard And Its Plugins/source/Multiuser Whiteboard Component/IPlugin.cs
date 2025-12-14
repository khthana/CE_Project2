using System;
using System.Collections.Generic;
using System.Text;

namespace W
{
    public interface IPlugin
    {
        void Load(B b);
        string Name{set;get;}
        void MessageEvent(byte[] b);
        void UnLoad();
    }
}
