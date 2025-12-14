using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class StringNode
    {
        public string name;
    }

    class statement : StringNode
    {
        public statement(string a)
        {
            this.name = a;
        }
        public link firstLink;
    }

    class condition : StringNode
    {
        public condition(string a)
        {
            this.name = a;
        }
        public link firstLink;
    }
    class state : StringNode
    {
        public state(string a)
        {
            this.name = a;
        }
        public link firstLink;
    }
    class var : StringNode
    {
        public var(string a)
        {
            this.name = a;
        }
        public link firstLink;
    }
    class StringExp : StringNode
    {
        public StringExp(string a)
        {
            this.name = a;
        }
    }

    class link : StringNode
    {
        public StringNode linkTo;
        public link nextLink;

    }

    class cmpExp : StringNode
    {
        public cmpExp(string a)
        {
            this.name = a;
        }
    }
    class MathExp : StringNode
    {
        public MathExp(string a)
        {
            this.name = a;
        }
    }

}
