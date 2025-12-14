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

        private allPath getAllPath(Node n)
        {
            allPath ap = new allPath();
            linePath first = new linePath();

            ap.pathLine = first;
            getToNode(n, first, ap);

            return ap;
        }

        private void getToNode(Node n, linePath lp, allPath indexAllPath)
        {
            if (n != null)
            {
                if (n.NodeType == 's')
                {
                    stateNode sn = (stateNode)n;
                    lp.toNode = sn;

                    lp.next = new linePath();
                    lp = lp.next;

                    getToNode(sn.nextNode, lp, indexAllPath);
                }
                else if (n.NodeType == 'f')
                {
                    forNode fn = (forNode)n;
                    lp.toNode = fn;
                    lp.conValue = true;

                    lp.next = new linePath();
                    lp = lp.next;
                    //--------- path true ------------------
                    getToNode(fn.Infor, lp, indexAllPath);
                    //--------- path false -----------------
                    linePath wp = lp;
                    linePath lp2 = clonePath(indexAllPath, wp);

                    while (indexAllPath.nextAllPath != null)
                    {
                        indexAllPath = indexAllPath.nextAllPath;
                    }

                    lp2.toNode = fn.nextNode;
                    lp2.conValue = false;
                    getToNode(fn.nextNode, lp2, indexAllPath);
                }
                else if (n.NodeType == 'w')
                {
                    whileNode wn = (whileNode)n;
                    lp.toNode = wn;
                    lp.conValue = true;

                    lp.next = new linePath();
                    lp = lp.next;
                    //--------- path true ------------------
                    getToNode(wn.Inwhile, lp, indexAllPath);
                    //--------- path false -----------------
                    linePath wp = lp;
                    linePath lp2 = clonePath(indexAllPath, wp);

                    while (indexAllPath.nextAllPath != null)
                    {
                        indexAllPath = indexAllPath.nextAllPath;
                    }

                    lp2.toNode = wn.nextNode;
                    lp2.conValue = false;
                    getToNode(wn.nextNode, lp2, indexAllPath);

                }
                else if (n.NodeType == 'i')
                {
                    ifNode ifn = (ifNode)n;
                    lp.toNode = ifn;
                    lp.conValue = true;

                    lp.next = new linePath();
                    lp = lp.next;
                    //------- path true --------------
                    getToNode(ifn.Inif, lp, indexAllPath);
                    //------- path false -------------
                    linePath wp = lp;
                    linePath lp2 = clonePath(indexAllPath, wp);

                    while (indexAllPath.nextAllPath != null)
                    {
                        indexAllPath = indexAllPath.nextAllPath;
                    }

                    lp2.toNode = ifn.nextNode;
                    lp2.conValue = false;
                    getToNode(ifn.nextNode, lp2, indexAllPath);
                }
                else // 'n' node
                {
                    nullNode nn = (nullNode)n;

                    if (nn.from == 'i')
                    {
                        ifNode ifn = (ifNode)nn.nextNode;
                        getToNode(ifn.nextNode, lp, indexAllPath);
                    }
                    else if (nn.from == 'w')
                    {
                        whileNode wn = (whileNode)nn.nextNode;
                        getToNode(wn.nextNode, lp, indexAllPath);
                    }
                    else if (nn.from == 'f')
                    {
                        forNode fn = (forNode)nn.nextNode;
                        getToNode(fn.nextNode, lp, indexAllPath);
                    }
                }
            }
            else
            {
                //.........
            }
        }

        private linePath clonePath(allPath masPath, linePath lp)
        {
            linePath masIndex;
            linePath p = new linePath();
            allPath newPath;

            newPath = masPath;
            while (newPath.nextAllPath != null)
            {
                newPath = newPath.nextAllPath;
            }
            newPath.nextAllPath = new allPath();
            newPath = newPath.nextAllPath;

            newPath.pathLine = p;

            masIndex = masPath.pathLine;
            while (masIndex != lp)
            {
                p.toNode = masIndex.toNode;

                p.next = new linePath();
                p = p.next;
                masIndex = masIndex.next;
            }

            p.toNode = lp.toNode;

            return p;
        }


        private void getArg(string s)
        {
            //.........
        }
    }
}
