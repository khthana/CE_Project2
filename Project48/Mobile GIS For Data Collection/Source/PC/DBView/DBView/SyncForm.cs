using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using OpenNETCF.Desktop.Communication;

namespace DBView
{
    public partial class SyncForm : Form
    {
        RAPI m_rapi;
        private string Conned = "Unknow";
        private bool Connected = true;
        private string Discon = "Not Connected";
        public SyncForm()
        {
            InitializeComponent();
            m_rapi = new RAPI();
            Connected = false;
            // wire in some ActiveSync events
            m_rapi.ActiveSync.Active += new ActiveHandler(ActiveSync_Active);
            m_rapi.ActiveSync.Disconnect += new DisconnectHandler(ActiveSync_Disconnect);
            m_rapi.ActiveSync.Listen += new ListenHandler(ActiveSync_Listen);
            m_rapi.ActiveSync.Answer += new AnswerHandler(ActiveSync_Answer);

            m_rapi.RAPIConnected += new RAPIConnectedHandler(m_rapi_RAPIConnected);
            m_rapi.RAPIDisconnected += new RAPIConnectedHandler(m_rapi_RAPIDisconnected);

        }

        private void ActiveSync_Active()
        {
            label2.Text = "Connected";
            //Label2.Text = "Connected";
        }


        private void ActiveSync_Disconnect()
        {
            label2.Text = "Disconnected";
        }

        private void ActiveSync_Listen()
        {

            label2.Text = "Not connected";
        }

        private void ActiveSync_Answer()
        {
            label2.Text = "Connecting...";
        }

        private void SyncForm_Load(object sender, EventArgs e)
        {
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //Asynchronus Connect Don't use time out
            m_rapi.Connect(false, -1);
            
            
            if (Conned == "Connected") {
                label2.Text = Conned;
                button4.Enabled = false;
                
            }
        }

        private void m_rapi_RAPIConnected()
        {

            SetConnect(1);
            
        }

        private void m_rapi_RAPIDisconnected()
        {
            SetConnect(2);
            
        }

        private void SetConnect(int SS) {
            if(SS == 1){
                Conned = "Connected";
                Connected=true;}
            else if(SS == 2){
                Conned = "Not Connected";
                Connected = false;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            m_rapi.Disconnect();
            this.DialogResult = DialogResult.OK;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Connected)
            {
                //Load file to mobile
                m_rapi.CopyFileToDevice("c:\\MapView\\XMLDat.xml", "\\Program Files\\MapView\\XMLDAT.xml", true);

                ///

            }
            else {
                MessageBox.Show("Status must be \"Connected\"");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (Connected)
            {
                //Get the file From mobile
                m_rapi.CopyFileFromDevice("c:\\Program Files\\MapView\\rxmldat.xml", "\\Program Files\\MapView\\rxmldat.xml", true);

                ///

            }
            else
            {
                MessageBox.Show("Status must be \"Connected\"");
            }
        }
    }
}