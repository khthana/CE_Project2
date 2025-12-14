using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;

namespace SoftwareTesting
{
    public partial class BlackBox : Form
    {
        public BlackBox()
        {
            InitializeComponent();
        }

        public BlackBox(argvs a, string f, int ic)
        {
            InitializeComponent();
            insertCount = ic;
            file = f;
            first = a;
            argC = 1;
            indexargvs = first;

            markPath = new bool[ic];

            aname.Text = indexargvs.Argument;
            atype.Text = indexargvs.type;

            MaxRangeBox.Text = indexargvs.maxrange;
            MinRangeBox.Text = indexargvs.minrange;
        }

        bool[] markPath;
        int insertCount;
        string file;
        int argC;
        string t;
        argvs first;
        argvs indexargvs;

        private void Arg_TextChanged(object sender, EventArgs e)
        {
            submit.Enabled = true;
        }

        private void summit_Click(object sender, EventArgs e)
        {
            t = t + Arg.Text +" ";

            indexargvs = indexargvs.NextA;
            argC++; 
            if (indexargvs != null)
            {
                ArgGroupBox.Text = "Argument Value " + argC.ToString();
                labelArgName.Text = indexargvs.Argument;
                TypeLabel.Text = indexargvs.type;
                Arg.Text = "";
                submit.Enabled = false;
            }
            else
            {
                ArgGroupBox.Enabled = false;
                ResultButton.Enabled = true;
            }
        }

