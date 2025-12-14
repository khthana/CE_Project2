using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class CheckString
    {
        public StringNode getString(string a)
        {
            statement s = new statement(a);
            s.firstLink = new link();
            link l = s.firstLink;

            string con = "";
            int len = a.Length;
            int c = 0;

            string and = "&&";
            string or = "||";

            while (c < len)
            {
                string t = "";
                if (c < len - 1)
                {
                    t = "" + a[c] + a[c + 1];
                }
                else
                {
                    t = "";
                }

                if (t != and && t != or)
                {
                    con = con + a[c];
                }
                else
                {
                    // con ที่เจอก่อนหน้า and or
                    l.linkTo = getCondition(con);
                    // and or
                    l.nextLink = new link();
                    l = l.nextLink;

                    if (t == and)
                    {
                        l.linkTo = new StringExp("&&");
                        c++;
                    }
                    else if (t == or)
                    {
                        l.linkTo = new StringExp("||");
                        c++;
                    }
                    // เตรียมรับ con ใหม่
                    con = "";
                    l.nextLink = new link();
                    l = l.nextLink;
                }
                c++;
            }
            l.linkTo = getCondition(con);

            return s;
        }

        public condition getCondition(string a)
        {
            condition con = new condition(a);
            con.firstLink = new link();
            link l = con.firstLink;

            string state = "";
            int len = a.Length;
            int c = 0;

//            string more = ">" ;
//            string less = "<" ;
            string moreor = ">=";
            string lessor = "<=";
            string equal = "==";
            string notequal = "!=";

            while (c < len)
            {
                string t = "";
                if (c < len - 1)
                {
                    t = "" + a[c] + a[c + 1];
                }
                else
                {
                    t = "";
                }

                if (t != moreor && t != lessor && t != equal && t != notequal && a[c] != '<' && a[c] != '>')
                {  
                    state = state + a[c];
                }
                else 
                {
                    if (t != moreor && t != lessor && t != notequal && t != equal)
                    {
                        if (a[c] == '>')
                        {
                            t = ">";
                        }
                        else 
                        {
                            t = "<";
                        }
                    }
                   
                    l.linkTo = getState(state);
                    
                    l.nextLink = new link();
                    l = l.nextLink;

                    l.linkTo = new cmpExp(t);
                    c = c + t.Length - 1;//ฟังชันก์เช็คความยาวcmpExp
                   
                    // เตรียมรับ con ใหม่
                    state = "";
                    l.nextLink = new link();
                    l = l.nextLink;
                }
                c++;
            }
            l.linkTo = getState(state);

            return con;
        }

        public state getState(string a)
        {
            state state = new state(a);
            state.firstLink = new link();
            link l = state.firstLink;

            string var = "";
            int len = a.Length;
            int c = 0;

           
            bool[] check = new bool[6];
            check[0] = false;
            check[1] = false;
            check[2] = false;
            check[3] = false;
            check[4] = false;
            check[5] = false;


            while (c < len)
            {
                string t = "";
                if (c < len - 1)
                {
                    t = "" + a[c];
                }
                else
                {
                    t = "";
                }
                if (t == " ")
                {
                  //  var = var;
                }
                else if (t == "-" && check[0] == false && check[1] == false)
                {
                    var = var + a[c];
                    check[0] = true;
                }
                else if (check[0] == true && check[1] == false)
                {
                    if (a[c] == '+')
                    {
                        //เก็บvar ก่อน เครื่องหมาย +
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else if (a[c] == '-')
                    {
                        //เก็บvar ก่อน เครื่องหมาย -
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;
                    }
                    else if (a[c] == '*')
                    {
                        //เก็บvar ก่อน เครื่องหมาย *
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else if (a[c] == '/')
                    {
                        //เก็บvar ก่อน เครื่องหมาย /
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else if (a[c] == '%')
                    {
                        //เก็บvar ก่อน เครื่องหมาย %
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else
                    {
                        var = var + a[c];
                    }
                   
                }
                else if (check[0] == false && check[1] == false)
                {
                    if (a[c] == '+')
                    {
                        //เก็บvar ก่อน เครื่องหมาย +
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else if (a[c] == '-')
                    {
                        //เก็บvar ก่อน เครื่องหมาย -
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;
                    }
                    else if (a[c] == '*')
                    {
                        //เก็บvar ก่อน เครื่องหมาย *
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else if (a[c] == '/')
                    {
                        //เก็บvar ก่อน เครื่องหมาย /
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else if (a[c] == '%')
                    {
                        //เก็บvar ก่อน เครื่องหมาย %
                        l.linkTo = getVar(var);
                        l.nextLink = new link();
                        l = l.nextLink;
                        //เก็บเครื่องหมาย
                        l.linkTo = getMathExp(t);
                        l.nextLink = new link();
                        l = l.nextLink;
                        var = "";
                        check[0] = false;
                        check[1] = false;

                    }
                    else
                    {
                        var = var + a[c];
                    }
                }
        
                c++;
                
                
            }
                l.linkTo = new var(var);
                l.linkTo = getVar(var);
                return state;
           
        }
        public var getVar(string a)
        {
            var variable = new var(a);

            return variable; 
        }
        public MathExp getMathExp(string a)
        {
            MathExp me = new MathExp(a);


            return me;

        }
     }
}
