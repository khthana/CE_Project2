using System;
using System.Collections.Generic;
using System.Text;

namespace W
{
    interface INetwork
    {
        void Initialize(B board);
        void UnInitialize();
        void Send(Frame frame);
    }
}
