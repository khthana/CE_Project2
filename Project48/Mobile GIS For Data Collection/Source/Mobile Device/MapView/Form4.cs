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
    public partial class Form4 : Form
    {
        private ReadAttributeX Ratt;
        public int index;
        public Form4()
        {
            InitializeComponent();
        }

        private void list_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void list_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            index = list.SelectedIndex;
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            index = -1;
            list.Items.Clear();
            Ratt = new ReadAttributeX();
            Ratt.Read_Node();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            list.Items.Clear();
            for (int i = 0; i < Ratt.numberofnode; i++) //column.Length; i++)
            {
                list.Items.Add("ID :"+Ratt.node_ID[i]+" Lat:"+Ratt.latn[i]+" Lon:"+Ratt.lonn[i]);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }

        public string GetIndex()
        {
            string noclick = "noclick";
            if (index >= 0)
            {
                return Ratt.node_ID[index];
            }
            else
            {
                return noclick;
            }
        }
    }
}