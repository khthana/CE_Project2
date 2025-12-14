using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Collections;

namespace SoftwareTesting
{
    public partial class Form1
    {
        private string showArgument(argvs a)
        {
            string t = "";

            while (a != null)
            {
                t = t + "Argument name: " + a.Argument + " max- " + a.maxrange + " min- " + a.minrange + "\n";
                a = a.NextA;
            }
            return t;
        }

        private Classlist getClass(string s, Classlist cls)
        {
            if (cls.name == s)
            {
                return cls;
            }
            else if (cls.next != null)
            {
                return getClass(s, cls.next);
            }
            else
            {
                return null;
            }
        }

        private bool findClass(Classlist first, int li, int start, int stop, string code)
        {
            int line = li;
            int count = start;
            bool Error = false;
            Stack q = new Stack();
            Classlist cls = first;

            while (count <= stop)
            {
                if (code[count] == '{')
                {
                    q.Push('{');
                    if (q.Count == 1)
                    {
                        cls.next = new Classlist();
                        cls = cls.next;
                        cls.stLine = line;
                        cls.Start = count;
                    }
                }
                if (code[count] == '}')
                {
                    if (q.Count > 0)
                    {
                        q.Pop();
                        if (q.Count == 0)
                        {
                            cls.Stop = count;
                        }
                    }
                    else
                    {
                        Error = true;
                    }
                }

                line = checknewline(count, line);
                count++;
            }
            //------------- หา error --------------------
            if (q.Count != 0 || Error)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private MainProg findMain(int st, int en, int li)
        {
            int count = st - 1;
            int line = li;
            bool find = false;
            MainProg main = new MainProg();

            while (!find)
            {
                count++;
                line = checknewline(count, line);
                if (count + 3 < en)
                {
                    if (gatherChar(count, 4, FileBuffer) == "main")
                    {
                        int c = count - 1;
                        main = new MainProg();
                        string arg = "";

                        if (c > 0)
                        {
                            //----------- หา type ของ main ------------------
                            while ((FileBuffer[c] == ' ')
                                || (FileBuffer[c] == '\t')
                                && (FileBuffer[c] != '\n')
                                && (c > 0))
                            {
                                c--;
                            }

                            if (FileBuffer[c] == '\n' || c == 0)
                            {
                                main.mainType = "none";
                            }
                            else
                            {
                                int d = 0;
                                while (FileBuffer[c] != ' ' && c > 0)
                                {
                                    d++;
                                    c--;
                                }
                                c++;
                                string type = gatherChar(c, d, FileBuffer);
                                main.mainType = type;
                            }
                        }
                        else
                        {
                            main.mainType = "none";
                        }
                        //----------- ดู parameter ---------------------
                        count = count + 4;// 4 คือ ขนาดของคำว่า main
                        while (FileBuffer[count] != '(')
                        {
                            line = checknewline(count, line);
                            count++;
                        }

                        Stack m = new Stack();
                        m.Push('(');

                        count++;
                        while (m.Count != 0)
                        {
                            if (FileBuffer[count] == '(')
                            {
                                m.Push('(');
                            }
                            else if (FileBuffer[count] == ')')
                            {
                                m.Pop();
                            }
                            if (m.Count != 0)
                            {
                                arg = arg + FileBuffer[count];
                            }
                            line = checknewline(count, line);
                            count++;
                        }

                        //----- เก็บ paramreter -----------------------
                        getArg(arg);
                        find = true;
                    }
                }
                //------- ไม่พบ mian ----------------------------
                else
                {
                    find = true;
                }
            }

            //-------------หาเริ่ม และ หยุด -----------------------
            while (FileBuffer[count] != '{' && count < en)
            {
                line = checknewline(count, line);
                count++;
            }
            main.Start = count;
            main.stLine = line;

            Stack mn = new Stack();
            mn.Push('{');

            while (mn.Count != 0)
            {
                count++;
                if (FileBuffer[count] == '{')
                {
                    mn.Push('{');
                }
                if (FileBuffer[count] == '}')
                {
                    mn.Pop();
                }
            }
            main.Stop = count;

            return main;
        }

        private bool makeClass(Classlist a, string code)
        {
            bool Error = true;

            while (a != null)
            {
                int c;
                c = a.Start - 1;

                //---------- หา argument -----------------
                while (code[c] != ')')
                {
                    c--;
                }

                int m1 = c - 1;
                Stack q = new Stack();
                q.Push(')');

                while (q.Count != 0)
                {
                    c--;
                    if (code[c] == ')')
                    {
                        q.Push(')');
                    }
                    if (code[c] == '(')
                    {
                        q.Pop();
                    }
                }
                int m2 = c + 1;
                a.arg = gatherChar(m2, m1 - m2 + 1, code);
                c--;

                //--------- หา name ---------------------

                while (code[c] == ' ' || code[c] == '\t')
                {
                    c--;
                }

                m1 = c;

                Error = false;
                while (code[c] != ' ' && code[c] != '\n' && code[c] != '\t' && !Error)
                {
                    if (c > 0)
                    {
                        c--;
                    }
                    else
                    {
                        Error = true;
                    }
                }

                m2 = c + 1;
                a.name = gatherChar(m2, m1 - m2 + 1, code);
                c--;

                //----------หา type---------------------------
                while (code[c] == ' ' || code[c] == '\t')
                {
                    c--;
                }

                m1 = c;

                Error = false;
                while (code[c] != ' ' && code[c] != '\n' && code[c] != '\t' && !Error)
                {
                    if (c > 0)
                    {
                        c--;
                    }
                    else
                    {
                        Error = true;
                    }
                }

                m2 = c + 1;
                a.procType = gatherChar(m2, m1 - m2 + 1, code);

                a.firstA = getArgvDefine();

                a = a.next;
            }
            return !Error;
        }

        private argvs getArgvDefine()
        {
            Classlist f = new Classlist();
            argvs mainArg = new argvs();
            f.firstA = mainArg;

            int c = 0;
            string m = "/*a";
            string n = "a*/";
            string t = ""+FileBuffer[c]+FileBuffer[c+1]+FileBuffer[c+2];

            while (m != t && c < FileBuffer.Length-2)
            {
                t = "" + FileBuffer[c] + FileBuffer[c + 1] + FileBuffer[c + 2];
                c++;
            }

            c = c+2;
            t = "" + FileBuffer[c] + FileBuffer[c + 1] + FileBuffer[c + 2];

            while (n != t && c < FileBuffer.Length - 2)
            {
                if (FileBuffer[c] == ' ')
                {
                    c++;
                    t = "" + FileBuffer[c] + FileBuffer[c + 1] + FileBuffer[c + 2];
                }
                else
                {
                    mainArg.NextA = new argvs();
                    mainArg = mainArg.NextA;

                    string aname = "";
                    while (FileBuffer[c] != ':')
                    {
                        aname = aname + FileBuffer[c];
                        c++;
                    }

                    mainArg.Argument = aname;

                    c++;
                    string atype = "";
                    while (FileBuffer[c] != ' ')
                    {
                        atype = atype + FileBuffer[c];
                        c++;
                    }

                    mainArg.type = atype;

                    t = "" + FileBuffer[c] + FileBuffer[c + 1] + FileBuffer[c + 2];

                }
            }

            return f.firstA.NextA;
        }

        private argvs getArgNode(string a)
        {
            argvs first = new argvs();
            argvs x = first;
            int l = a.Length;

            if (a == "void")
            {
                x.Argument = a;
            }
            else
            {
                string b = "";
                bool type = true;

                for (int i = 0; i < l; i++)
                {
                    if (a[i] == ' ')
                    {
                        if (type == true)
                        {
                            x.type = b;
                            b = "";

                            if (x.type == "int")
                            {
                                x.maxrange = int.MaxValue.ToString();
                                x.minrange = int.MinValue.ToString();
                            }
                            else if (x.type == "float")
                            {
                                x.maxrange = float.MaxValue.ToString();
                                x.minrange = float.MinValue.ToString();
                            }
                            else if (x.type == "double")
                            {
                                x.maxrange = double.MaxValue.ToString();
                                x.minrange = double.MinValue.ToString();
                            }
                            else if (x.type == "long")
                            {
                                x.maxrange = long.MaxValue.ToString();
                                x.minrange = long.MinValue.ToString();
                            }

                            type = false;
                        }
                    }
                    else if (a[i] == ',')
                    {
                        x.Argument = b;
                        x.NextA = new argvs();
                        x = x.NextA;

                        b = "";
                        type = true;
                    }
                    else
                    {
                        b = b + a[i];
                    }
                }
                //node สุดท้าย
                x.Argument = b;

            }
            return first;
        }

    }
}
