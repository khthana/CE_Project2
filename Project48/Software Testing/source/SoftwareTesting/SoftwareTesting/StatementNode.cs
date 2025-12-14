using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class StatementNode
    {
        public string name;
        public string type;
    }
    class links : StatementNode
    {
        public StatementNode linksTo;
        public links nextsLink;

    }
    class statements : StatementNode
    {
        public statements(string a)
        {
            this.name = a;
            this.type = "stat";
        }
        public links  firstlink;
    }
    class Declare : StatementNode
    {
        public  Declare(string a)
        {
            this.name = a;
            this.type = "decl";
           
        }
        public links firstlink;
    }
   
    class Ftype : StatementNode
    {
        public links firstlink;
    }
    class Stype : StatementNode
    {
        public  Stype(string a)
        {
           this.name = a;
           
        }
        public links firstlink;
    }
    class Pointer : StatementNode
    {
        public Pointer(string a)
        {
            this.name = a;

        }
        public links firstlink;
    }
    class Variable : StatementNode
    {
        public Variable(string a)
        {
            this.name = a;
            this.type = "var";
        }
        public links firstlink;
    }
    class Function : StatementNode
    {
        public Function(string a)
        {
            this.name = a;
            this.type = "func";
        }
        public links firstlink;
    }
    class Funcname : StatementNode
    {
        public Funcname(string a)
        {
            this.name = a;

        }
        public links firstlink;
    }
    class Funcmember : StatementNode
    {
        public Funcmember(string a)
        {
            this.name = a;

        }
        public links firstlink;
    }
    class Argument : StatementNode
    {
        public Argument(string a)
        {
            this.name = a;

        }
        public links firstlink;
    }
    class Equration : StatementNode
    {
        public Equration(string a)
        {
            this.name = a;
            this.type = "equa";
        }
        public links firstlink;
    }
    class Same : StatementNode
    {
        public Same(string a)
        {
            this.name = a;

        }
        public links firstlink;
    }
    class Oper : StatementNode
    {
        public Oper(string a)
        {
            this.name = a;

        }
        public links firstlink;
    }


}
