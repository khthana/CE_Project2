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
        private Node ScanNext(int start, int end, int line)
        {
            char status = 'x';
            int count;
            bool not = true;

            count = start - 1;

            //--------------- หา node -----------------------------------
            while (not)
            {
                count++;
                status = checkCmd(count, end);

                if (count <= end)
                {
                    if (FileBuffer[count] == '\n')
                    {
                        line++;
                    }
                }

                if (status == 'i' ||
                    status == 'w' ||
                    status == 'f' ||
                    status == 's')
                {
                    not = false;
                }
                else if (count > end)
                {
                    not = false;
                    status = 'n';
                }
            }

            //-------------- สร้าง node ------------------------------------------
            if (status == 'i')
            {
                ifNode inode = MakeIfNode(count, end, line);
                inode.Inif = ScanNext(inode.stif + 1, inode.edif, inode.ifline);
                if (inode.edelse == 0 && inode.stelse == 0)
                {
                    inode.Inelse = null;
                }
                else
                {
                    inode.Inelse = ScanNext(inode.stelse + 1, inode.edelse - 1, inode.elseline);
                }
                inode.nextNode = ScanNext(inode.end, end, inode.stopline);
                return inode;
            }
            else if (status == 's')
            {
                stateNode snode = MakeStatementNode(count, line);
                snode.nextNode = ScanNext(snode.end, end, line);
                return snode;
            }
            else if (status == 'w')
            {
                whileNode wNode = MakeWhileNode(count, end, line);
                wNode.Inwhile = ScanNext(wNode.stwh + 1, wNode.edwh, wNode.whileline);
                wNode.nextNode = ScanNext(wNode.end, end, wNode.stopline);
                return wNode;
            }
            else if (status == 'f')
            {
                forNode fNode = MakeForNode(count, end, line);
                fNode.Infor = ScanNext(fNode.stfor + 1, fNode.edfor, fNode.forline);
                fNode.nextNode = ScanNext(fNode.end, end, fNode.stopline);
                return fNode;
            }
            else
            {
                return null;
            }

        }

        private int checknewline(int a, int line)
        {
            if (FileBuffer[a] == '\n')
            {
                line++;
            }
            return line;
        }

        private char checkCmd(int pos, int end)
        {
            char a;
            if (pos <= end)
            {
                a = CheckState(pos, end);
                if (a == 'x')
                {
                    a = CheckIf(pos, end);
                }
                if (a == 'x')
                {
                    a = CheckFor(pos, end);
                }
                if (a == 'x')
                {
                    a = CheckWhile(pos, end);
                }
            }
            else
            {
                a = 'n';
            }
            return a;
        }

        private char CheckState(int pos, int end)
        {
            if (pos < end)
            {
                if (FileBuffer[pos] == ';')
                {
                    return 's';
                }
                else
                {
                    return 'x';
                }
            }
            else
            {
                return 'x';
            }
        }

        private char CheckIf(int pos, int end)
        {
            if (pos + 1 < end)
            {
                if (FileBuffer[pos] == 'i' && FileBuffer[pos + 1] == 'f')
                {
                    return 'i';
                }
                else
                {
                    return 'x';
                }
            }
            else
            {
                return 'x';
            }
        }

        private char CheckFor(int pos, int end)
        {
            if (pos + 2 < end)
            {
                if (FileBuffer[pos] == 'f' &&
                    FileBuffer[pos + 1] == 'o' &&
                    FileBuffer[pos + 2] == 'r')
                {
                    return 'f';
                }
                else
                {
                    return 'x';
                }
            }
            else
            {
                return 'x';
            }
        }

        private char CheckWhile(int pos, int end)
        {
            if (pos + 4 < end)
            {
                if (FileBuffer[pos] == 'w' &&
                    FileBuffer[pos + 1] == 'h' &&
                    FileBuffer[pos + 2] == 'i' &&
                    FileBuffer[pos + 3] == 'l' &&
                    FileBuffer[pos + 4] == 'e')
                {
                    return 'w';
                }
                else
                {
                    return 'x';
                }
            }
            else
            {
                return 'x';
            }
        }

        private string insertCode(string file)
        {
            int ic = 0;
            string s = "";

            for (int i = 0; i < file.Length; i++)
            {
                if (i < file.Length - 1  && file[i] == 'i' && file[i + 1] == 'f' )
                {
                    while (file[i] != '{')
                    {
                        i++;
                    }
                    i++;
                    s = "\r\nprintf(\"cid:" + ic.ToString() + "\\n\");\r\n";
                    file = file.Insert(i,s);
                    ic++;
                }
                else if (i < file.Length - 2 && file[i] == 'f' && file[i + 1] == 'o' && file[i + 2] == 'r')
                {
                    while (file[i] != '{')
                    {
                        i++;
                    }
                    i++;
                    s = "\r\nprintf(\"cid:" + ic.ToString() + "\\n\");\r\n";
                    file = file.Insert(i, s);
                    ic++;
                }
                else if (i < file.Length - 4 && file[i] == 'w' && file[i + 1] == 'h' && file[i + 2] == 'i' && file[i + 3] == 'l' && file[i + 4] == 'e')
                {
                    while (file[i] != '{')
                    {
                        i++;
                    }
                    i++;
                    s = "\r\nprintf(\"cid:" + ic.ToString() + "\\n\");\r\n";
                    file = file.Insert(i, s);
                    ic++;
                }
            }
            insCode = ic;
            return file;
        }

    }
}
