using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Collections;
using System.Diagnostics;

namespace SoftwareTesting
{

    public partial class Form1 : Form
    {
        int insCode;
        string FileBuffer;
        string FileExe;
        string CompileFile;
        Node firstNode = new Node();
        Classlist first = new Classlist();
        allPath aPath;
        string Selected;  //class ที่เลือกทดสอบ

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string TestFileName;
            string OFileName;

            openFileDialog1.ShowDialog();

            TestFileName = openFileDialog1.FileName;    //เก็บแพทของไฟล์

            if (TestFileName != "openFileDialog1")
            {
                filename.Text = TestFileName;
                try
                {
                    using (StreamReader sr = new StreamReader(TestFileName))
                    {
                        string line, temp;
                        temp = "";
                        while ((line = sr.ReadLine()) != null)
                        {
                            temp = temp + line + "\r\n";
                        }
                        sr.Close();
                        FileBuffer = temp;

                        FileBuffer = insertCode(FileBuffer);

                        text2.Text = FileBuffer;    //แสดงข้อมูลในไฟล์ลง text2
                    }
                }
                catch (Exception ex)
                {
                    text2.Text = "File Read Error: " + ex.Message;
                }

                //-------- เขียนลงไฟล์ใหม่----------------------------
                try
                {
                    TestFileName = TestFileName.Insert(TestFileName.Length - 2, "T");

                    OFileName = TestFileName;
                    int i = OFileName.Length - 1;
                    while (OFileName[i] != '.')
                    {
                        i--;
                    }
                    OFileName = OFileName.Remove(i);
                    FileExe = OFileName + ".EXE";
                    
                    using (StreamWriter sw = new StreamWriter(TestFileName, false))
                    {
                        sw.NewLine = "\r\n";
                        sw.Write(FileBuffer);
                        sw.Flush();
                        sw.Close();
                    }
                }
                catch (Exception es)
                {
                    text2.Text = "File write Error: " + es.Message;
                }

                //-------------- compile ---------------------------
                Process pc = new Process();
                try
                {
                    ProcessStartInfo pi = new ProcessStartInfo(CompileFile);
                    pi.Arguments = " " + TestFileName;
                    pc.StartInfo = pi;
                    pc.Start();
                    pc.WaitForExit();
                    pc.Close();
                }
                catch (Win32Exception es)
                {
                    text2.Text = "File write Error: " + es.Message;
                }              

                findClass(first, 1, 0, FileBuffer.Length - 1, FileBuffer);
                makeClass(first.next, FileBuffer);

                setClassSelected(first.next);
                
            }
            else
            {
                filename.Text = "Select source code.";
            }
            
        }

        private void setClassSelected(Classlist cls)
        {
            if (cls == null)
            {
                ClassList.Enabled = true;
            }
            else
            {
                ClassList.Items.Add(cls.name);
                setClassSelected(cls.next);
            }
        }

        private void Help_Click(object sender, EventArgs e)
        {
            help helpdlg = new help();
            helpdlg.ShowDialog();
        }

        private void quit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void test_Click(object sender, EventArgs e)
        {
            TestFile();
            blackboxbutton.Enabled = true;
        }

        private void TestFile()
        {
            int FileLenght = FileBuffer.Length;

            // สร้างตัวทำลายคอมเมนท์

            //------------- ตรวจหา main ----------------------------
            //MainProg main;
            //main = findMain(0, FileLenght - 1, line);
            //-----------------------------------------------------

            Classlist cls = getClass(Selected, first.next);

            if (cls != null)
            {
                //------------- สร้าง node ------------------------------
                firstNode.nextNode = ScanNext(cls.Start, cls.Stop, cls.stLine); 
                //--------------- สร้าง graph ---------------------------
                MakeStatechart(firstNode.nextNode);
                //-------------- สร้างทางเดินทุกเส้น --------------------------
                aPath = getAllPath(firstNode.nextNode);
                //-----------------เที่ยว----------------------------------
                WhiteTest wtest = new WhiteTest(cls,aPath);
                //---------------- แสดง กราฟ ----------------------------

                showGraph(firstNode);

                ShowArg.Enabled = true;
                ShowAllPath.Enabled = true;            
            }
            else
            {
                ResultShow.Text = "Error";
            }
        }

