using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlServerCe;
using System.Xml;
using Intesis.eSVG;
using System.IO;

namespace MapView
{
    public partial class Form2 : Form
    {
        private ReadAttributeX Ratt;
        private int check2 = 0;
        string nodeCheckxx = null;
        private String node;
        private int i = 0;
        private int j = 0;
        private int numberofatt;
        public string s;
        private string path = "\\My Documents\\Personal\\XMLDAT.xml";
        private string pathsvg = "\\My Documents\\Personal\\maptest3.svg";
        private string []columnnew = new string[20];
        private string []valuenew = new string[20];
        public Form2()
        {
            InitializeComponent();
            //ff = new fieldfactory(this);
                    
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            list.Items.Clear();
            txtValue.Text = "";
            lblName.Text = "";
            Ratt = new ReadAttributeX();
            Ratt.read(s);
            //MessageBox.Show(Ratt.numberofatt.ToString());

            for (int l = 0; l < Ratt.numberofatt; l++)
            {
                columnnew[l] = Ratt.column[l];
                valuenew[l] = Ratt.value[l];
                //MessageBox.Show(columnnew[l]);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            list.Items.Clear();
            for (int i = 0; i < Ratt.numberofatt;i++) //column.Length; i++)
            {
                list.Items.Add(columnnew[i] + " : " + valuenew[i]);
            }
        }

        private void list_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int index = list.SelectedIndex;
            if (index < 0)
            {
                MessageBox.Show("Please Fix Data");
            }
            else
            {
                lblName.Text = columnnew[index];
                txtValue.Text = valuenew[index];
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int index = list.SelectedIndex;
            valuenew[index] = txtValue.Text;
            list.Items.Clear();
            for (int i = 0; i < Ratt.numberofatt;i++)//Ratt.column.Length; i++)
            {
                list.Items.Add(columnnew[i] + " : " + valuenew[i]);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            int f = 0;
            for(int p=0;p<Ratt.numberofatt;p++)
            {
                if(Ratt.value[p]!=valuenew[p])
                {
                    f++;
                    Ratt.value[p] = valuenew[p];
                }
            }
            if (f > 0)
            {
                Ratt.updatenode(s);
            }

            this.Close();
        }
       
    }
}