using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class Node
    {
        public char NodeType;
        public int start;
        public int end;
        public Node nextNode;
        public int line;
    }

    class stateNode : Node
    {
        public stateNode(string exp,int st,int ed, int li)
        {
            this.NodeType = 's';            
            this.start = st;
            this.end = ed;
            this.Expession = exp;
            this.line = li;
        }

        public string Expession;
    }

    class ifNode : Node
    {
        public ifNode(string exp, int st, int ed,int si, int ei,int se, int ee, int li ,int ili, int eli ,int sli)
        {
            this.NodeType = 'i';
            this.Expession = exp;
            this.start = st;
            this.end = ed;
            this.stif = si;
            this.edif = ei;
            this.stelse = se;
            this.edelse = ee;
            this.line = li;
            this.ifline = ili;
            this.elseline = eli;
            this.stopline = sli;
        }

        public Node Inif;
        public Node Inelse;
        public int stif;
        public int edif;
        public int stelse;
        public int edelse;
        public string Expession;
        public int ifline;
        public int elseline;
        public int stopline;
    }

    class forNode : Node
    {
        public forNode(string exp, int st, int ed,int sf,int ef,int li, int fli, int sli)
        {
            this.NodeType = 'f';
            this.Expession = exp;
            this.start = st;
            this.end = ed;
            this.stfor = sf;
            this.edfor = ef;
            this.forline = fli;
            this.stopline = sli;
            this.line = li;
        }

        public Node Infor;
        public string Expession;
        public int stfor;
        public int edfor;
        public bool ture;
        public int forline;
        public int stopline;
    }

    class whileNode : Node 
    {
        public whileNode(string exp, int st, int ed, int sw, int ew, int li, int wli, int fli)
        {
            this.NodeType = 'w';
            this.Expession = exp;
            this.start = st;
            this.end = ed;
            this.stwh = sw;
            this.edwh = ew;
            this.line = li;
            this.whileline = wli;
            this.stopline = fli;
        }

        public Node Inwhile;
        public string Expession;
        public int stwh;
        public int edwh;
        public bool ture;
        public int whileline;
        public int stopline;
    }

    class EndofFile : Node
    {
        public EndofFile()
        {
            this.NodeType = 'e';
        }
    }

    class nullNode : Node
    {
        public nullNode()
        {
            this.NodeType = 'n';
        }
        public char from;
    }

}
