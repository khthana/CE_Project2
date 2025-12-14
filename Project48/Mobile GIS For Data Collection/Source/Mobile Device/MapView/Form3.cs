using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.IO;

namespace MapView
{
    public partial class Form3 : Form
    {

        string viewbox11;
        string viewbox22;
        string viewbox33;
        string viewbox44;
        string request;
        Form5 hh = new Form5();
        public string[] layer = new string[20];
        public int numberlayer = 0;
        public Form3()
        {
            InitializeComponent();
 
        }


        private void Form3_Load(object sender, EventArgs e)
        {
            

            //MessageBox.Show("form3");
            //textBox1.Text = ff.Lat.ToString();
            //textBox2.Text = ff.Lon.ToString();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string path = "\\My Documents\\Personal\\XMLDAT.xml";
            //////////////////////////viewbox///////////////
            XmlTextReader reader = new XmlTextReader(path);

            while (reader.Read())
            {
                reader.MoveToElement();
                if (reader.LocalName.Equals("v1"))
                {
                    viewbox11 = reader.ReadString();
                    //MessageBox.Show(viewbox11);
                }
                if (reader.LocalName.Equals("v2"))
                {
                    viewbox22 = reader.ReadString();
                    //MessageBox.Show(viewbox22);
                }
                if (reader.LocalName.Equals("v3"))
                {
                    viewbox33 = reader.ReadString();
                    //MessageBox.Show(viewbox33);
                }
                if (reader.LocalName.Equals("v4"))
                {

                    viewbox44 = reader.ReadString();
                    //MessageBox.Show(viewbox44);
                }
            }
            ///////////////////////////////
            
            //double v1 = 691233.448514923;
            //double v2 = 1518982.90543619;
            //double v3 = 1814.34961213078;
            //double v4 = 1217.95208938536;
            string viewbox1 = viewbox11;//v1.ToString();
            string viewbox2 = viewbox22;//v2.ToString();
            string viewbox3 = viewbox33;//v3.ToString();
            string viewbox4 = viewbox44;//v4.ToString();

            textBox1.Text = viewbox1;
            textBox2.Text = viewbox2;
            textBox3.Text = viewbox3;
            textBox4.Text = viewbox4;

            //////////////////////////////////////
            string requestDefault =
                "<layer>" +
                "<name>Road [KMITL]</name>" +
                "<fill-color>white</fill-color>" +
                "<stroke-color>black</stroke-color>" +
                "</layer>" +
                "<layer>" +
                "<name>Building [KMITL]</name>" +
                "<fill-color>green</fill-color>" +
                "<stroke-color>black</stroke-color>" +
                "</layer>" +
                "<layer>" +
                "<name>Institutes [KMITL]</name>" +
                "<fill-color>blue</fill-color>" +
                "<stroke-color>black</stroke-color>" +
                "</layer>" +
                 "<layer>" +
                "<name>Water [KMITL]</name>" +
                "<fill-color>orange</fill-color>" +
                "<stroke-color>black</stroke-color>" +
              "</layer>" +
              "<layer>" +
                "<name>Railway [KMITL]</name>" +
                "<fill-color>pink</fill-color>" +
                "<stroke-color>black</stroke-color>" +
              "</layer>";

            //////////////////////////////////////
            /*string viewbox1 = textBox1.Text;
            string viewbox2 = textBox2.Text;
            string viewbox3 = textBox3.Text;
            string viewbox4 = textBox4.Text;*/
            //////////////////////////////////////////////////////
            string layername1 = "";
            string layername2 = "";
            string layername3 = "";
            string color1 = "";
            string color2 = "";
            string color3 = "";
            string stroke_color1 = "";
            string stroke_color2 = "";
            string stroke_color3 = "";
            //////////////////////////////////////////////////////
            if (comboBox1.SelectedIndex != -1)
            {
                layername1 = comboBox1.SelectedItem.ToString();
            }
            else if(comboBox2.SelectedIndex != -1)
            {
            layername2 = comboBox2.SelectedItem.ToString();
            }
            else if(comboBox3.SelectedIndex != -1)
            {
            layername3 = comboBox3.SelectedItem.ToString();
            }
            else if(comboBox4.SelectedIndex != -1)
            {
            color1 = comboBox4.SelectedItem.ToString();
            }
            else if(comboBox5.SelectedIndex != -1)
            {
                color2 = comboBox5.SelectedItem.ToString();
            }
            else if(comboBox6.SelectedIndex != -1)
            {
            color3 = comboBox6.SelectedItem.ToString();
            }
            else if(comboBox7.SelectedIndex  != -1)
            {
            stroke_color1 = comboBox7.SelectedItem.ToString();
            }
            else if(comboBox8.SelectedIndex != -1)
            {
            stroke_color2 = comboBox8.SelectedItem.ToString();
            }
            else if (comboBox9.SelectedIndex != -1)
            {
                stroke_color3 = comboBox9.SelectedItem.ToString();
            }

            if (comboBox1.SelectedIndex == -1 && comboBox2.SelectedIndex == -1 && comboBox3.SelectedIndex == -1)
            {
                request = "<GetMap>" +
                                  "<viewbox>" +
                                   "<vbox1>" + viewbox1 + "</vbox1>" +
                                    "<vbox2>" + viewbox2 + "</vbox2>" +
                                    "<vbox3>" + viewbox3 + "</vbox3>" +
                                    "<vbox4>" + viewbox4 + "</vbox4>" +
                                    "</viewbox>" +
                                    "<width>320</width>" +
                                    "<height>280</height>" +
                                    "<opacity>0.8</opacity>" +
                                    requestDefault +
                    "</GetMap>";
            }
            else if (comboBox1.SelectedIndex != -1 && comboBox2.SelectedIndex == -1 && comboBox3.SelectedIndex == -1)
            {
                request = request = "<GetMap>" +
                                  "<viewbox>" +
                                   "<vbox1>" + viewbox1 + "</vbox1>" +
                                    "<vbox2>" + viewbox2 + "</vbox2>" +
                                    "<vbox3>" + viewbox3 + "</vbox3>" +
                                    "<vbox4>" + viewbox4 + "</vbox4>" +
                                    "</viewbox>" +
                                    "<width>320</width>" +
                                    "<height>280</height>" +
                                    "<opacity>0.8</opacity>" +
                                    requestDefault +
                    "<layer>" +
                    "<name>" + layername1 + "</name>" +
                    "<fill-color>" + color1 + "</fill-color>" +
                    "<stroke-color>" + stroke_color1 + "</stroke-color>" +
                    "</layer>" +
                    /*"<name>" + layername2 + "</name>" +
                    "<fill-color>" + color2 + "</fill-color>" +
                    "<stroke-color>" + stroke_color2 + "</stroke-color>" +
                    "</layer>" +
                    "<layer>" +
                    "<name>" + layername3 + "</name>" +
                    "<fill-color>" + color3 + "</fill-color>" +
                    "<stroke-color>" + stroke_color3 + "</stroke-color>" +
                    "</layer>"*/
                                    "</GetMap>";
            }
            else if (comboBox1.SelectedIndex != -1 && comboBox2.SelectedIndex != -1 && comboBox3.SelectedIndex == -1)
            {
                request = request = "<GetMap>" +
                  "<viewbox>" +
                   "<vbox1>" + viewbox1 + "</vbox1>" +
                    "<vbox2>" + viewbox2 + "</vbox2>" +
                    "<vbox3>" + viewbox3 + "</vbox3>" +
                    "<vbox4>" + viewbox4 + "</vbox4>" +
                    "</viewbox>" +
                    "<width>320</width>" +
                    "<height>280</height>" +
                    "<opacity>0.8</opacity>" +
                    requestDefault +
                    "<layer>" +
                    "<name>" + layername1 + "</name>" +
                    "<fill-color>" + color1 + "</fill-color>" +
                    "<stroke-color>" + stroke_color1 + "</stroke-color>" +
                    "</layer>" +
                    "<layer>" +
                    "<name>" + layername2 + "</name>" +
                    "<fill-color>" + color2 + "</fill-color>" +
                    "<stroke-color>" + stroke_color2 + "</stroke-color>" +
                    "</layer>" +
                    /*"<layer>" +
                    "<name>" + layername3 + "</name>" +
                    "<fill-color>" + color3 + "</fill-color>" +
                    "<stroke-color>" + stroke_color3 + "</stroke-color>" +
                    "</layer>"*/
                    "</GetMap>";
            }
            else if (comboBox1.SelectedIndex != -1 && comboBox2.SelectedIndex != -1 && comboBox3.SelectedIndex != -1)
            {
                request = request = "<GetMap>" +
                                    "<viewbox>" +
                                    "<vbox1>" + viewbox1 + "</vbox1>" +
                                    "<vbox2>" + viewbox2 + "</vbox2>" +
                                    "<vbox3>" + viewbox3 + "</vbox3>" +
                                    "<vbox4>" + viewbox4 + "</vbox4>" +
                                    "</viewbox>" +
                                    "<width>320</width>" +
                                    "<height>280</height>" +
                                    "<opacity>0.8</opacity>" +
                                    requestDefault +
                                    "<layer>" +
                                    "<name>" + layername1 + "</name>" +
                                    "<fill-color>" + color1 + "</fill-color>" +
                                    "<stroke-color>" + stroke_color1 + "</stroke-color>" +
                                    "</layer>" +
                                    "<layer>" +
                                    "<name>" + layername2 + "</name>" +
                                    "<fill-color>" + color2 + "</fill-color>" +
                                    "<stroke-color>" + stroke_color2 + "</stroke-color>" +
                                    "</layer>" +
                                    "<layer>" +
                                    "<name>" + layername3 + "</name>" +
                                    "<fill-color>" + color3 + "</fill-color>" +
                                    "<stroke-color>" + stroke_color3 + "</stroke-color>" +
                                    "</layer>"+
                                    "</GetMap>";
            }
            //string request = "<GetMap><layer><name>road</name><color>255 255 0</color></layer><layer><name>building</name><color>255 150 100</color></layer><layer><name>buildingeng</name><color>255 0 255</color></layer><layer><name>buildingagriind</name><color>120 0 255</color></layer><layer><name>buildingsci</name><color>0 108 0</color></layer><layer><name>rail</name><color>255 145 125</color></layer><layer><name>water</name><color>24 231 254</color></layer><layer><name>institute</name><color>52 74 226</color></layer></GetMap>";
            /////////////////////call web service///////////////////
           try{
            /*string filename = "\\My Documents\\Personal\\MapView.svg";
            XmlDocument doc = new XmlDocument();
            WebReference.Service service = new WebReference.Service();
            XmlNode ss = service.GetMap(request);
            //ss = service.GetXml(root);
            doc.AppendChild(doc.ImportNode(ss, true));
            doc.Save(filename);*/
            ////////////////////////////////////////////////////////
            ////////////////////website5///////////////////////////
            string filename = "\\My Documents\\Personal\\MapView.svg";
            XmlDocument doc = new XmlDocument();
            WebReference1.Service service = new WebReference1.Service();
            XmlNode ss = service.GetMap(request);
            //ss = service.GetXml(root);
            doc.AppendChild(doc.ImportNode(ss, true));
            doc.Save(filename);
            ///////////////////////////////////////////////////////
            MessageBox.Show("Complete");
            this.Close();
            }
            catch(Exception r)
            {
                MessageBox.Show("No layer");
            }
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            String path = "\\My Documents\\Personal\\layer.xml";
            XmlDocument xdoc = new XmlDocument();
            WebReference1.Service servicel = new WebReference1.Service();
            string n = servicel.GetCapabilities();
            TextReader txt = new StringReader(n);
            XmlDocument doc = new XmlDocument();
            doc.Load(txt);
            doc.Save(path);
            /////////////////////////////
            XmlTextReader reader = new XmlTextReader(path);
            int i = 0;
            while (reader.Read())
            {
                reader.MoveToElement();
                if (reader.LocalName.Equals("LayerName"))
                {
                    numberlayer++;
                    layer[i] = reader.ReadString();
                    //MessageBox.Show(layer[i]);
                    i++;
                }
            }
            reader.Close();
            for (int j = 0; j < numberlayer; j++)
            {
                if ((layer[j] != "Road [KMITL]") && (layer[j] != "Building [KMITL]") && (layer[j] != "Institutes [KMITL]") && (layer[j] != "Water [KMITL]") && (layer[j] != "Railway [KMITL]"))
                {
                    comboBox1.Items.Add(layer[j]);
                    comboBox2.Items.Add(layer[j]);
                    comboBox3.Items.Add(layer[j]);
                }
                //MessageBox.Show(layer[j]);
            }
            ////////////////////////////////

            hh.ShowDialog();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}