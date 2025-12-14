using System;
using System.Collections.Generic;
using System.Text;

namespace SoftwareTesting
{
    class WhiteTest
    {
        public allPath aPath;
        public Classlist cls;

        public WhiteTest(Classlist c, allPath path)
        {
            aPath = path;
            cls = c;

            setFirstArg(c.firstA);
            //สร้าง 1 paht ต่อ 1 argument
            while (aPath != null)
            {
                aPath.argument =  copyArg(cls.firstA);

               // startTest(aPath.pathLine, aPath.argument);
                aPath = aPath.nextAllPath;
            }
        }

        private argvs copyArg(argvs a)
        {
            argvs s = new argvs();
            argvs cp = new argvs();

            s = cp;

            while (a != null)
            {
                cp.NextA = new argvs();
                cp = cp.NextA;

                cp.Argument = a.Argument;
                cp.type = a.type;
                cp.maxrange = a.maxrange;
                cp.minrange = a.minrange;

                a = a.NextA;
            }

            cp = null;

            return s.NextA;
        }

        private void setFirstArg(argvs a)
        {
            while (a != null)
            { 
                if (a.type == "int")
                {
                    a.maxrange = int.MaxValue.ToString();
                    a.minrange = int.MinValue.ToString();
                }
                else if (a.type == "float")
                {
                    a.maxrange = float.MaxValue.ToString();
                    a.minrange = float.MinValue.ToString();
                }
                else if (a.type == "double")
                {
                    a.maxrange = double.MaxValue.ToString();
                    a.minrange = double.MinValue.ToString();
                }
                else if (a.type == "long")
                {
                    a.maxrange = long.MaxValue.ToString();
                    a.minrange = long.MinValue.ToString();
                }

                a = a.NextA;
            }
        }

        public void startTest(linePath lPath, argvs arg)
        {
            Node n = lPath.toNode;
            if (n == null)
            {
                //....
            }
            else
            {
                if (n.NodeType == 's')
                {
                    stateNode sN = (stateNode)n;
                    CheckStatement ck = new CheckStatement();
                    statements stm = ck.getStatement(sN.Expession);

                    argvs a = arg;

                    while (a != null)
                    {
                        setArgRange(a, stm);
                        a = a.NextA;
                    }
                }
                else if (n.NodeType == 'i')
                {
                    ifNode iN = (ifNode)n;
                    CheckStatement ck = new CheckStatement();
                    statements st = ck.getStatement(iN.Expession);
                }
                else if (n.NodeType == 'w')
                {
                    whileNode wN = (whileNode)n;
                    CheckStatement ck = new CheckStatement();
                    statements st = ck.getStatement(wN.Expession);
                }
                else if (n.NodeType == 'f')
                {
                    forNode fN = (forNode)n;
                    CheckStatement ck = new CheckStatement();
                    statements st = ck.getStatement(fN.Expession);
                }

                if (lPath.next.toNode != null)
                {
                    startTest(lPath.next, arg);
                }
            }
        }

        private argvs getRage(string var)
        {

            argvs a = new argvs();
            a.type = "float";

            a.maxrange = float.MaxValue.ToString();
            a.minrange = float.MinValue.ToString();

            try
            {
                float num = float.Parse(var);
                a.maxrange = num.ToString();
                a.minrange = num.ToString();
            }
            catch (FormatException)
            {
                argvs ta = cls.firstA;

                while (ta != null)
                {
                    if (var == ta.Argument)
                    {
                        a.maxrange = ta.maxrange;
                        a.minrange = ta.minrange;
                        a.type = ta.type;
                    }
                    ta = ta.NextA;
                }

            }
            return a;
        }

