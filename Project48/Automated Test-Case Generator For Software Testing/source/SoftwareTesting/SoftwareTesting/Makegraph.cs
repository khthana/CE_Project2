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

        private string gatherChar(int c, int n, string s)// c - start n - word count
        {
            string z = "";
            int ct;
            ct = c;
            while (ct < c + n)
            {
                z = z + s[ct];
                ct++;
            }
            return z;
        }

        private void MakeStatechart(Node currentNode)
        {
            nullNode z = new nullNode();
            if (currentNode == null)
            {
                //.............
            }
            else
            {
                if (currentNode.NodeType == 's')
                {
                    // nothing to do
                }
                else if (currentNode.NodeType == 'i')
                {
                    z.from = 'i';

                    ifNode a = (ifNode)currentNode;
                    if (a.Inif != null)
                    {
                        MakeStatechart(a.Inif);
                        travert(z, a.Inif);
                    }
                    else
                    {
                        a.Inif = z;
                    }

                    if (a.Inelse != null)
                    {
                        MakeStatechart(a.Inelse);
                        travert(z, a.Inelse);
                    }
                    else
                    {
                        a.Inelse = z;
                    }

                    z.nextNode = a;
                }
                else if (currentNode.NodeType == 'f')
                {
                    z.from = 'f';

                    forNode a = (forNode)currentNode;
                    if (a.Infor != null)
                    {
                        MakeStatechart(a.Infor);
                        travert(z, a.Infor);
                    }
                    else
                    {
                        a.Infor = z;
                    }

                    z.nextNode = a;

                }
                else if (currentNode.NodeType == 'w')
                {
                    z.from = 'w';

                    whileNode a = (whileNode)currentNode;
                    if (a.Inwhile != null)
                    {
                        MakeStatechart(a.Inwhile);
                        travert(z, a.Inwhile);
                    }
                    else
                    {
                        a.Inwhile = z;
                    }

                    z.nextNode = a;

                }
                MakeStatechart(currentNode.nextNode);
            }

        }

        private void travert(nullNode z, Node a)
        {
            if (a.nextNode == null)
            {
                a.nextNode = z;
                z.start = a.start;
            }
            else
            {
                travert(z, a.nextNode);
            }
        }

        private void showGraph(Node a)
        {
            string x = "";
            x = printchart(a.nextNode, x);
            ResultShow.Text = x;
            ResultType.Text = "Source code's graph display.";
        }

        private string printchart(Node n, string a)
        {
            if (n == null)
            {
                a = a + "NULL\n";
                return a;
            }
            else
            {
                string ret = "";
                // ------------- statement -----------------------------
                if (n.NodeType == 's')
                {
                    string t = "";
                    stateNode s = (stateNode)n;
                    if (s.nextNode != null)
                    {
                        if (s.nextNode.NodeType != 'n')
                        {
                            t = "Line - " + s.line.ToString() + " - statement [ "
                                + s.Expession + " ] -to Line - "
                                + s.nextNode.line.ToString() + "\n";
                            a = a + t;
                        }
                        else
                        {
                            t = "Line - " + s.line.ToString() + " - statement [ "
                                + s.Expession + " ] - endloop -" + getNextofEnd(s.nextNode)
                                + "\n";
                            a = a + t;
                        }
                    }
                    else
                    {
                        t = "Line - " + s.line.ToString() + " - statement [ "
                            + s.Expession + " ] - to NULL\n";
                        a = a + t;
                    }
                    ret = printchart(s.nextNode, a);
                }
                //-------------------- if ------------------------------------
                else if (n.NodeType == 'i')
                {
                    ifNode i = (ifNode)n;
                    a = a + "Line - " + i.line.ToString() + " - if [ " + i.Expession + " ]\n";

                    if (i.Inif != null)
                    {
                        if (i.Inif.NodeType != 'n')
                        {
                            a = a + "Line - " + i.line.ToString() + " *{if true} - to Line - "
                                + i.Inif.line.ToString() + "\n";
                        }
                        else
                        {
                            a = a + "Line - " + i.line.ToString() + " *{if true} - endloop - to line - "
                                + getNextofEnd(i.Inif) + "\n";
                        }
                    }
                    else
                    {
                        a = a + "Line -" + i.line.ToString() + " *{if true} - to - endloop - to - NULL\n";
                    }
                    a = printchart(i.Inif, a);

                    if (i.Inelse != null)
                    {
                        if (i.Inelse.NodeType != 'n')
                        {
                            a = a + "Line - " + i.line.ToString() + " *{if false} - to Line - " +
                                i.Inelse.line.ToString() + "\n";
                        }
                        else
                        {
                            a = a + "Line - " + i.line.ToString() + " *{if false} - endloop - to Line - "
                                + getNextofEnd(i.Inelse) + "\n";
                        }
                    }
                    else
                    {
                        a = a + "Line - " + i.line.ToString() + " *{if false} - to - endloop - to Line - NULL\n";
                    }
                    a = printchart(i.Inelse, a);

                    ret = printchart(i.nextNode, a);
                }
                //-------------------- for ----------------------
                else if (n.NodeType == 'f')
                {
                    forNode f = (forNode)n;
                    a = a + "Line - " + f.line.ToString() + " - for [ " + f.Expession + " ]\n";

                    if (f.Infor.NodeType != 'n')
                    {
                        a = a + "Line - " + f.line.ToString() + " *{true} - Line - "
                            + f.Infor.line.ToString() + "\n";
                    }
                    else
                    {
                        a = a + "Line - " + f.line.ToString() + " *{true} - endloop - Line - "
                            + getNextofEnd(f.Infor).ToString() + "\n";
                    }


                    a = printchart(f.Infor, a);

                    if (f.nextNode != null)
                    {
                        if (f.nextNode.NodeType != 'n')
                        {
                            a = a + "Line - " + f.line.ToString() + " *{false} to Line -"
                                + f.nextNode.line.ToString() + "\n";
                        }
                        else
                        {
                            a = a + "Line - " + f.line.ToString() + " *{false} to Line -"
                                + getNextofEnd(f.nextNode).ToString() + "\n";
                        }
                    }
                    else
                    {
                        a = a + "Line - " + f.line.ToString() + " *{false} to - NULL \n";
                    }

                    ret = printchart(f.nextNode, a);

                }
                //------------------ while ---------------------------
                else if (n.NodeType == 'w')
                {
                    whileNode w = (whileNode)n;
                    a = a + "Line - " + w.line.ToString() + " - for [ " + w.Expession + " ]\n";

                    if (w.Inwhile.NodeType != 'n')
                    {
                        a = a + "Line - " + w.line.ToString() + " *{true} - Line - "
                            + w.Inwhile.line.ToString() + "\n";
                    }
                    else
                    {
                        a = a + "Line - " + w.line.ToString() + " *{true} - endloop - Line - "
                            + getNextofEnd(w.Inwhile).ToString() + "\n";
                    }


                    a = printchart(w.Inwhile, a);

                    if (w.nextNode != null)
                    {
                        if (w.nextNode.NodeType != 'n')
                        {
                            a = a + "Line - " + w.line.ToString() + " *{false} to Line -"
                                + w.nextNode.line.ToString() + "\n";
                        }
                        else
                        {
                            a = a + "Line - " + w.line.ToString() + " *{false} to Line -"
                                + getNextofEnd(w.nextNode).ToString() + "\n";
                        }
                    }
                    else
                    {
                        a = a + "Line - " + w.line.ToString() + " *{false} to - NULL \n";
                    }

                    ret = printchart(w.nextNode, a);
                }
                // --------------- null ---------------------------
                else if (n.NodeType == 'n')
                {
                    ret = a;
                }

                return ret;

            }
        }

        private string getNextofEnd(Node x)
        {
            if (x != null)
            {
                if (x.NodeType != 'n')
                {
                    return x.line.ToString();
                }
                else
                {
                    nullNode nn = (nullNode)x;
                    if (nn.from == 'i')
                    {
                        return getNextofEnd(x.nextNode.nextNode);
                    }
                    else
                    {
                        return getNextofEnd(x.nextNode);
                    }
                }
            }
            else
            {
                return "null";
            }

        }
    }
}
