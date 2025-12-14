using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class CheckStatement
    {
        public statements getStatement(string state)
        {
            statements s = new statements(state);
            s.firstlink = new links();
            links l = s.firstlink;

            l.linksTo = getDeclare(state);
            if (l.linksTo == null)
            {
                l.linksTo = getFunction(state);
                if (l.linksTo == null)
                {
                    l.linksTo = getEquration(state);
                }
                else
                {
                    s = null;
                }
            }
            return s;
        }
        public Declare getDeclare(string state)
        {
            Declare d = new Declare(state);
            d.firstlink = new links();
            links l = d.firstlink;

            bool err = false;

            string typedeclare = "";
            string t = "";
            int len = state.Length;
            int c = 0;
            int cc = 0;
            string cut = " ";

            bool[] check = new bool[5];
            check[0] = false;
            check[1] = false;
            check[2] = false;
            check[3] = false;

            while (c <= len)
            {
                cc++;
                if (c < len)
                {
                    t = "" + state[c];
                }
                else
                {
                    t = "";
                }
                if (t != cut && c < state.Length)
                {
                    if ( state[c] == ',' )
                    {
                        check[3] = true;
                    }
                    typedeclare = typedeclare + state[c];
                }


                else
                {
                    if (check[0] == false && check[1] == false && check[2] == false && check[3] == false )
                    {
                        if (typedeclare == "static" || typedeclare == "struct" || typedeclare == "const")
                        {
                            l.linksTo = getFtype(typedeclare);
                            if (l.linksTo != null)
                            {
                                l.nextsLink = new links();
                                l = l.nextsLink;
                                check[0] = true;
                                typedeclare = "";
                            }
                            else
                            {
                                l.linksTo = getStype(typedeclare);
                                if (l.linksTo != null)
                                {
                                    l.nextsLink = new links();
                                    l = l.nextsLink;
                                    check[0] = true;
                                    check[1] = true;
                                }
                                else
                                {
                                    check[0] = true;
                                    check[1] = true;
                                    err = true;
                                }
                            }
                        }
                        else
                        {
                            check[0] = true;
                            c = c-cc;
                            typedeclare = "";
                        }
                        
                    }
                    else if (check[0] == true && check[1] == false && check[2] == false && check[3] == false)
                    {
                        if (typedeclare == "int" || typedeclare == "long" || typedeclare == "string" || typedeclare == "double" || typedeclare == "float")
                        {
                            l.linksTo = getStype(typedeclare);
                            if (l.linksTo != null)
                            {
                                l.nextsLink = new links();
                                l = l.nextsLink;
                                check[0] = true;
                                check[1] = true;
                            }
                            else
                            {
                                check[0] = true;
                                check[1] = true;
                                err = true;
                            }
                            typedeclare = "";

                            while (state[c] == ' ')
                            {
                                c++;

                            }
                            if (state[c] == '&' || state[c] == '*')
                            {
                                typedeclare = "" + state[c];
                                l.linksTo = getPointer(typedeclare);
                                l.nextsLink = new links();
                                l = l.nextsLink;
                                check[2] = true;
                            }
                            else
                            {
                                c--;
                            }
                            typedeclare = "";
                            check[2] = true;
                        }
                        else
                        {
                            err = true;
                        }
                    }

                    else if (check[0] == true && check[1] == true && check[2] == true && check[3] == false)
                    {
                        l.linksTo = getVariable(typedeclare);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typedeclare = "";
                    }
                    else if (check[0] == true && check[1] == true && check[2] == true && check[3] == true)
                    {
                        while (state[c] == ' ')
                        {
                            c++;
                        }
                        if (state[c] != ' ')
                        {
                            if (state[c] == '&' || state[c] == '*')
                            {
                                typedeclare = "" + state[c];
                                l.linksTo = getPointer(typedeclare);
                                l.nextsLink = new links();
                                l = l.nextsLink;
                                check[2] = true;
                            }
                            else 
                            {
                                c--;
                            }

                            typedeclare = "";
                            check[3] = false;
                        }
                    }

                }
                c++;

            }

            if (err)
            {
                d = null;
            }

            return d;
        }
        public Ftype getFtype(string a)
        {
            Ftype ft = new Ftype();
            if (a == "struct" || a == "static" || a == "const")
            {
                ft.name = a;
            }
            else
            {
                ft = null;
            }

            return ft;

        }
        public Stype getStype(string a)
        {
            Stype st = new Stype(a);
           

            return st;

        }
        public Pointer getPointer(string a)
        {
            Pointer p = new Pointer(a);
            if (a == "&" || a == "*")
            {
                p.name = a;
            }
            else
            {
                p = null;
            }

            return p;

        }
        public Variable getVariable(string a)
        {
            Variable v = new Variable(a);
            v.name = a;

            return v;
        
        }
        public Function getFunction(string state)
        {
            Function func = new Function(state);
            func.firstlink = new links();
            links l = func.firstlink;

            bool ferr = false;

            string typefunction = "";
            string t = "";
            int len = state.Length;
            int c = 0;
            int cc = 0;
            string cut = " ";

            bool[] check = new bool[5];
            check[0] = false;
            check[1] = false;
            check[2] = false;
            check[3] = false;

            while (c <= len)
            {
                cc++;
                if (c < len)
                {
                    t = "" + state[c];
                }
                else
                {
                    t = "";
                }
                if (t == cut)
                {
                  //  typefunction = typefunction;
                }
             
                else if (t != cut && c < state.Length && check[0] == false && check[1] == false)
                {
                    if (state[c] == '.')
                    {
                        l.linksTo = getFuncname(typefunction);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typefunction = "";
                        check[0] = true;
                        c++;
                    }
                    else if (state[c] == '=')
                    {
                        ferr = true;
                    }
                    else
                    {
                        ferr = true;
                    }

                    typefunction = typefunction + state[c];
                }
                else if (t != cut && c < state.Length && check[0] == true && check[1] == false)
                {
                    if (state[c] == '(')
                    {
                        l.linksTo = getFuncmember(typefunction);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typefunction = "";
                        check[0] = true;
                        check[1] = true;
                        ferr = false;
                        c++;
                    }
                    else if (state[c] == '=')
                    {
                        ferr = true;
                    }
                    else
                    {
                        ferr = true;
                    }
                    

                    typefunction = typefunction + state[c];
                }
                else if (t != cut && c < state.Length && check[0] == false && check[1] == false)
                {
                    if (state[c] == '(')
                    {
                        l.linksTo = getFuncname(typefunction);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typefunction = "";
                        check[0] = true;
                        check[1] = true;
                        ferr = false;
                        c++;
                    }
                    else if (state[c] == '=')
                    {
                        ferr = true;
                    }
                    else
                    {
                        ferr = true;

                    }
                    if (c < state.Length)
                    {
                        typefunction = typefunction + state[c];
                    }
                    else
                    {
                      //  typefunction = typefunction;
                    }
                }
                else if (check[0] == true && check[1] == true )
                {
                    if (state[c] == ')')
                    {
                        l.linksTo = getArgument(typefunction);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typefunction = "";
                        check[0] = true;
                        check[1] = true;

                        c++;
                    }
                    else if (state[c] == '=')
                    {
                        ferr = true;
                    }
                    if (c < state.Length)
                    {
                        typefunction = typefunction + state[c];
                    }
                    else
                    {
                      //  typefunction = typefunction;
                    }
                }

                 
                c++;
            }
            if (ferr)
            {
                func = null;
            }
            return func;
        }
       
    
        public Funcname getFuncname(string a)
        {
            Funcname Fname = new Funcname(a);


            return Fname;

        }
        public Funcmember getFuncmember(string a)
        {
            Funcmember Fmem = new Funcmember(a);


            return Fmem;

        }
        public Argument getArgument(string a)
        {
            Argument Fmem = new Argument(a);


            return Fmem;

        }
        public Equration getEquration(string state)
        {
            Equration eq = new Equration(state);
            eq.firstlink = new links();
            links l = eq.firstlink;

            bool Eqerr = false;

            string typeEquration = "";
            string t = "";
            int len = state.Length;
            int c = 0;
            int cc = 0;
            string cut = " ";

            bool[] check = new bool[6];
            check[0] = false;
            check[1] = false;
            check[2] = false;
            check[3] = false;
            check[4] = false;
            check[5] = false;

            while (c <= len)
            {
                cc++;
                if (c < len)
                {
                    t = "" + state[c];
                }
                else
                {
                    t = "";
                }
                if (c == len)
                {
                    l.linksTo = getVariable(typeEquration);
                }
                else if (t != cut && t != "=" && check[0] == false)
                {
                    typeEquration = typeEquration + state[c];
                }
                else if (t == cut && check[0] == false)
                {
                    l.linksTo = getVariable(typeEquration);
                    l.nextsLink = new links();
                    l = l.nextsLink;
                    typeEquration = "";
                    check[0] = true;
                }

                else if (t == "=" && state[c-1] != ' ' && check[0] == false)
                {
                    l.linksTo = getVariable(typeEquration);
                    l.nextsLink = new links();
                    l = l.nextsLink;
                    l.linksTo = getSame(t);
                    l.nextsLink = new links();
                    l = l.nextsLink;
                    typeEquration = "";
                    check[0] = true;
                    
                }
                else if (t == "=" && check[0] == true)
                {
                    l.linksTo = getSame(t);
                    l.nextsLink = new links();
                    l = l.nextsLink;
                    typeEquration = "";
                    check[1] = true;
                }
                else if (t == " " & check[0] == true && check[1] == true )
                {
                   // typeEquration = typeEquration;
                }
                

                else if (t != cut && check[0] == true && check[1] == true && check[2] == true)
                {
                    if (state[c] == '+')
                    {
                        //เก็บvar ก่อน เครื่องหมาย +
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                       
                    }
                    else if (state[c] == '-')
                    {
                        //เก็บvar ก่อน เครื่องหมาย -
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                      
                    }
                    else if (state[c] == '*')
                    {
                        //เก็บvar ก่อน เครื่องหมาย *
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                       
                    }
                    else if (state[c] == '/')
                    {
                        //เก็บvar ก่อน เครื่องหมาย /
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                       
                    }
                    else if (state[c] == '%')
                    {
                        //เก็บvar ก่อน เครื่องหมาย %
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                       
                    }
                    else
                    {
                        typeEquration = typeEquration + state[c];
                    }
                }
                
                else if (check[0] == true && check[1] == true && check[3] == true)
                {
                    if (state[c] == '+')
                    {
                        //เก็บvar ก่อน เครื่องหมาย +
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                    }
                    else if (state[c] == '-')
                    {
                        //เก็บvar ก่อน เครื่องหมาย -
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                    }
                    else if (state[c] == '*')
                    {
                        //เก็บvar ก่อน เครื่องหมาย *
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                    }
                    else if (state[c] == '/')
                    {
                        //เก็บvar ก่อน เครื่องหมาย /
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                    }
                    else if (state[c] == '%')
                    {
                        //เก็บvar ก่อน เครื่องหมาย %
                        l.linksTo = getVariable(typeEquration);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        //เก็บเครื่องหมาย
                        l.linksTo = getOper(t);
                        l.nextsLink = new links();
                        l = l.nextsLink;
                        typeEquration = "";
                        check[2] = false;
                        check[3] = false;
                    }
                    else if (t == cut)
                    {
                       // typeEquration = typeEquration;
                    }
                    else
                    {
                        typeEquration = typeEquration + state[c];
                    }
                }

                else if (t == "-" && check[0] == true && check[1] == true && check[2] == false &&check[3] ==false)
                {
                    typeEquration = typeEquration + state[c];
                    check[2] = true;
                }
                else if (t != "-" && check[0] == true && check[1] == true && check[2] == false && check[3] == false)
                
                {
                    typeEquration = typeEquration + state[c];
                    check[3] = true;
                }
                    
              
               
                c++;
            }
            if (Eqerr)
            {
                return null;
            }
             return eq;
        }
        public Same getSame(string a)
        {
            Same sa = new Same(a);


            return sa;

        }
        public Oper getOper(string a)
        {
            Oper op = new Oper(a);


            return op;

        }
        

    }
    
}