        private void ValueBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ValueBox.SelectedIndex == 0)
            {
                Arg.Text = indexargvs.maxrange;
                submit.Enabled = true;
            }
            else if (ValueBox.SelectedIndex == 1)
            {
                Arg.Text = indexargvs.minrange;
                submit.Enabled = true;
            }
            else if (ValueBox.SelectedIndex == 2)
            {
                string q = "";

                if (indexargvs.type == "int")
                {
                    float z = (int.Parse(indexargvs.maxrange) + int.Parse(indexargvs.minrange)) / 2;
                    q = z.ToString();
                }
                else if (indexargvs.type == "float")
                {
                    float z = (float.Parse(indexargvs.maxrange) + float.Parse(indexargvs.minrange)) / 2;
                    q = z.ToString();
                }

                Arg.Text = q;
                submit.Enabled = true;
            }
            else if (ValueBox.SelectedIndex == 3)
            {
                Random ran = new Random();
                string q = "";

                if (indexargvs.type == "int")
                {
                    int z = ran.Next(int.Parse(indexargvs.minrange), int.Parse(indexargvs.maxrange));
                    q = z.ToString();
                }

                Arg.Text = q;
                submit.Enabled = true;
            }
            else if (ValueBox.SelectedIndex == 4)
            {
                Arg.Text = "";
                submit.Enabled = false;
            }
        }

        private void ResultButton_Click(object sender, EventArgs e)
        {
            int result;
            Process myProcess = new Process();

            try
            {
                ProcessStartInfo myProcessStartInfo = new ProcessStartInfo(file);
                myProcessStartInfo.Arguments = t;
                myProcess.StartInfo = myProcessStartInfo;
                myProcess.Start();
                myProcess.WaitForExit();
                try
                {
                    result = myProcess.ExitCode;
                    resultbox.Text = result.ToString();
                }
                catch (InvalidOperationException ECmsg)
                {
                    resultbox.Text = "Error: " + ECmsg.Message;
                }
            }
            catch (InvalidOperationException IOEmsg)
            {
                resultbox.Text = "Error: " + IOEmsg.Message;
            }
            catch (Win32Exception WEmsg)
            {
                resultbox.Text = "Error: " + WEmsg.Message;
            }

            myProcess.Close();

            ResultButton.Enabled = false;
            Reset.Enabled = true;
        }

        private void summit2_Click(object sender, EventArgs e)
        {
            SetArg.Enabled = false;
            ArgGroupBox.Enabled = true;
            WhiteBox.Enabled = true;

            labelArgName.Text = indexargvs.Argument;
            TypeLabel.Text = indexargvs.type;
        }

        private void Nextbutton_Click(object sender, EventArgs e)
        {
                indexargvs.maxrange = MaxRangeBox.Text;
                indexargvs.minrange = MinRangeBox.Text;

                indexargvs = indexargvs.NextA;

                if (indexargvs != null)
                {
                    aname.Text = indexargvs.Argument;
                    atype.Text = indexargvs.type;

                    MaxRangeBox.Text = indexargvs.maxrange;
                    MinRangeBox.Text = indexargvs.minrange;
                }
                else
                {
                    Nextbutton.Enabled = false;
                    submit2.Enabled = true;
                    indexargvs = first;
                }  
            
        }

        private void Reset_Click(object sender, EventArgs e)
        {
            resultbox.Enabled = false;
            ArgGroupBox.Enabled = true;
            indexargvs = first;
            argC=1;
            ArgGroupBox.Text = "Argument Value " + argC;
            Arg.Text = "";
            TypeLabel.Text = indexargvs.type;
            labelArgName.Text = indexargvs.Argument;
            t ="";
        }

        private void WhiteBox_Click(object sender, EventArgs e)
        {
            string[,] table = new string[3,3];
            argvs a1 = first;
            argvs a2 = first.NextA;
            string tempOut = "D:\\test.txt";

            string v1 = "";
            string v2 = "";

            for (int i = 0; i < 3; i++)
            {
                if (i == 0)
                {
                    v1 = a1.maxrange;
                }
                else if (i == 1)
                {
                    v1 = a1.minrange;
                }
                else
                {
                    float temp1 = (int.Parse(a1.maxrange) + int.Parse(a1.minrange)) / 2;
                    v1 = temp1.ToString();
                }

                for (int j=0; j < 3; j++)
                {
                    if (j == 0)
                    {
                        v2 = a2.maxrange;
                    }
                    else if (j == 1)
                    {
                        v2 = a2.minrange;
                    }
                    else
                    {
                        float temp2 = (int.Parse(a2.maxrange) + int.Parse(a2.minrange))/2;
                        v2 = temp2.ToString();
                    }

                    table[i, j] = v1 + " " + v2;
                }
            }

            for (int i = 0; i < 3; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    Process pro = new Process();
                    try
                    {
                        ProcessStartInfo Stpro = new ProcessStartInfo(file);
                        Stpro.Arguments = table[i, j] + ">" + tempOut;
                        pro.StartInfo = Stpro;
                        pro.Start();
                        pro.WaitForExit();
                    }
                    catch (InvalidOperationException IOEmsg)
                    {
                        resultbox.Text = "Error: " + IOEmsg.Message;
                    }
                    catch (Win32Exception WEmsg)
                    {
                        resultbox.Text = "Error: " + WEmsg.Message;
                    }
                    pro.Close();

                    checkPath(table, tempOut);
                }
            }

            //----------- random ค่า ----------------------

            Random rand = new Random();

            for (int i = 0; i < 20; i++)
            {
                //----------- set argument ----------------

                int r1 = rand.Next(int.Parse(a1.minrange), int.Parse(a1.maxrange));
                int r2 = rand.Next(int.Parse(a2.minrange), int.Parse(a2.maxrange));

                string argument = r1.ToString() + " " + r2.ToString();

                Process pro2 = new Process();
                try
                {
                    ProcessStartInfo Stpro2 = new ProcessStartInfo(file);
                    Stpro2.Arguments = argument + ">" + tempOut;
                    pro2.StartInfo = Stpro2;
                    pro2.Start();
                    pro2.WaitForExit();
                }
                catch (InvalidOperationException IOEmsg)
                {
                    resultbox.Text = "Error: " + IOEmsg.Message;
                }
                catch (Win32Exception WEmsg)
                {
                    resultbox.Text = "Error: " + WEmsg.Message;
                }
                pro2.Close();

                checkPath(table, tempOut);
            }
            //------------- show ---------------------------

            string t = "Show unaccess path\n";

            for (int i = 0; i < insertCount; i++)
            {
                if (markPath[i] == false)
                {
                    t = t + "--->Path cid: " + i.ToString() + " never access\n";
                }
            }

            WhiteDisplay.Text = t;
        }

        private void checkPath(string[,] table, string tFile)
        {
            string temp="";
            try
            {
                using (StreamReader sr = new StreamReader(tFile))
                {
                    string line;
                    temp = "";
                    while ((line = sr.ReadLine()) != null)
                    {
                        temp = temp + line + "\n";
                    }
                    sr.Close();
                }
            }
            catch (Exception)
            {
                
            }

            int len = temp.Length;
            int c=0;
            while (c < len)
            {
                if (c < len - 4 && temp[c] == 'c' && temp[c + 1] == 'i' && temp[c + 2] == 'd' && temp[c + 3] == ':')
                {
                    int id = int.Parse(temp[c + 4].ToString());
                    markPath[id] = true;
                }
                c++;
            }

        }
    }
}