        private void setArgRange(argvs a, statements s)
        {
            //ดูว่าเป็น statement 
            if (s != null)
            {
                if (s.type == "stat")
                {
                    //เป็นสมการ
                    if (s.firstlink.linksTo.type == "equa")
                    {
                        Equration eq = (Equration)s.firstlink.linksTo;
                        links index = new links();
                        index = eq.firstlink;

                        string nameA = a.Argument;
                        string nameT = "";

                        nameT = index.linksTo.name;

                        // อยู่ในรูป a = .....

                        if (nameT == nameA)
                        {
                            index = index.nextsLink.nextsLink;

                            argvs mVal = getRage(index.linksTo.name);

                            while (index.nextsLink != null)
                            {
                                string Op = index.nextsLink.linksTo.name;
                                index = index.nextsLink.nextsLink;
                                
                                argvs tVal = getRage(index.linksTo.name);
                                

                                mVal = getMaxMin(mVal, tVal, Op);
                            }
                            a.maxrange = mVal.maxrange;
                            a.minrange = mVal.minrange;
                        }
                        // ในรูป ... = ..a...
                        else
                        {


                        }
                    }
                }
            //เป็น if while
            //เป็น for
            }
           
        }

        private argvs getMaxMin(argvs a,argvs b,string Op)
        {
            argvs z = new argvs();

            if (a.maxrange != "none" && a.minrange != "none" && b.maxrange != "none" && b.minrange != "none")
            {
                if (a.type == "float" && b.type == "float")
                {
                    a.type = "float";
                    b.type = "float";

                    z.type = "float";
                    // +
                    if (Op == "+")
                    {
                        float temp;
                        if (a.maxrange == float.MaxValue.ToString() ||
                            b.maxrange == float.MaxValue.ToString())
                        {
                            z.maxrange = float.MaxValue.ToString();
                        }
                        else
                        {
                            temp = float.Parse(a.maxrange) + float.Parse(b.maxrange);
                            z.maxrange = temp.ToString();
                        }

                        if (a.minrange == float.MinValue.ToString() ||
                            b.minrange == float.MinValue.ToString())
                        {
                            z.minrange = float.MinValue.ToString();
                        }
                        else
                        {
                            temp = float.Parse(a.minrange) + float.Parse(b.minrange);
                            z.minrange = temp.ToString();
                        }
                    }
                    // -
                    else if (Op == "-")
                    {
                        float temp;
                        if (a.maxrange == float.MaxValue.ToString() ||
                            b.maxrange == float.MaxValue.ToString())
                        {
                            z.maxrange = float.MaxValue.ToString();
                        }
                        else
                        {
                            temp = float.Parse(a.maxrange) - float.Parse(b.minrange);
                            z.maxrange = temp.ToString();
                        }

                        if (a.minrange == float.MinValue.ToString() ||
                            b.minrange == float.MinValue.ToString())
                        {
                            z.minrange = float.MinValue.ToString();
                        }
                        else
                        {
                            temp = float.Parse(a.minrange) - float.Parse(b.maxrange);
                            z.minrange = temp.ToString();
                        }
                    }
                    // *
                    else if (Op == "*")
                    {
                        if (a.maxrange == float.MaxValue.ToString() &&
                            b.maxrange == float.MaxValue.ToString() &&
                            a.minrange == float.MinValue.ToString() &&
                            b.minrange == float.MinValue.ToString())
                        {
                            z.maxrange = float.MaxValue.ToString();
                            z.minrange = float.MinValue.ToString();
                        }
                        else
                        {
                            string max1 = "";
                            string max2 = "";
                            string min1 = "";
                            string min2 = "";
                            //set max
                            if (a.maxrange == float.MaxValue.ToString())
                            {
                                //max*0
                                if (float.Parse(b.maxrange) == 0)
                                {
                                    max1 = "0";
                                }
                                //max*+max
                                else if (float.Parse(b.maxrange) > 0)
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                //max*-max
                                else if (float.Parse(b.maxrange) < 0)
                                {
                                    max1 = float.MinValue.ToString();
                                }
                                //max*0
                                if (float.Parse(b.minrange) == 0)
                                {
                                    max2 = "0";
                                }
                                //max*+min
                                else if (float.Parse(b.minrange) > 0)
                                {
                                    max2 = float.MaxValue.ToString();
                                }
                                //max*-min
                                else if (float.Parse(b.minrange) < 0)
                                {
                                    max2 = float.MinValue.ToString();
                                }
                            }
                            //0*min,0*max
                            else if (float.Parse(a.maxrange) == 0)
                            {
                                max1 = "0";
                                max2 = "0";
                            }
                            else
                            {
                                if (float.Parse(a.maxrange) > 0)
                                {
                                    //+max*max
                                    if (b.maxrange == float.MaxValue.ToString())
                                    {
                                        max1 = float.MaxValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmax1 = float.Parse(a.maxrange) * float.Parse(b.maxrange);
                                        max1 = Tmax1.ToString();
                                    }
                                    //+max*min
                                    if (b.minrange == float.MinValue.ToString())
                                    {
                                        max2 = float.MinValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmax2 = float.Parse(a.maxrange) * float.Parse(b.minrange);
                                        max2 = Tmax2.ToString();
                                    }
                                }
                                else if (float.Parse(a.maxrange) < 0)
                                {
                                    //-max*max
                                    if (b.maxrange == float.MaxValue.ToString())
                                    {
                                        max1 = float.MinValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmax1 = float.Parse(a.maxrange) * float.Parse(b.maxrange);
                                        max1 = Tmax1.ToString();
                                    }
                                    //-max*min
                                    if (b.minrange == float.MinValue.ToString())
                                    {
                                        max2 = float.MaxValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmax2 = float.Parse(a.maxrange) * float.Parse(b.minrange);
                                        max2 = Tmax2.ToString();
                                    }
                                }
                            }
                            //set min
                            if (a.minrange == float.MinValue.ToString())
                            {

                                if (float.Parse(b.minrange) == 0)
                                {
                                    min1 = "0";
                                }
                                else if (float.Parse(b.minrange) < 0)
                                {
                                    min1 = float.MaxValue.ToString();
                                }
                                else if (float.Parse(b.minrange) > 0)
                                {
                                    min1 = float.MinValue.ToString();
                                }

                                if (float.Parse(b.maxrange) == 0)
                                {
                                    min2 = "0";
                                }
                                else if (float.Parse(b.maxrange) < 0)
                                {
                                    min2 = float.MaxValue.ToString();
                                }
                                else if (float.Parse(b.minrange) > 0)
                                {
                                    min2 = float.MinValue.ToString();
                                }
                            }
                            else if (float.Parse(a.minrange) == 0)
                            {
                                min1 = "0";
                                min2 = "0";
                            }
                            else
                            {
                                if (float.Parse(a.minrange) > 0)
                                {
                                    //+min*min
                                    if (b.minrange == float.MinValue.ToString())
                                    {
                                        min1 = float.MinValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmin1 = float.Parse(a.minrange) * float.Parse(b.minrange);
                                        min1 = Tmin1.ToString();
                                    }
                                    //+min*max
                                    if (b.maxrange == float.MaxValue.ToString())
                                    {
                                        min2 = float.MaxValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmin2 = float.Parse(a.minrange) * float.Parse(b.maxrange);
                                        min2 = Tmin2.ToString();
                                    }
                                }
                                else if (float.Parse(a.maxrange) < 0)
                                {
                                    //-min*min
                                    if (b.minrange == float.MinValue.ToString())
                                    {
                                        min1 = float.MaxValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmin1 = float.Parse(a.minrange) * float.Parse(b.minrange);
                                        min1 = Tmin1.ToString();
                                    }
                                    //-min*max
                                    if (b.maxrange == float.MaxValue.ToString())
                                    {
                                        min2 = float.MinValue.ToString();
                                    }
                                    else
                                    {
                                        float Tmin2 = float.Parse(a.minrange) * float.Parse(b.maxrange);
                                        min2 = Tmin2.ToString();
                                    }
                                }
                                
                            }
                            // --end set max,min--
                            z.maxrange = getMax(max1, max2, min1, min2);
                            z.minrange = getMin(max1, max2, min1, min2);
                        }
                    }
                    // '/'
                    else if (Op == "/")
                    {
                        /*
                        string max1 = "";
                        string max2 = "";
                        string min1 = "";
                        string min2 = "";

                        if (float.Parse(b.maxrange) == 0 && float.Parse(b.minrange) == 0)
                        {
                            max1 = "none";
                            max2 = "none";
                            min1 = "none";
                            min2 = "none";
                        }
                        else
                        {
                            // max -> +inf.
                            if (a.maxrange == float.MaxValue.ToString())
                            {
                                //max/-max
                                if (float.Parse(b.maxrange) < 0)
                                {
                                    max1 = float.MinValue.ToString();
                                }
                                //max/+max
                                else if (float.Parse(b.maxrange) > 0)
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                //max/0max
                                else
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                //max/-min
                                if (float.Parse(b.minrange) < 0)
                                {
                                    max2 = float.MinValue.ToString();
                                }
                                //max/+min
                                else if (float.Parse(b.minrange) > 0)
                                {
                                    max2 = float.MinValue.ToString();
                                }
                                //max/0min
                                else
                                {
                                    max2 = float.MaxValue.ToString();
                                }
                            }
                            //max > 0
                            else if (float.Parse(a.maxrange) > 0)
                            { 
                                //+max/max
                                if (b.maxrange == float.MaxValue.ToString())
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                else if (float.Parse(b.maxrange) == 0)
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                else
                                {
                                    float tmax1 = float.Parse(a.maxrange) / float.Parse(b.maxrange);
                                    max1 = tmax1.ToString();
                                }
                                //+max/min
                                if (b.minrange == float.MinValue.ToString())
                                {
                                    max2 = float.MinValue.ToString();
                                }
                                else if (float.Parse(b.minrange) == 0)
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                else
                                {
                                    float tmax2 = float.Parse(a.maxrange) / float.Parse(b.minrange);
                                    max2 = tmax1.ToString();
                                }

                            }
                            //max < 0
                            else if (float.Parse(a.maxrange) < 0)
                            { 
                                //-max/max
                                if (b.maxrange = float.MaxValue.ToString())
                                {
                                    max1 = float.MaxValue.ToString();
                                }
                                else if (float.Parse(b.maxrange) == 0)
                                {
                                    max1 = float.MinValue.ToString();
                                }
                                else
                                {
                                    float tmax1 = float.Parse(a.maxrange) / float.Parse(b.maxrange);
                                    max1 = tmax1.ToString();
                                }
                                //-max/min
                                if (b.minrange = float.MinValue.ToString())
                                {
                                    max2 = float.MinValue.ToString();
                                }
                                else if (float.Parse(a.minrange) == 0)
                                {
                                    max2 = float.MinValue.ToString();
                                }
                                else
                                {
                                    float tmax2 = float.Parse(a.maxrange) / float.Parse(b.minrange);
                                    max2 = tmax1.ToString();
                                }
                            }
                        }
                        */
                    }
                }
                // เป็น int
                else if (a.type == "int" && b.type == "int")
                { 
                    
                }
            }
            else
            {
                z.maxrange = "none";
                z.minrange = "none";
            }
            return z;
        }

        private string getMax(string a1, string a2, string b1, string b2)
        {
            string z;

            float max;
            max = float.Parse(a1);
            if (max < float.Parse(a2))
            {
                max = float.Parse(a2);
            }
            if (max < float.Parse(b1))
            {
                max = float.Parse(b1);
            }
            if (max < float.Parse(b2))
            {
                max = float.Parse(b2);
            }

            z = max.ToString();

            if (z == float.MinValue.ToString())
            {
                z = "none";
            }

            return z;
        }

        private string getMin(string a1, string a2, string b1, string b2)
        {
            string z;

            float min;
            min = float.Parse(a1);
            if (min > float.Parse(a2))
            {
                min = float.Parse(a2);
            }
            if (min > float.Parse(b1))
            {
                min = float.Parse(b1);
            }
            if (min > float.Parse(b2))
            {
                min = float.Parse(b2);
            }

            z = min.ToString();

            if (z == float.MaxValue.ToString())
            {
                z = "none";
            }

            return z;
        }

    }
}
