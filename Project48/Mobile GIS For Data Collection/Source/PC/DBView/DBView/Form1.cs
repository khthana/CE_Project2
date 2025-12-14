using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DBView
{
    public partial class Form1 : Form
    {

        private bool ExeClicked = false;
        private bool Created = false;
        private SqlConnection SQLConn = new SqlConnection();
        private SqlCommand SQLComm = new SqlCommand();
        private SqlDataReader SQLReader = null;
        private TreeNode _Tree = new TreeNode();
        private DataTable GlobalTable = new DataTable();
        private string CurrentTable;
        private string CurrentPrimary;
        //private LOGIN LoginForm = new LOGIN();
       //public ShowDataTable _DataTable = new ShowDataTable();
        
        private int SymbolIndex;
        //Load Bitmap Data
        private Bitmap _B1 = new Bitmap("PIC\\RedHouse.bmp");
        private Bitmap _B2 = new Bitmap("PIC\\BlueHouse.bmp");
        private Bitmap _B3 = new Bitmap("PIC\\YellowHouse.bmp");
        
        //Save Data Obj File
        private string FileName = "OBJ.DAT";
      
        //

        private string ConnectStr = "";

        private string Database, UID, Pass, ServerName;

        public void SetStrConnection(string Database1, string UID1, string Pass1, string ServerName1)
        {
            Database = Database1;
            UID = UID1;
            Pass = Pass1;
            ServerName = ServerName1;
        }
        public Form1()
        {
            
            InitializeComponent();
        }

        

        

        private void connectDBToolStripMenuItem_Click(object sender, EventArgs e)
        {

            //LoginForm.ShowDialog();

            //Database = LoginForm.GetDBName();
            //UID = LoginForm.GetUID();
            //Pass = LoginForm.GetPass();
            //ServerName = LoginForm.GetServer();

            ConnectStr = "Server=" + ServerName + ";" + "Database=" + Database + ";" + "Trusted_Connection = true;";
            //**********************************************
            string StrConn = ConnectStr; //"Server=WATTANIA\\SQLEXPRESS;Database=TEST;Trusted_Connection=true;";
            ///string StrConn = "Server=WATTANIA\\SQLEXPRESS;Database=TEST;Trusted_Connection = true;";

            SQLConn.ConnectionString = StrConn;



            try
            {
                SQLConn.Open();
                if (SQLConn.State == ConnectionState.Open)
                {
                    MessageBox.Show("Now Connected...");

                    //Show DB in TreeView
                    //Display

                    //ServerName = ServerName;
                    treeView1.Nodes.Add(ServerName);
                    treeView1.Nodes[0].ImageIndex = 3;
                    treeView1.Nodes[0].SelectedImageIndex = 3;

                    treeView1.Nodes.Add(Database);
                    treeView1.Nodes[1].ImageIndex = 0;
                    treeView1.Nodes[1].SelectedImageIndex = 0;

                    //Display table
                    //*treeView1.Nodes[1].Nodes.Add("1");
                    //treeView1.Nodes[1].Nodes[0].ImageIndex = 1;
                    //treeView1.Nodes[1].Nodes[0].SelectedImageIndex = 1;


                    //treeView1.Nodes[1].Nodes[0].Nodes.Add("1.1");
                    //treeView1.Nodes[1].Nodes[0].Nodes[0].ImageIndex = 2;
                    //treeView1.Nodes[1].Nodes[0].Nodes[0].SelectedImageIndex = 2;

                    //
                    ShowDB();
                }

            }
            catch (SqlException SE)
            {
                MessageBox.Show(SE.Message);
            }


        }

        private void ShowDB()
        {
            //Find all Table Name
            string TableName = "", TableTemp = "";
            string PKName = "";

            string StrComm = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES";
            string StrColumn1 = "SELECT * FROM";
            string FindPK = "select column_name,table_name from INFORMATION_SCHEMA.KEY_COLUMN_USAGE";
            SQLComm.CommandText = StrComm;
            SQLComm.Connection = SQLConn;
            SQLReader = SQLComm.ExecuteReader();

            //Get Table Name in TableName
            while (SQLReader.Read())
            {
                TableName = TableName + SQLReader.GetString(0) + ";";
                // aa = SQLReader.Read();
            }
            SQLReader.Close();
            //Find PK
            SQLComm.CommandText = FindPK;
            SQLComm.Connection = SQLConn;
            SQLReader = SQLComm.ExecuteReader();

            while (SQLReader.Read())
            {
                PKName = PKName + SQLReader.GetString(0) + "-" +
                    SQLReader.GetString(1) + ";";

            }
            SQLReader.Close();
            //
            //Initial TreeView

            //Find Character ';' in Table string
            int Num = TableName.Length;
            int i, NumberOfTable = 0, k = 0;
            for (i = 0; i < Num; i++)
            {
                if (TableName[i] == ';')
                {
                    TableTemp = TableName.Substring(k, i - k);
                    k = i + 1;
                    treeView1.Nodes[1].Nodes.Add(TableTemp);
                    treeView1.Nodes[1].Nodes[NumberOfTable].ImageIndex = 1;
                    treeView1.Nodes[1].Nodes[NumberOfTable].SelectedImageIndex = 1;
                    //Find Column in each table
                    SQLComm.CommandText = StrColumn1 + " " + TableTemp;
                    SQLReader = SQLComm.ExecuteReader();
                    ////while (SQLReader.Read())
                    ////{
                    int a = SQLReader.FieldCount;//a = Number of Column 
                    for (int index = 0; index < a; index++)
                    {
                        treeView1.Nodes[1].Nodes[NumberOfTable].Nodes.Add(SQLReader.GetName(index));
                        if (index != 0)
                        {
                            treeView1.Nodes[1].Nodes[NumberOfTable].Nodes[index].ImageIndex = 2;
                            treeView1.Nodes[1].Nodes[NumberOfTable].Nodes[index].SelectedImageIndex = 2;
                        }
                        else
                        {
                            treeView1.Nodes[1].Nodes[NumberOfTable].Nodes[index].ImageIndex = 4;
                            treeView1.Nodes[1].Nodes[NumberOfTable].Nodes[index].SelectedImageIndex = 4;
                        }
                    }
                    // aa = SQLReader.Read();
                    ////}
                    SQLReader.Close();

                    NumberOfTable++;
                }
            }





            /*
                        //Display

                        ServerName = ".\\SQLEXPRESS";
                        treeView1.Nodes.Add(ServerName);
                        treeView1.Nodes[0].ImageIndex = 3;
                        treeView1.Nodes[0].SelectedImageIndex = 3;

                        treeView1.Nodes.Add("TEST");
                        treeView1.Nodes[1].ImageIndex = 0;
                        treeView1.Nodes[1].SelectedImageIndex = 0;
            
                        //Display table
                        //*treeView1.Nodes[1].Nodes.Add("1");
                        treeView1.Nodes[1].Nodes[0].ImageIndex = 1;
                        treeView1.Nodes[1].Nodes[0].SelectedImageIndex = 1;

                        //column
                        treeView1.Nodes[1].Nodes[0].Nodes.Add("1.1");
                        treeView1.Nodes[1].Nodes[0].Nodes[0].ImageIndex = 2;
                        treeView1.Nodes[1].Nodes[0].Nodes[0].SelectedImageIndex = 2;
             */



        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //Create File
            FileStream _File = new FileStream(FileName, FileMode.Create);
            _File.Close();
            FileStream _File1 = new FileStream("Desc.dat", FileMode.Create);
            StreamWriter SR1 = new StreamWriter(_File1);
            SR1.Write(" , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , ,");
            SR1.Close();
            _File1.Close();
            //init Control
            treeView1.Enabled = false;

            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\db.ico")));         //0
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\table.ico")));      //1
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\Column.ico")));     //2
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\srv.ico")));        //3
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\PK.ico")));         //4

            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\dataFolder.ico"))); //5
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\empty.ico")));      //6

            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\redhouse.ico")));  //7
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\yellowhouse.ico")));   //8
            imageList1.Images.Add(new Bitmap(Image.FromFile("C:\\Documents and Settings\\Administrator\\My Documents\\Visual Studio 2005\\Projects\\DBView\\bluehouse.ico")));//9
            

            treeView1.ImageList = imageList1;
            DataOBJview.ImageList = imageList1;

            toolStripComboBox1.Items.Add(".\\SQLEXPRESS");
            toolStripTextBox1.Text = "TEST";

            
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void propertyGrid1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {

            ServerName = toolStripComboBox1.SelectedItem.ToString();
            Database = toolStripTextBox1.Text;
            SQLConn.ConnectionString = "Server=" + ServerName + ";" + "Database=" + Database + ";" + "Trusted_Connection = true;";
            try
            {
                SQLConn.Open();
                if (SQLConn.State == ConnectionState.Open)
                {
                    MessageBox.Show("Now Connected...");

                    treeView1.Enabled = true;
                    //Show DB in TreeView
                    //Display

                    //ServerName = ServerName;
                    treeView1.Nodes.Add(ServerName);
                    treeView1.Nodes[0].ImageIndex = 3;
                    treeView1.Nodes[0].SelectedImageIndex = 3;

                    treeView1.Nodes.Add(Database);
                    treeView1.Nodes[1].ImageIndex = 0;
                    treeView1.Nodes[1].SelectedImageIndex = 0;

                    //Display table
                    //*treeView1.Nodes[1].Nodes.Add("1");
                    //treeView1.Nodes[1].Nodes[0].ImageIndex = 1;
                    //treeView1.Nodes[1].Nodes[0].SelectedImageIndex = 1;


                    //treeView1.Nodes[1].Nodes[0].Nodes.Add("1.1");
                    //treeView1.Nodes[1].Nodes[0].Nodes[0].ImageIndex = 2;
                    //treeView1.Nodes[1].Nodes[0].Nodes[0].SelectedImageIndex = 2;

                    //
                    ShowDB();
                    SQLConn.Close();
                }
            }
            catch (SqlException SE)
            {
                MessageBox.Show(SE.Message);
            }
        }

        private void toolStripComboBox1_Click(object sender, EventArgs e)
        {

        }
/*
        private void button1_Click(object sender, EventArgs e)
        {
            ExeSQL(richTextBox1.Text);
        }
*/
        public void ExeSQL(string SQLStr)
        {
            if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
            if (SQLConn.State == ConnectionState.Open)
            {

                string STest = " " + SQLStr;//richTextBox1.Text;
                STest = "Select * From " + CurrentTable + " where " + comboBox3.SelectedItem.ToString() + " = '" + textBox1.Text + "'";
                richTextBox1.Text = STest;
                DataTable Table = new DataTable();
                try
                {
                    SqlDataAdapter SQLAd = new SqlDataAdapter(STest, SQLConn);

                    SQLAd.Fill(Table);
                    //SQLComm.CommandText = STest;
                    //SQLReader = SQLComm.ExecuteReader();

                    dataGridView1.DataSource = Table;


                    //_DataTable._T = Table;
                    //ShowTable();
                }

                catch (SqlException SE)
                {
                    MessageBox.Show(SE.Message);
                }
            }
            // ShowTable(); 
        }



        private void button4_Click_1(object sender, EventArgs e)
        {
            //   MessageBox.Show(dataGridView1.SelectedCells.Count.ToString());
            //   MessageBox.Show(dataGridView1.SelectedRows.Count.ToString());
            //  DataGridViewSelectedRowCollection ss  =  dataGridView1.SelectedRows;

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {

        }

        private void treeView1_MouseUp(object sender, MouseEventArgs e)
        {
            if (treeView1.Enabled)
            {
                /*
                TreeNode ss = new TreeNode(); 
                ss = treeView1.SelectedNode;
                
                if (e.Button == MouseButtons.Right)
                {
                    if (ss.ImageIndex == 1)
                    {
                        treeView1.ContextMenuStrip = contextMenuStrip_TreeView;
                        treeView1.ContextMenuStrip.Show(treeView1, new Point(e.X,e.Y));
                    }
                }*/
            }
        }

        private void treeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            TreeNode ss = new TreeNode();
            ss = treeView1.SelectedNode;

            if (e.Button == MouseButtons.Right)
            {
                treeView1.SelectedNode = e.Node;
                ss = e.Node;
                if (ss.ImageIndex == 1)
                {
                    treeView1.ContextMenuStrip = contextMenuStrip_TreeView;
                    treeView1.ContextMenuStrip.Show(treeView1, new Point(e.X, e.Y));
                    treeView1.ContextMenuStrip = null;


                }

            }
        }

        private void showTableToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ExeClicked = false;
            //ShowTable;;
            string GetTableText = "SELECT * From " + treeView1.SelectedNode.Text;
            //Set current table
            CurrentTable = treeView1.SelectedNode.Text;
            if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
            DataTable _T = new DataTable();
            SqlDataAdapter Ad = new SqlDataAdapter(GetTableText, SQLConn);

            Ad.Fill(_T);

            dataGridView1.DataSource = _T;

            dataGridView1.ContextMenuStrip = contextMenuStrip_DataGrid;

            
            //_DataTable._T = _T;
            //ShowTable();
            //Set Current Primary
            if (SQLConn.State == ConnectionState.Open) { SQLConn.Close(); } SQLConn.Open();
            GetTableText = "Select column_name,table_name From information_schema.key_column_usage where table_name= '" + CurrentTable+"'";
            SQLComm.CommandText = GetTableText;
            SQLReader = SQLComm.ExecuteReader();

            SQLReader.Read();
            CurrentPrimary = SQLReader.GetValue(0).ToString();
            SQLConn.Close();

            ShowQuery();
        }


        //DATA Object Viewer

        private void CreateDataObject()
        {
            //add DataObj in treeview
            DataOBJview.Nodes.Add("xxx");

        }
        /*
        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
        /*
        private void button3_Click_1(object sender, EventArgs e)
        {
            string OBJName;
            int NodeCount = 0;
            //CreateOBJ _Cc = new CreateOBJ();
            if (_Cc.ShowDialog() == DialogResult.OK)
            {
                OBJName = _Cc.GetOBJName();
                DataOBJview.Nodes.Add(OBJName);
                NodeCount = DataOBJview.Nodes.Count;
                DataOBJview.Nodes[NodeCount - 1].ImageIndex = 5;
                DataOBJview.Nodes[NodeCount - 1].SelectedImageIndex = 5;
            }
        }
        */
        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }

       
/*
        private void ShowTable()
        {
            if (_DataTable.Focused)
            {
            }
            else
            {
                try
                {
                    _DataTable.Show();
                    _DataTable.Focus();
                }
                catch (Exception ex)
                {
                    _DataTable = new ShowDataTable();
                    _DataTable.Show();
                    //  MessageBox.Show(ex.Message);
                }
            }
        }
*/

        private void SetAttribute(string _Att)
        {
            string ListOfAttribute = _Att;
            string ListTemp = ""; int k = 0;
            //Insert Attribute in Combobox
            for (int i = 0; i < ListOfAttribute.Length; i++)
            {
                if (ListOfAttribute[i] == ',')
                {
                    ListTemp = ListOfAttribute.Substring(k, i - k);
                    k = i + 1;

                    comboBox1.Items.Add(ListTemp);
                    comboBox2.Items.Add(ListTemp);


                    if (ListTemp == "Latitude")
                    {
                        comboBox1.SelectedIndex = comboBox1.Items.Count - 1;
                    }
                    if (ListTemp == "Longitude")
                    {
                        comboBox2.SelectedIndex = comboBox2.Items.Count - 1;
                    }
                }
            }
        }
        private void ShowQuery() {
            string List_of_Column ="";
            if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
            SQLComm.CommandText = "SELECT * FROM " + CurrentTable;
            //SQLConn.Open();
            SQLReader = SQLComm.ExecuteReader();

            int count = SQLReader.FieldCount;
            for (int i = 0; i < (count); i++)
            {
                List_of_Column = List_of_Column + SQLReader.GetName(i) + ",";
            }
            SQLConn.Close();

            string ListOfAttribute = List_of_Column;
            string ListTemp = ""; int k = 0;
            //Insert Attribute in Combobox
            for (int i = 0; i < ListOfAttribute.Length; i++)
            {
                if (ListOfAttribute[i] == ',')
                {
                    ListTemp = ListOfAttribute.Substring(k, i - k);
                    k = i + 1;

                    comboBox3.Items.Add(ListTemp);
                    


            
                }
            }
        }

        private void createToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Created = true;
            //dataGridView1.SelectedRows.
            
            string primary_key = "";
            string Table_name = "";
            string List_of_Column = "";
            //Check if the selected column
            #region Check if the selected column
            if (CheckSelectedRow())
            {MessageBox.Show("This row has been selected." );}
            else { 
                

                try
                {

                    if (SQLConn.State == ConnectionState.Closed)
                    {
                        SQLConn.Open();
                    }

                    SQLComm.CommandText = "Select table_name,column_name From information_schema.key_column_usage";
                    if (SQLConn.State == ConnectionState.Open) SQLConn.Close();
                    SQLConn.Open();
                    SQLReader = SQLComm.ExecuteReader();

                    while (SQLReader.Read())
                    {
                        primary_key = primary_key + SQLReader.GetString(0) + ":" + SQLReader.GetString(1) + ";";

                    }

                    SQLConn.Close();

                    SQLComm.CommandText = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES";
                    SQLConn.Open();
                    SQLReader = SQLComm.ExecuteReader();

                    while (SQLReader.Read())
                    {
                        Table_name = Table_name + SQLReader.GetString(0) + ";";

                    }

                    SQLConn.Close();
                    //Get List of Column
                    SQLComm.CommandText = "SELECT * FROM " + CurrentTable;
                    SQLConn.Open();
                    SQLReader = SQLComm.ExecuteReader();

                    int count = SQLReader.FieldCount;
                    for (int i = 0; i < (count); i++)
                    {
                        List_of_Column = List_of_Column + SQLReader.GetName(i) + ",";
                    }
                    SQLConn.Close();
                #endregion 
                    //////////////////////End Check if the selected column

                    if (!groupBox3.Enabled)
                    {
                        groupBox3.Enabled = true;
                        groupBox4.Enabled = true;

                        //1. Set Defalut Symbol
                        pictureBox2.Image = _B1;//
                        SymbolIndex = 1;
                        //2. Set List of Attribute
                        SetAttribute(List_of_Column);

                        //Find Column that not Primary key,Latitude,Longitude
                        string tempColumn = "";int k =0;
                        for (int i = 0; i < List_of_Column.Length; i++) {
                            if (List_of_Column[i] == ',') {
                                tempColumn = List_of_Column.Substring(k, i - k);
                                if ((tempColumn == comboBox1.SelectedItem.ToString()) || (tempColumn == comboBox2.SelectedItem.ToString())||(tempColumn==CurrentPrimary))
                                {
                                    k = i + 1;
                                }
                                else
                                {
                                    listBox1.Items.Add(List_of_Column.Substring(k, i - k));
                                    k = i + 1;
                                }
                            }
                        }
                        
                    }
                    else
                    {
                        MessageBox.Show("The Data Already Created..");
                    }

                    /*
                    // Do Not Show Dialog
                    /////////////////////////////////////////////
                    CreateOBJ CreateForm = new CreateOBJ();
                    CreateForm.SetAttribute(List_of_Column);
                    CreateForm.ShowDialog();

                    if (CreateForm.DialogResult == DialogResult.OK)
                    {
                        int indexSymbol = CreateForm.GetIndexOfSymbol();
                        string StrOBJ = CreateForm.GetOBJName();
                        AddOBJinTreeView(StrOBJ, indexSymbol, primary_key, Table_name, List_of_Column);
                    }
                     */
                    //////////////////////////////////////////////
                     
                }
                catch (Exception SE)
                {
                    MessageBox.Show(SE.Message.ToString());
                }
               
            }
            
        }

        private void UpdateData(string _dat)
        {//_dat = "[ATTRIB]x,x,[Desc]" 
            string Att = ""; string Des = "";
            int a = _dat.IndexOf("[ATTRIB]");
            int b = _dat.IndexOf("[Desc]");

            Att = _dat.Substring(a + 8, b - (a + 8));
            Des = _dat.Substring(b + 6);
            //Attribute = Att;


            //Find number of Attribute
            int AttCount = 0;
            string DesTemp = "";
            for (int i = 0; i < Att.Length; i++)
            {
                if (Att[i] == ',')
                {
                    DesTemp = DesTemp + " ,";
                    AttCount++;
                }
            }
            Des = DesTemp;

            //Update DES in file
            FileStream _File = new FileStream("OBJ.dat", FileMode.Open);
            StreamReader SR = new StreamReader(_File);

            string Dat = SR.ReadLine();
            SR.Close();
            _File.Close();

            //a = Dat.IndexOf(DatName);
            //Find First [Desc]
            b = Dat.IndexOf("[Desc]", a) + 6;

            //Attribute in List box
            //Find Column
            int k = 0;
            for (a = 0; a < Att.Length; a++)
            {
                if (Att[a] == ',')
                {
                    listBox1.Items.Add(Att.Substring(k, a - k));
                    k = a + 1;
                }
            }

        }

        private void UpdateDesc_in_File(string p/*Desc*/, int n/*position*/, int q/*total Attrib*/)
        {
            //read all data in Desc.dat
            FileStream _File = new FileStream("Desc.dat", FileMode.Open);
            StreamReader SR = new StreamReader(_File);
            //int position = 0;
            string ss = SR.ReadLine();
            SR.Close();
            _File.Close();

            //int a = FindPosition(1, "xxx,xxx,xxx,X,");
            //remove at that position
            if (n == 0)
            {
                ss = ss.Remove(0, FindPosition(0, ss));
                ss = ss.Insert(0, richTextBox2.Text + ",");
                FileStream _File1 = new FileStream("Desc.dat", FileMode.Open);
                StreamWriter SR1 = new StreamWriter(_File1);
                SR1.Write(ss);
                SR1.Close();
                _File1.Close();

            }
            else
            {
                ss = ss.Remove(FindPosition(n - 1, ss), FindPosition(n, ss) - FindPosition(n - 1, ss));
                ss = ss.Insert(FindPosition(n - 1, ss), richTextBox2.Text);
                FileStream _File1 = new FileStream("Desc.dat", FileMode.Open);
                StreamWriter SR1 = new StreamWriter(_File1);
                SR1.Write(ss + ",");
                SR1.Close();
                _File1.Close();
            }

        }

        private int FindPosition(int n, string str)
        {
            char _CH = ' '; bool stop = false;
            int pos = 0; int count = -1;
            while (!stop)
            {
                _CH = str[pos];
                if (_CH == ',')
                {
                    count++;
                }
                pos++;
                if (count == n)
                {
                    stop = true;
                }

            }
            return pos;
        }
        
        private bool CheckSelectedRow()
        {
            bool Selected=true;
            string Pri = "[Pri]";
            string Input="";

            Pri = Pri + dataGridView1.SelectedCells[0].Value.ToString();

            FileStream _File = new FileStream(FileName,FileMode.Open);
            StreamReader SR = new StreamReader(_File);

            Input = Input + SR.ReadLine();

            Selected = Input.Contains(Pri);


            SR.Close();
            _File.Close();

            return Selected;
        }
