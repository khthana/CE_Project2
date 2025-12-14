using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using Intesis.eSVG;
using System.Xml;
using System.IO;
using GPSExample.Util;
using System.Threading;

namespace MapView
{
    public partial class Form1 : Form
    {
        Form2 kkk = new Form2();
        Form3 ggg = new Form3();
        Form4 tar = new Form4();
        public double Lat;
        public double Lon;
        CUTM d = new CUTM();
        private string MyPath;
        private IntPtr control;
        private ESVGControl eSVG;
        private Document MyDoc;
        private PicButton _Button = new PicButton();
        private ReadAttributeX RAtt = new ReadAttributeX();
        //private GPS gps = new GPS();
        XmlDocument doc = new XmlDocument();
        private String filepath = "\\My Documents\\Personal\\too.svg";
        private String filepath2 = "\\My Documents\\Personal\\maptest3.svg";
        private GPSReader _GPS;
        private ReadXml r = new ReadXml();
        public bool ch = false;
        public struct RECT
        {
            public int left;
            public int top;
            public int right;
            public int bottom;
        }
        [DllImport("coredll.dll", EntryPoint = "GetWindowRect", SetLastError = true)]
        internal static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);
        public Form1()
        {
            InitializeComponent();
            _GPS = new GPSReader("COM6:", 19200);
            _GPS.OnGPSMessage += new GPSEventHandler(_GPS_OnGPSMessage);
            _GPS.OnGPSReadStart += new EventHandler(_GPS_OnGPSReadStart);
            _GPS.OnGPSReadStop += new EventHandler(_GPS_OnGPSReadStop);
        }

        private void pictureBox1_Click_1(object sender, EventArgs e)
        {
            int butt = _Button.FineButton(MousePosition.X, MousePosition.Y);
            if (butt == 0) {
                eSVGInterface.svg_setZoom(control, eSVGInterface.svg_getZoom(control) * 1.1f);
            }
            else if(butt == 1){
                eSVGInterface.svg_setZoom(control, eSVGInterface.svg_getZoom(control) / 1.1f);
            }
            else if (butt == 2){
                eSVGInterface.svg_zoomToSelection(control, false);
            }
            else if (butt == 3)
            {
                eSVGInterface.svg_setPanMode(control, true);
            }
            else if (butt == 4)//GPS
            {
                try
                {
                    Element cc = (Element)MyDoc.getElementById("GPS");
                    cc.setAttribute("visibility", "visible");
                }
                catch (Exception ee)
                {
                    MessageBox.Show("No Map");
                    //MessageBox.Show(ee.ToString());
                }
            }
        }

        private void toolBar1_ButtonClick(object sender, ToolBarButtonClickEventArgs e)
        {

        }

        private void menuItem4_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.Filter = "SVG Files|*.svg";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                MyPath = openFileDialog1.FileName;
                //AddFunction_GPS();
                eSVGInterface.svg_setDocumentName(control, MyPath, false);
                MyDoc = Document.GetDocumentFromControl(control);

