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
    public partial class Form5 : Form
    {
        public string[] layer = new string[30];
        public int numberlayer = 0;
        private String path = "\\My Documents\\Personal\\layer.xml";
        public Form5()
        {
            InitializeComponent();
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            /*XmlDocument xdoc = new XmlDocument();
            WebReference1.Service servicel = new WebReference1.Service();
            string n = servicel.GetCapabilities();
            TextReader txt = new StringReader(n);
            XmlDocument doc = new XmlDocument();
            doc.Load(txt);
            doc.Save(path);*/
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
        }

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            for (int j = 0; j < numberlayer; j++)
            {
                if ((layer[j] != "Road [KMITL]") && (layer[j] != "Building [KMITL]") && (layer[j] != "Institutes [KMITL]") && (layer[j] != "Water [KMITL]") && (layer[j] != "Railway [KMITL]"))
                {
                    listBox1.Items.Add("Layer Name :" + layer[j]);
                }
                //MessageBox.Show(layer[j]);
             }
             //MessageBox.Show(numberlayer.ToString());
             numberlayer = 0;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}