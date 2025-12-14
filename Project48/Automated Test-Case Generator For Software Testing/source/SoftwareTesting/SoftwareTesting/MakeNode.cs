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
        private ifNode MakeIfNode(int pos, int end, int line)
        {
            int count = pos;
            int endall;
            int stexp;
            int edexp;
            int stinif;
            int edinif;
            int stinelse = 0;
            int edinelse = 0;
            string exp = "";

            int nline = line;
            int iline = 0;
            int eline = 0;
            int sline = 0;

            while (FileBuffer[count] != '(')
            {
                nline = checknewline(count, nline);
                count++;
            }
            stexp = count;
            Stack q = new Stack();
            q.Push('(');


            while (q.Count != 0)
            {
                count++;
                nline = checknewline(count, nline);
                if (FileBuffer[count] == '(')
                {
                    q.Push('(');
                }
                else if (FileBuffer[count] == ')')
                {
                    q.Pop();
                }
            }

            edexp = count;

            count++;

            while (FileBuffer[count] != '{')
            {
                nline = checknewline(count, nline);
                count++;
            }

            iline = nline;

            stinif = count;

            q = new Stack();
            q.Push('{');

            while (q.Count != 0)
            {
                count++;
                nline = checknewline(count, nline);
                if (FileBuffer[count] == '{')
                {
                    q.Push('{');
                }
                else if (FileBuffer[count] == '}')
                {
                    q.Pop();
                }
            }

            edinif = count;

            endall = count;//ถ้ามี else เปลี่ยน

            eline = nline;

            // ตรวจหา else ยังไม่ทำ

            sline = nline;

            for (int a = stexp + 1; a < edexp; a++)
            {
                exp = exp + FileBuffer[a].ToString();
            }

            ifNode g = new ifNode(exp, pos, endall + 1, stinif, edinif, stinelse, edinelse, line, iline, eline, sline);
            return g;

        }

        private forNode MakeForNode(int pos, int end, int line)
        {
            int count = pos;
            int stexp;
            int edexp;
            int stfor;
            int edfor;
            string exp = "";
            int nline = line;
            int sline;
            int fline;

            while (FileBuffer[count] != '(')
            {
                nline = checknewline(count, nline);
                count++;
            }
            stexp = count;
            Stack q = new Stack();
            q.Push('(');

            while (q.Count != 0)
            {
                nline = checknewline(count, nline);
                count++;
                if (FileBuffer[count] == '(')
                {
                    q.Push('(');
                }
                else if (FileBuffer[count] == ')')
                {
                    q.Pop();
                }
            }


            edexp = count;

            nline = checknewline(count, nline);
            count++;

            while (FileBuffer[count] != '{')
            {
                nline = checknewline(count, nline);
                count++;
            }

            stfor = count;
            fline = nline;

            q = new Stack();
            q.Push('{');

            while (q.Count != 0)
            {
                nline = checknewline(count, nline);
                count++;
                if (FileBuffer[count] == '{')
                {
                    q.Push('{');
                }
                else if (FileBuffer[count] == '}')
                {
                    q.Pop();
                }
            }

            edfor = count;
            sline = nline;

            for (int a = stexp + 1; a < edexp; a++)
            {
                exp = exp + FileBuffer[a].ToString();
            }

            forNode g = new forNode(exp, pos, edfor + 1, stfor, edfor, line, fline, sline);
            return g;
        }

        private whileNode MakeWhileNode(int pos, int end, int line)
        {
            int count = pos;
            int stexp;
            int edexp;
            int stwh;
            int edwh;
            string exp = "";
            int nline = line;
            int wline;
            int fline;

            while (FileBuffer[count] != '(')
            {
                nline = checknewline(count, nline);
                count++;
            }
            stexp = count;
            Stack q = new Stack();
            q.Push('(');

            while (q.Count != 0)
            {
                nline = checknewline(count, nline);
                count++;
                if (FileBuffer[count] == '(')
                {
                    q.Push('(');
                }
                else if (FileBuffer[count] == ')')
                {
                    q.Pop();
                }
            }

            edexp = count;

            nline = checknewline(count, nline);
            count++;

            while (FileBuffer[count] != '{')
            {
                nline = checknewline(count, nline);
                count++;
            }

            wline = nline;
            stwh = count;

            q = new Stack();
            q.Push('{');

            while (q.Count != 0)
            {
                nline = checknewline(count, nline);
                count++;
                if (FileBuffer[count] == '{')
                {
                    q.Push('{');
                }
                else if (FileBuffer[count] == '}')
                {
                    q.Pop();
                }
            }

            fline = nline;
            edwh = count;

            for (int a = stexp + 1; a < edexp; a++)
            {
                exp = exp + FileBuffer[a].ToString();
            }

            whileNode g = new whileNode(exp, pos, edwh + 1, stwh, edwh, line, wline, fline);
            return g;
        }


        private stateNode MakeStatementNode(int pos, int line)
        {
            bool not = true;
            int count = pos;
            int ed = pos;

            while (not)
            {
                count--;
                if (count < 0)
                {
                    not = false;
                }
                else if (//FileBuffer[count] == ')' ||
                    FileBuffer[count] == ';' ||
                    FileBuffer[count] == '{' ||
                    FileBuffer[count] == '}' ||
                    FileBuffer[count] == '\n')// count < 0 หมายถึงเริ่มต้นไฟล์
                {
                    not = false;
                }
            }

            count++;

            while (FileBuffer[count] == ' ' || FileBuffer[count] == '\n' || FileBuffer[count] == '\t')
            {
                count++;
            }

            int st = count;

            string exp = "";
            for (int i = st; i < ed; i++)
            {
                exp = exp + FileBuffer[i].ToString();
            }

            stateNode q = new stateNode(exp, st, ed + 1, line);

            return q;

        }
    }
}