                r.Function_GPS_Click(MyPath);
                eSVGInterface.svg_setDocumentName(control, filepath2, false);
                MyDoc = Document.GetDocumentFromControl(control); 
            }

            //r.Function_GPS_Click(MyPath);
            //eSVGInterface.svg_setDocumentName(control, filepath2, false);
            //MyDoc = Document.GetDocumentFromControl(control); 
        }

        public void ThreadProc()
        {
            //ggg.ShowDialog();
            for (int i = 0; i < 10; i++)
            {
                MessageBox.Show(i.ToString());
                //Console.WriteLine("ThreadProc: {0}", i);
                // Yield the rest of the time slice.
                Thread.Sleep(0);
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            eSVGInterface.svg_initialize(false);
            RECT rect;
            GetWindowRect(pictureBox2.Handle, out rect);
            Rectangle rec = new Rectangle(rect.left, rect.top, rect.right - rect.left, rect.bottom - rect.top);
            Rectangle clientRect = RectangleToClient(rec);
            eSVG = new ESVGControl(pictureBox2, clientRect.Left, clientRect.Top, clientRect.Right, clientRect.Bottom);
            control = eSVGInterface.svg_createControl(this.Handle, clientRect.Left, clientRect.Top, clientRect.Right, clientRect.Bottom);
            eSVGInterface.svg_setBorder(control, 0);
            eSVGInterface.svg_setPopup(control, true);
            //Thread t = new Thread(new ThreadStart(ThreadProc));
            //t.Start();

        }

        private void menuItem6_Click(object sender, EventArgs e)
        {
            r.Function_GPS_Click(MyPath);

        }


        private void menuItem7_Click(object sender, EventArgs e)
        {
                _GPS.PreferredReadMode = ReadMode.Character;
                _GPS.StartRead();
                textBox1.Text = "Please Wait . . .";

        }

        private void menuItem8_Click(object sender, EventArgs e)
        {
            _GPS.StopRead(); 
        }

        private void menuItem5_Click(object sender, EventArgs e)
        {
            ggg.ShowDialog();
        }

        private void menuItem10_Click(object sender, EventArgs e)
        {
            ggg.ShowDialog();
        }
                
        private void _GPS_OnGPSReadStop(object sender, EventArgs e)
        {
            //MessageBox.Show("Stop Read "+e.ToString());
            textBox1.Text = "Stoped !";
        }

        private void _GPS_OnGPSReadStart(object sender, EventArgs e)
        {
            //MessageBox.Show("Start Read "+e.ToString());
            textBox1.Text = "Now Reading ...";
        }
        private void _GPS_OnGPSMessage(object sender, GPSEventArgs arg)
        {
            listBox1.Items.Insert(0, arg.MessageText);
            if (listBox1.Items.Count > 1)
                listBox1.Items.RemoveAt(1);
            Lat = arg.Lat;
            Lon = arg.Lon;
            d.LatLonToUtm(Lat, Lon);
            //label4.Text = d.easting.ToString();
            //label5.Text = d.northing.ToString();
            label4.Text = arg.Lat.ToString();
            label5.Text = arg.Lon.ToString();
            if (!ch)
            {
                Element dd = (Element)MyDoc.getElementById("GPS");
                dd.setAttribute("transform", "translate(" + d.easting + ", " + "-" + d.northing + ")");
            }
            else
            {
            }
         }

        private void menuItem11_Click(object sender, EventArgs e)
        {
            Thread t = new Thread(new ThreadStart(ThreadProc));
            t.Start();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                NodeList k = MyDoc.getElementsByTagName("use");
                int kk = k.Length;
                String check;
                String symid;
                for (int i = 0; i < kk; i++)
                {
                    Element cc = (Element)MyDoc.getElementsByTagName("use").item(i);
                    check = cc.getAttribute("check");
                    if (check == "1")
                    {
                        //MessageBox.Show("click");
                        string d = cc.getAttribute("id");
                        kkk.s = d;
                        //RAtt.read(d);
                        //RAtt.createstr();
                        kkk.ShowDialog();
                        symid = cc.getAttribute("symbolid");
                        cc.setAttribute("xlink:href", symid);
                        cc.setAttribute("check", "0");
                    }
                }
            }
            catch (Exception ei)
            {
                MessageBox.Show("No Map");
                //MessageBox.Show("Exception: {0}", ei.ToString());
            }
        }

        private void menuItem3_Click(object sender, EventArgs e)
        {
            //r.create_symbol();
            String pathxml = "\\My Documents\\Personal\\XMLDAT.xml";
            XmlDocument xDoc = new XmlDocument();
            try
            {
                XmlTextReader reader = new XmlTextReader(pathxml);
                while (reader.Read())
                {
                    // Move to fist element
                    reader.MoveToElement();
                    //if (reader.NodeType == XmlNodeType.EndElement && reader.Name == "Object1")
                    //{
                        MessageBox.Show(reader.Value.ToString());
                        //MessageBox.Show(reader.NodeType.ToString());
                    //}
                }
            }
            catch(Exception ei)
            {
                MessageBox.Show("Exception: {0}", ei.ToString());
            }

        }

        private void menuItem12_Click(object sender, EventArgs e)
        {
            kkk.ShowDialog();
        }

        private void menuItem3_Click_1(object sender, EventArgs e)
        {
           string namefile = System.DateTime.Today.ToString();
            try
            {
              /*  //String pathxml = "\\My Documents\\Personal\\test2.xml";
                //RAtt.getdate();
                string pathxml = RAtt.path2;
                //string pathxml = "\\My Documents\\Personal\\test4.xml";
                string ss;
                XmlDocument xdoc = new XmlDocument();
                XmlTextReader reader = new XmlTextReader(pathxml);
                reader.Read();
                xdoc.Load(reader);
                XmlNode root = xdoc.GetElementsByTagName("Xml_Data").Item(0);
                /////////////////////call web service///////////////////
                WebReference.Service service = new WebReference.Service();
                ss = service.Send_Xml(root);
                ////////////////////////////////////////////////////////*/
            ////////////////// Service Bob///////////////////////////////
                            //String pathxml = "\\My Documents\\Personal\\test2.xml";
                //RAtt.getdate();
                string pathxml = RAtt.path2;
                //string pathxml = "\\My Documents\\Personal\\test4.xml";
                string ss;
                XmlDocument xdoc = new XmlDocument();
                XmlTextReader reader = new XmlTextReader(pathxml);
                reader.Read();
                xdoc.Load(reader);
                XmlNode root = xdoc.GetElementsByTagName("Xml_Data").Item(0);
                /////////////////////call web service///////////////////
                WebReference2.Service service = new MapView.WebReference2.Service();
                ss = service.Send_Xml(root);
            /////////////////////////////////////////////////////////////
                MessageBox.Show("Complete");
            }
            catch (Exception ep)
            {
                MessageBox.Show("Not Connect Internet");
            }
        }

        private void menuItem6_Click_1(object sender, EventArgs e)
        {
            CUTM d = new CUTM();
            d.LLtoNE(13, 100);
            d.LatLonToUtm(13, 100.77);
        }

        private void menuItem9_Click(object sender, EventArgs e)
        {
            tar.ShowDialog();
            string id = tar.GetIndex();
            if (id != "noclick")
            {
                Element d = (Element)MyDoc.getElementById(id);
                MessageBox.Show(id);
                d.setAttribute("check", "1");
                d.setAttribute("xlink:href","#Click");
            }
            else
            {
                //MessageBox.Show(id);
            }
        }

        private void menuItem6_Click_2(object sender, EventArgs e)
        {
    /*        /////////////////////call web service///////////////////
            string filename = "\\My Documents\\Personal\\test4.xml";
            XmlDocument doc = new XmlDocument();
            WebReference.Service service = new WebReference.Service();
            XmlNode ss = service.GetXML();
            //ss = service.GetXml(root);
            doc.AppendChild(doc.ImportNode(ss, true));
            doc.Save(filename);
            ////////////////////////////////////////////////////////*/
            //////////////Service Bob/////////////////////////////////
            try
            {
                string filename = "\\My Documents\\Personal\\test4.xml";
                XmlDocument doc = new XmlDocument();
                WebReference2.Service service = new MapView.WebReference2.Service();
                XmlNode ss = service.GetXML();
                //ss = service.GetXml(root);
                doc.AppendChild(doc.ImportNode(ss, true));
                doc.Save(filename);
                //////////////////////////////////////////////////////////
                MessageBox.Show("Complete");
            }
            catch (Exception p)
            {
                MessageBox.Show("Not Complete");
            }
        }

        public void Set_Click(string id)
        {
            Element s = MyDoc.getElementById(id);
            s.setAttribute("check", "1");
            s.setAttribute("xlink:href", "#Click");
        }

        private void menuItem10_Click_1(object sender, EventArgs e)
        {
            Element dd = (Element)MyDoc.getElementById("GPS");
            dd.setAttribute("transform", "translate(692240 -1517941)");
        }

        private void checkBox1_CheckStateChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                ch = true;
            }
            else
            {
                ch = false;
            }
        }
    }
}