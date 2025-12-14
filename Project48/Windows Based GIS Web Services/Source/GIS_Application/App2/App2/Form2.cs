using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.IO;


namespace App2
{
    
    public partial class Form2 : Form
    {
        public Form1 frm1;
        public double frm2XCoor = 0;
        public double frm2YCoor = 0;
        string[] foundName;
        double[] foundLat;
        double[] foundLong;

        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            for (int i = 0; i < frm1.layer.Length; i++)
                listBox1.Items.AddRange(new object[] { frm1.layer[i] });
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string[] layer = new string[1];

            layer[0] = frm1.layer[listBox1.SelectedIndex];

            GisWebService.Service service = new GisWebService.Service();

            string findResult = service.Find("", layer, frm1.v1, frm1.v2, frm1.v3, frm1.v4);

            TextReader temp = new StringReader(findResult);
            XmlTextReader tempreader = new XmlTextReader(temp);
            int tmp = 0;
            while (tempreader.Read())
            {
                if (tempreader.NodeType == XmlNodeType.Element)
                {
                    if (tempreader.Name == "item") tmp++;
                }
            }

            foundName = new string[tmp];
            foundLat = new double[tmp];
            foundLong = new double[tmp];

            TextReader txtReader = new StringReader(findResult);
            XmlTextReader xmlReader = new XmlTextReader(txtReader);

            int index1 = 0;
            int index2 = 0;
            int index3 = 0;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element)
                {
                    if (xmlReader.Name == "name")
                    {
                        foundName[index1] = xmlReader.ReadElementString();
                        index1++;
                    }
                    if (xmlReader.Name == "coordinateX")
                    {
                        foundLat[index2] = xmlReader.ReadElementContentAsDouble();
                        index2++;
                    }
                    if (xmlReader.Name == "coordinateY")
                    {
                        foundLong[index3] = xmlReader.ReadElementContentAsDouble();
                        index3++;
                    }

                }
            }

            listBox2.Items.Clear();
            for (int i = 0; i < tmp; i++)
                listBox2.Items.AddRange(new object[] { foundName[i] });

        }

        private void frm2OK_Click(object sender, EventArgs e)
        {
            if(listBox2.SelectedIndex >= 0)
            {
                frm2XCoor = foundLat[listBox2.SelectedIndex];
                frm2YCoor = foundLong[listBox2.SelectedIndex];

                if (frm1.tabControl1.SelectedIndex == 4)
                {
                    frm1.findNearbyLatBox.Text = frm2XCoor.ToString();
                    frm1.findNearbyLongBox.Text = frm2YCoor.ToString();
                }

                if (frm1.tabControl1.SelectedIndex == 5)
                {
                    frm1.fNearestXBox.Text = frm2XCoor.ToString();
                    frm1.fNearestYBox.Text = frm2YCoor.ToString();
                }

                if (frm1.getPosIndex == 1)
                {
                    frm1.startXBox.Text = frm2XCoor.ToString();
                    frm1.startYBox.Text = frm2YCoor.ToString();
                }

                /*if (frm1.getPosIndex == 2)
                {
                    frm1.endXBox.Text = frm2XCoor.ToString();
                    frm1.endYBox.Text = frm2YCoor.ToString();
                }*/

                if (frm1.getPosIndex == 3)
                {
                    frm1.cusXBox.Text = frm2XCoor.ToString();
                    frm1.cusYBox.Text = frm2YCoor.ToString();
                }

                this.Close();
            }
            else
            {
            }
        }

        private void frm2Cancel_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

    }
}