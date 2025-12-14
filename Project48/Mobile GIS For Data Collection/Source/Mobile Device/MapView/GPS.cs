using System;
using System.Collections.Generic;
using System.Text;
using GPSExample.Util;
using System.Windows.Forms;

namespace MapView
{
    class GPS{
        private Form1 ff = new Form1();
        private double lat;
        private double lon;
        public void _GPS_OnGPSReadStop(object sender, EventArgs e)
        {
            MessageBox.Show("Stop");
            //MessageBox.Show("Stop Read "+e.ToString());
            //textBox1.Text = "Stoped !";
        }

        public void _GPS_OnGPSReadStart(object sender, EventArgs e)
        {
            MessageBox.Show("Start");
            //MessageBox.Show("Start Read "+e.ToString());
            //textBox1.Text = "Now Reading ...";
        }
        public void _GPS_OnGPSMessage(object sender, GPSEventArgs arg)
        {

            //listBox1.Items.Insert(0, arg.MessageText);
            //if (listBox1.Items.Count > 1)
             //   listBox1.Items.RemoveAt(1);
            //textBox2.Text = arg.Lat.ToString();
            //textBox3.Text = arg.Lon.ToString();
        }
        public double getlat()
        {
            return lat;
        }
        public double getlon()
        {
            return lon;
        }
    }
}