        private void ClassList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Selected = ClassList.Items[ClassList.SelectedIndex].ToString();
            test.Enabled = true;
        }

        private void ShowArg_Click(object sender, EventArgs e)
        {
            argvs A = first.next.firstA;
            string t = "";
            int c = 1;

            t = "Class Name: '" + first.next.name + "'\n";

            while (A != null)
            {
                t = t + "[" + c + "]Argument '" + A.Argument + "' : type '" + A.type
                    + "'\n  -->maxVale: " + A.maxrange + "\n  -->minValue: " + A.minrange + "\n";
                A = A.NextA;
                c++;
            }

            ResultShow.Text = t;
            ResultType.Text = "List of argument from program.";
        }

        private void ShowAllPath_Click(object sender, EventArgs e)
        {
            allPath ap = aPath;
            int count = 0;
            string t;

            while (ap != null)
            {
                count++;
                ap = ap.nextAllPath;
            }
            ap = aPath;

            t = "----Show all possible source code's path----\n";
            t = t + "Number of path: " + count + "\n";
            
            count = 1;

            while (ap != null)
            {
                t = t + "-------------- Path: " + count + "--------------\n";

                linePath lp = ap.pathLine;

                while (lp.toNode != null)
                {
                    if (lp.toNode.NodeType == 's')
                    {
                        stateNode sn = (stateNode)lp.toNode;
                        t = t + "Node: statement, Line: " + sn.line + ", Equation: " + sn.Expession + "\n";
                    }
                    else if (lp.toNode.NodeType == 'i')
                    {
                        ifNode ifn = (ifNode)lp.toNode;

                        if (lp.conValue == true)
                        {
                            t = t + "Node: if, Line: " + ifn.line + ", Expression: " + ifn.Expession + ", Value: true\n";
                        }
                        else
                        {
                            t = t + "Node: if, Line: " + ifn.line + ", Expression: " + ifn.Expession + ", Value: false\n";
                        }
                    }
                    else if (lp.toNode.NodeType == 'f')
                    {
                        forNode fn = (forNode)lp.toNode;

                        if (lp.conValue == true)
                        {
                            t = t + "Node: for, Line: " + fn.line + ", Expression: " + fn.Expession + ", Value: true\n";
                        }
                        else
                        {
                            t = t + "Node: for, Line: " + fn.line + ", Expression: " + fn.Expession + ", Value: false\n";
                        }
                    }
                    else if (lp.toNode.NodeType == 'w')
                    {
                        whileNode wn = (whileNode)lp.toNode;
                        if (lp.conValue == true)
                        {
                            t = t + "Node: for, Line: " + wn.line + ", Expression: " + wn.Expession + ", Value: true\n";
                        }
                        else
                        {
                            t = t + "Node: for, Line: " + wn.line + ", Expression: " + wn.Expession + ", Value: false\n";
                        }
                    }
                    lp = lp.next;
                }

                argvs A = ap.argument;
                t = t + "          ---Argument Range---\n";
                int c = 1;
                while (A != null)
                {
                    t = t + "[" + c + "]Argument '" + A.Argument + "' : type '" + A.type
                        + "'\n  -->maxVale: " + A.maxrange + "\n  -->minValue: " + A.minrange + "\n";
                    A = A.NextA;
                    c++;
                }

                count++;
                ap = ap.nextAllPath;
            }

            ResultShow.Text = t;
            ResultType.Text = "All path from source code";
        }

        private void blackboxbutton_Click(object sender, EventArgs e)
        {
            BlackBox b = new BlackBox(first.next.firstA, FileExe, insCode);
            b.Show();
         
        }

        private void ComButton_Click(object sender, EventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            op.ShowDialog();
            CompileFile = op.FileName;
            if (CompileFile != "")
            {
                open.Enabled = true;
            }
        }
    }
}