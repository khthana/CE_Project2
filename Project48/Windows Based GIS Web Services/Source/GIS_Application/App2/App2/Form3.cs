using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Xml;
namespace App2
{
    public partial class Form3 : Form
    {
        public Form1 frm1;
        string[] layer;
        //string[] selectedLayer = new string[20];
        //int index = 0;
            
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            try
            {
                GisWebService.Service service = new GisWebService.Service();

                string capabilities = service.GetCapabilities();
                int tmp = 0;
                TextReader temp = new StringReader(capabilities);
                XmlTextReader tempReader = new XmlTextReader(temp);

                while (tempReader.Read())
                {
                    if (tempReader.NodeType == XmlNodeType.Element)
                    {
                        if (tempReader.Name == "Layer") tmp++;
                    }
                }

                layer = new string[tmp];


                TextReader txtReader = new StringReader(capabilities);
                XmlTextReader xmlReader = new XmlTextReader(txtReader);
                int i = 0;
                while (xmlReader.Read())
                {
                    if (xmlReader.NodeType == XmlNodeType.Element)
                    {
                        if (xmlReader.Name == "LayerName")
                        {
                            layer[i] = xmlReader.ReadElementString();
                            i++;
                        }
                    }
                }
                listBox1.Items.Clear();

                for (int j = 0; j < layer.Length; j++)
                    listBox1.Items.AddRange(new object[] { layer[j] });
            }
            catch (Exception exc)
            { }
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!listBox2.Items.Contains(listBox1.SelectedItem))
                {
                    listBox2.Items.AddRange(new object[] { listBox1.SelectedItem });
                    //selectedLayer[index] = layer[listBox1.SelectedIndex];
                    //index++;                
                }
            }
            catch (Exception exc)
            {
            
            }
        }

        private void buttonRemove_Click(object sender, EventArgs e)
        {
            try 
            {
                 listBox2.Items.Remove(listBox2.SelectedItem);
                 //index--; 
                    
            }
            catch (Exception exc)
            {

            }
        }

        private void buttonOK_Click(object sender, EventArgs e)
        {

            frm1.layerList.Items.Clear();
            frm1.layerList.Items.AddRange(listBox2.Items);
            frm1.findSelectLayerList.Items.Clear();
            frm1.findSelectLayerList.Items.AddRange(listBox2.Items);
            frm1.fNearestListbox.Items.Clear();
            frm1.fNearestListbox.Items.AddRange(listBox2.Items);
            frm1.usList.Items.AddRange(listBox2.Items);

            int tmp = listBox2.Items.Count;

            frm1.layer = new string[tmp];
            frm1.txtFill = new string[tmp];
            frm1.txtStroke = new string[tmp];
            frm1.fillColor = new Color[tmp];
            frm1.strokeColor = new Color[tmp];


            for (int i = 0; i < tmp; i++)
            {   
                listBox2.SelectedIndex=i;
                frm1.layer[i] = listBox2.SelectedItem.ToString();
            
            }

            for (int i = 0; i < tmp; i++)
            {
                frm1.txtFill[i] = "none";
                frm1.txtStroke[i] = "black";                
            }


            this.Close();

        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}