/*
        private void AddOBJinTreeView(string OBJName,int SymbolIndex,string Pri,string Tname,string ListColumn)
        {
            //Find Pri Value 
                //find column name that follow 'CurrentTable'
                string xx = "";
                int x = Pri.IndexOf(CurrentTable);
                int count1=x;
                char GetChr =' ';
                while (GetChr != ':') {
                    xx = xx + Pri[count1];
                    GetChr = Pri[count1];
                    count1++;
                }//xx = "CurrentTable:"count1 = Starting Point of Primary key
                xx = "";
                while (GetChr != ';')
                {
                    xx = xx + Pri[count1];
                    GetChr = Pri[count1];
                    count1++;
                }
                xx = xx.Substring(0,xx.Length - 1);//xx = Column's Name of Primary Name
            //Find Value of Primar Key
                if (SQLConn.State== ConnectionState.Closed) SQLConn.Open();
                string PriValue = "";
                SQLComm.CommandText = "Select " + xx + " from " + CurrentTable;
                object a12 = dataGridView1.SelectedRows[0].Cells[0].Value;
                PriValue = a12.ToString();
             // MessageBox.Show(PriValue);
            //End 'Find Pri Value'
             
            //Find Lat & Lon Value
            string Lat="",Lon="";

            string LatValue = "Select Latitude From " + CurrentTable + " where " + xx + " = " + PriValue;
            if (SQLConn.State == ConnectionState.Closed) SQLConn.Open();
            SQLComm.CommandText = LatValue;
            SQLReader = SQLComm.ExecuteReader();
            SQLReader.Read();

            Lat = SQLReader.GetString(0);

            SQLConn.Close();
            SQLConn.Open();
            string LonValue = "Select Longitude From " + CurrentTable + " where " + xx + " = " + PriValue;
            if (SQLConn.State == ConnectionState.Closed) SQLConn.Open();
            SQLComm.CommandText = LonValue;
            SQLReader = SQLComm.ExecuteReader();
            SQLReader.Read();

            Lon = SQLReader.GetString(0);
            //Find 
            SQLConn.Close();

            //Delete Pri,Latitude,Longitude in 'ListColumn'
            // 1.Find first ","
            char i = ' '; int count = 0;
            
            while (i != ',') {
                i = ListColumn[count];
                count++;
            }
            string NewColumn = ListColumn.Remove(0, count);
            string LatLon = "Latitude,Longitude,";
            // 2.Delete "Latitude,Longitude," from 'NewColumn'
            int ii = NewColumn.IndexOf("Latitude,Longitude,");
            int j = LatLon.Length;

            NewColumn = NewColumn.Remove(ii,j);
           
            DataOBJview.Nodes.Add(OBJName);
            int a = DataOBJview.Nodes.Count;
            switch(SymbolIndex){
                case  1: {
                    DataOBJview.Nodes[a-1].ImageIndex = 7;
                    DataOBJview.Nodes[a - 1].SelectedImageIndex = 7;
                }break;
                case  2: {
                    DataOBJview.Nodes[a-1].ImageIndex = 8;
                    DataOBJview.Nodes[a - 1].SelectedImageIndex = 8;
                }break;
                case  3: {
                    DataOBJview.Nodes[a-1].ImageIndex = 9;
                    DataOBJview.Nodes[a - 1].SelectedImageIndex = 9;
                }break;
            }

            if (SQLConn.State == ConnectionState.Closed) SQLConn.Open();
            string LatStr = "Select Latitude from "+CurrentTable + " where ID = "+xx;
            SQLComm.CommandText = LatStr;
            SQLReader = SQLComm.ExecuteReader();
            SQLReader.Read();
            LatStr = SQLReader.GetString(0);

            //Find Number of Attribute
        
            //Write Obj to File
           
            FileStream _File = new FileStream(FileName, FileMode.Append);
            StreamWriter SW = new StreamWriter(_File);
            string SaveStr = "[NAME]"+OBJName + ";[DBNAME]" + Database + ";[TABLE]" + CurrentTable + ";[Pri]" + PriValue+ ";[ICON]" + SymbolIndex + ";"
                +"[LAT]"+Lat+";[LON]"+Lon+";[ATTRIB]"+NewColumn+"[Desc]";
            
            SW.Write(SaveStr+"_");
            SW.Close();
            _File.Close();
           
            

        }
        */
        private void dataGridView1_MouseUp(object sender, MouseEventArgs e)
        {
           
        }

        private void DataOBJview_MouseUp(object sender, MouseEventArgs e)
        {

        }

        private void DataOBJview_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            TreeNode ss = new TreeNode();
            ss = DataOBJview.SelectedNode;

            if (e.Button == MouseButtons.Right)
            {
                DataOBJview.SelectedNode = e.Node;
                ss = e.Node;

                DataOBJview.ContextMenuStrip = contextMenuStrip_ObjView;
                DataOBJview.ContextMenuStrip.Show(DataOBJview, new Point(e.X, e.Y));
                DataOBJview.ContextMenuStrip = null;
            }
        }
        /*
        private void editAttributeToolStripMenuItem_Click(object sender, EventArgs e)
        {

            EditMode();
        }

        private void EditMode()
        {

            //Get All Attribute
            TreeNode TN = new TreeNode();
            TN = DataOBJview.SelectedNode;

            Edit_Attribute ED = new Edit_Attribute(TN.Text);
  
            ED.ShowDialog();
        }
*/
        private void aciveSyncToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //EXPORT TO MOBILE  ////
            XMLConverter XML1 = new XMLConverter();
            string LAT = "";
            string LON = "";

            //Get LATLON
            if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
            SQLComm.CommandText = "Select Latitude,Longitude From " + CurrentTable;
            SQLReader = SQLComm.ExecuteReader();

            int a = SQLReader.FieldCount;
            //Latitude
            while(SQLReader.Read()){
                LAT += SQLReader.GetString(0) + ",";
                LON += SQLReader.GetString(1) + ",";
            }
            //==========
            int MaxLAT, MinLAT, MaxLON, MinLON;
            int NumLAT=0;
            int NumLON=0;
            
            // 1.Find number of Lat
            for(int i=0;i<LAT.Length;i++){
                //int NumLat =
                if (LAT[i] == ',') {
                    NumLAT++;
                }
            }
            for (int j = 0; j < LAT.Length; j++)
            {
                //int NumLat =
                if (LAT[j] == ',')
                {
                    NumLON++;
                }
            }
            string Temp;
            int[] _LAT = new int[NumLAT];
            for (int i = 0; i < NumLAT; i++) { 

            }
            ////////****
            string ss1 = "";

            int k = 0;
            int count = 0;

            int[] _LON = new int[NumLON];

            for (int a1 = 0; a1 < LAT.Length; a1++)
            {
                if (LAT[a1] == ',')
                {
                    
                   ss1 = (LAT.Substring(k, a1 - k));
                   _LAT[count] = int.Parse(ss1);
                   count++;
                    k = a1 + 1;
                }
            }
            ////////****
            count = 0; k = 0;
            for (int a1 = 0; a1 < LON.Length; a1++)
            {
                if (LON[a1] == ',')
                {

                    ss1 = (LON.Substring(k, a1 - k));
                    _LON[count] = int.Parse(ss1);
                    count++;
                    k = a1 + 1;
                }
            }

            //Find MaxLat;
            MaxLAT = _LAT[NumLAT - 1];
            for(int i = 0; i < NumLAT; i++) { 
                MaxLAT = Math.Max(MaxLAT,_LAT[i]);
            }
                //Find MinLat;
            MinLAT = _LAT[NumLAT - 1];
            for (int i = 0; i < NumLAT ; i++)
            {
                MinLAT = Math.Min(MinLAT, _LAT[i]);
            }
                //Find MaxLon;
            MaxLON = _LON[NumLON - 1];
            for(int i=0;i<NumLON;i++){
                MaxLON = Math.Max(MaxLON,_LON[i]);
            }

                //Find MinLon;
            MinLON = _LON[NumLON - 1];
            for(int i=0;i<NumLON;i++){
                MinLON = Math.Min(MinLON,_LON[i]);
            }
                int X,Y,SX,SY;
            X = MinLAT-50;
            Y = MaxLON+50;
            SX = 50+(MaxLAT-MinLAT)+50;
            SY = 50+(MaxLON-MinLON)+50;
            XML1.ConvertNow(X, Y, SX, SY);
            
            //SVGDATA SVGdat = new SVGDATA();
            SyncForm SF = new SyncForm();
            SF.ShowDialog();

           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ExeClicked = true;
            ExeSQL(richTextBox1.Text);
            //SVGDATA ss = new SVGDATA();
            //richTextBox1.Text = ss.GetYello();
        }

        private void button2_Click_2(object sender, EventArgs e)
        {
            ChooseSymbol Choose = new ChooseSymbol();
            int i;
            Choose.ShowDialog();
            if (Choose.DialogResult == DialogResult.OK) {
                i = Choose.GetSymbolIndex();
                SymbolIndex = i;
                if (i == 1){ pictureBox2.Image = _B1 ;}else
                if (i == 2){ pictureBox2.Image = _B2 ;}else
                if (i == 3) { pictureBox2.Image = _B3; };
            }
        }

        private void button3_Click_2(object sender, EventArgs e)
        {
            UpdateDesc_in_File(richTextBox2.Text, listBox1.SelectedIndex, listBox1.Items.Count);
        }

        private void listBox1_MouseClick(object sender, MouseEventArgs e)
        {
            

            if (e.Button == MouseButtons.Left)
            {
                showText(listBox1.SelectedIndex + 1);

            }
        }//end function

        private void showText(int p)
        {
            FileStream _File = new FileStream("Desc.dat", FileMode.Open);
            StreamReader SR = new StreamReader(_File);

           string Description = SR.ReadLine();
            SR.Close();
            _File.Close();

            int k = 0;
            int count = 0;
            for (int a = 0; a < Description.Length; a++)
            {
                if (Description[a] == ',')
                {
                    count++;
                    if (count == p)
                    {
                        richTextBox2.Text = (Description.Substring(k, a - k));

                    }
                    k = a + 1;
                }
            }
        }

        //Save to file
        private void toolStripButton1_Click_1(object sender, EventArgs e)
        {
            if (Created)
            {
                int i = 0;
                string DBNAME = "[DBNAME]" + Database + ";";
                string TABLENAME = "[TBNAME]" + CurrentTable + ";";
                //Find Attribute
                string ATTRIBUTE = "[ATTRIBUTE]";
                int a = listBox1.Items.Count;
                for (i = 0; i < a; i++)
                {
                    ATTRIBUTE = ATTRIBUTE + listBox1.Items[i] + ",";
                }
                ATTRIBUTE += ";";
                string DESCRIPTION = "[DESCRIPTION]";
                FileStream _File = new FileStream("Desc.dat", FileMode.Open);
                StreamReader SR = new StreamReader(_File);

                string SS = SR.ReadLine();
                //Find ','
                int count = 0; bool STOP = false;
                i = 0;
                while (!STOP)
                {
                    if (SS[i] == ',') count++;
                    i++;
                    if (count == a) STOP = true;
                }

                SR.Close();
                _File.Close();

                DESCRIPTION = "[DESCRIPTION]" + SS.Substring(0, i) + ";";

                string SYMBOL = "[SYMBOL]" + SymbolIndex.ToString();
                /////////////////////////////////////
                string HeaderSave = DBNAME + TABLENAME + ATTRIBUTE + DESCRIPTION + SYMBOL + ";";
                /////////////////////////////////////
                int row = dataGridView1.RowCount;

                if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
                string GetStr = "";
                if (ExeClicked == true)
                {
                    GetStr = "select " + CurrentPrimary + "," + comboBox1.SelectedItem.ToString() + "," + comboBox2.SelectedItem.ToString()
                    + " from " + CurrentTable + " where " + comboBox3.SelectedItem.ToString() + " = '" + textBox1.Text + "'";
                }
                else
                {
                    GetStr = "select " + CurrentPrimary + "," + comboBox1.SelectedItem.ToString() + "," + comboBox2.SelectedItem.ToString()
                    + " from " + CurrentTable;
                }
                SQLComm.CommandText = GetStr;
                SQLReader = SQLComm.ExecuteReader();
                int a1 = SQLReader.FieldCount; ;
                GetStr = "";
                while (SQLReader.Read())
                {
                    GetStr += "-[PRIMARY]" + SQLReader.GetValue(0) + ";+[LAT]" + SQLReader.GetValue(1) + ";*[LON]" + SQLReader.GetValue(2) + ";_";
                }
                /*
                string Path = "";
                SaveFileDialog SD = new SaveFileDialog();
                SD.Filter = "SSS(*.sss)|*.sss";
                if (SD.ShowDialog() == DialogResult.OK) {
                    Path = SD.FileName;
                }
                */
                FileStream _F = new FileStream("save.dat", FileMode.Create);
                StreamWriter SW1 = new StreamWriter(_F);

                SW1.Write(HeaderSave + "<>" + GetStr);
                SW1.Close();
                _F.Close();
            }
            else {
                MessageBox.Show("Please Create Data First");
            }
        }

        private void fileToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            //Read from File
            ReadXML XM = new ReadXML("C:\\MapView\\RXMLDAT.xml");
            UpdateDB(XM.GetData());
            
            



        }

        private void UpdateDB(string ss)//_[pri];[column];[value];_[pri];[column];[value];_[pri]..... 
        {
            int nn = 0;
            string Pri = " ";
            string Column = " ";
            string Value = " ";
            char _char = ' ';
            for (int i=0; i < ss.Length; i++) {
                _char = ss[i];
                if (_char == '_') {
                    nn = FindFirstEnd(i, ss); //Find First ";"
                    Pri = ss.Substring(i+1, nn - i);
                    //Find Column Name
                }
                if (_char == '+') {
                    nn = FindFirstEnd(i, ss); //Find First ";"
                    Column = ss.Substring(i + 1, nn - i);
                }
                if (_char == '*') {
                    nn = FindFirstEnd(i, ss); //Find First ";"
                    Value = ss.Substring(i + 1, nn - i);
                    if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
                    string comm = "update " + CurrentTable + " set " + Column + " = '" + Value + "' where " + CurrentPrimary + " = '" + Pri+"'";
                    SQLComm.CommandText = comm;
                    SQLReader = SQLComm.ExecuteReader();
                    SQLConn.Close();

                }
                
                

            }

        }
        private int FindFirstEnd(int current,string ss) {
            char _ch = ' '; int n = current;
            int count = n;
            while(_ch!=';'){
                _ch = ss[n];
                count++;
                n++;
            }
            return count-2;
            
        }

        private void button4_Click_2(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            
        }

        private void activeSyncToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Import From Mobile Device
            SyncForm SF = new SyncForm();
            SF.ShowDialog();
            if (SF.DialogResult == DialogResult.OK) {
                ReadXML XM = new ReadXML("\\Program Files\\MapView\\RXMLDAT.xml");
                UpdateDB(XM.GetData());
            }
        }

        private void fileToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            //Export To File
            //EXPORT TO MOBILE  ////
            XMLConverter XML1 = new XMLConverter();
            string LAT = "";
            string LON = "";

            //Get LATLON
            if (SQLConn.State == ConnectionState.Open) SQLConn.Close(); SQLConn.Open();
            SQLComm.CommandText = "Select Latitude,Longitude From " + CurrentTable;
            SQLReader = SQLComm.ExecuteReader();

            int a = SQLReader.FieldCount;
            //Latitude
            while (SQLReader.Read())
            {
                LAT += SQLReader.GetString(0) + ",";
                LON += SQLReader.GetString(1) + ",";
            }
            //==========
            int MaxLAT, MinLAT, MaxLON, MinLON;
            int NumLAT = 0;
            int NumLON = 0;

            // 1.Find number of Lat
            for (int i = 0; i < LAT.Length; i++)
            {
                //int NumLat =
                if (LAT[i] == ',')
                {
                    NumLAT++;
                }
            }
            for (int j = 0; j < LAT.Length; j++)
            {
                //int NumLat =
                if (LAT[j] == ',')
                {
                    NumLON++;
                }
            }
            string Temp;
            int[] _LAT = new int[NumLAT];
            for (int i = 0; i < NumLAT; i++)
            {

            }
            ////////****
            string ss1 = "";

            int k = 0;
            int count = 0;

            int[] _LON = new int[NumLON];

            for (int a1 = 0; a1 < LAT.Length; a1++)
            {
                if (LAT[a1] == ',')
                {

                    ss1 = (LAT.Substring(k, a1 - k));
                    _LAT[count] = int.Parse(ss1);
                    count++;
                    k = a1 + 1;
                }
            }
            ////////****
            count = 0; k = 0;
            for (int a1 = 0; a1 < LON.Length; a1++)
            {
                if (LON[a1] == ',')
                {

                    ss1 = (LON.Substring(k, a1 - k));
                    _LON[count] = int.Parse(ss1);
                    count++;
                    k = a1 + 1;
                }
            }

            //Find MaxLat;
            MaxLAT = _LAT[NumLAT - 1];
            for (int i = 0; i < NumLAT; i++)
            {
                MaxLAT = Math.Max(MaxLAT, _LAT[i]);
            }
            //Find MinLat;
            MinLAT = _LAT[NumLAT - 1];
            for (int i = 0; i < NumLAT; i++)
            {
                MinLAT = Math.Min(MinLAT, _LAT[i]);
            }
            //Find MaxLon;
            MaxLON = _LON[NumLON - 1];
            for (int i = 0; i < NumLON; i++)
            {
                MaxLON = Math.Max(MaxLON, _LON[i]);
            }

            //Find MinLon;
            MinLON = _LON[NumLON - 1];
            for (int i = 0; i < NumLON; i++)
            {
                MinLON = Math.Min(MinLON, _LON[i]);
            }
            int X, Y, SX, SY;
            X = MinLAT - 50;
            Y = MaxLON + 50;
            SX = 50 + (MaxLAT - MinLAT) + 50;
            SY = 50 + (MaxLON - MinLON) + 50;
            XML1.ConvertNow(X, Y, SX, SY);

            //SVGDATA SVGdat = new SVGDATA();
            //

        }
    }
}