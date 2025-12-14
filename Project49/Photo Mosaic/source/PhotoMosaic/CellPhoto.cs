using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;
using System.Net;

namespace PhotoMosaic
{
	public class CellPhoto : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ListView listView;
		private System.Windows.Forms.Label lab_total;
		private System.Windows.Forms.Button btn_AddCellPhoto;
		private System.Windows.Forms.Button btn_ok;
		private System.Windows.Forms.Button btn_Cancel;
		private System.Windows.Forms.Button btn_ClearAll;
		private System.Windows.Forms.Button btn_Delete;
		private System.Windows.Forms.ProgressBar ProgressBar;
        private Label label1;
        private Label labLibraryName;
        private Button btnLoadLibrary;
        private Button btnSaveLibrary;
        private Button btnNewLibrary;
		private System.ComponentModel.IContainer components;

		public CellPhoto(ImageList MainImagelist,ArrayList PicElementPath,bool libraryChange)
		{
			imagelistCell = CloneImageList(MainImagelist,imagelistCell);
			PicElementPathCell = (ArrayList)PicElementPath.Clone();
            this.libraryChange = libraryChange;
			InitializeComponent();

		}
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.listView = new System.Windows.Forms.ListView();
            this.btn_AddCellPhoto = new System.Windows.Forms.Button();
            this.lab_total = new System.Windows.Forms.Label();
            this.btn_ok = new System.Windows.Forms.Button();
            this.btn_Cancel = new System.Windows.Forms.Button();
            this.btn_ClearAll = new System.Windows.Forms.Button();
            this.btn_Delete = new System.Windows.Forms.Button();
            this.ProgressBar = new System.Windows.Forms.ProgressBar();
            this.label1 = new System.Windows.Forms.Label();
            this.labLibraryName = new System.Windows.Forms.Label();
            this.btnLoadLibrary = new System.Windows.Forms.Button();
            this.btnSaveLibrary = new System.Windows.Forms.Button();
            this.btnNewLibrary = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listView
            // 
            this.listView.Location = new System.Drawing.Point(164, 37);
            this.listView.Name = "listView";
            this.listView.Size = new System.Drawing.Size(520, 400);
            this.listView.TabIndex = 18;
            this.listView.UseCompatibleStateImageBehavior = false;
            this.listView.View = System.Windows.Forms.View.List;
            this.listView.SelectedIndexChanged += new System.EventHandler(this.listView_SelectedIndexChanged);
            // 
            // btn_AddCellPhoto
            // 
            this.btn_AddCellPhoto.Location = new System.Drawing.Point(12, 177);
            this.btn_AddCellPhoto.Name = "btn_AddCellPhoto";
            this.btn_AddCellPhoto.Size = new System.Drawing.Size(128, 24);
            this.btn_AddCellPhoto.TabIndex = 17;
            this.btn_AddCellPhoto.Text = "Add Cell Photo";
            this.btn_AddCellPhoto.Click += new System.EventHandler(this.btn_AddCellPhoto_Click);
            // 
            // lab_total
            // 
            this.lab_total.Location = new System.Drawing.Point(161, 9);
            this.lab_total.Name = "lab_total";
            this.lab_total.Size = new System.Drawing.Size(152, 16);
            this.lab_total.TabIndex = 19;
            this.lab_total.Text = "Total Cell Photo :";
            // 
            // btn_ok
            // 
            this.btn_ok.Location = new System.Drawing.Point(502, 469);
            this.btn_ok.Name = "btn_ok";
            this.btn_ok.Size = new System.Drawing.Size(88, 24);
            this.btn_ok.TabIndex = 20;
            this.btn_ok.Text = "OK";
            this.btn_ok.Click += new System.EventHandler(this.btn_ok_Click);
            // 
            // btn_Cancel
            // 
            this.btn_Cancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_Cancel.Location = new System.Drawing.Point(596, 469);
            this.btn_Cancel.Name = "btn_Cancel";
            this.btn_Cancel.Size = new System.Drawing.Size(88, 24);
            this.btn_Cancel.TabIndex = 21;
            this.btn_Cancel.Text = "Cancel";
            // 
            // btn_ClearAll
            // 
            this.btn_ClearAll.Location = new System.Drawing.Point(12, 239);
            this.btn_ClearAll.Name = "btn_ClearAll";
            this.btn_ClearAll.Size = new System.Drawing.Size(128, 24);
            this.btn_ClearAll.TabIndex = 22;
            this.btn_ClearAll.Text = "Clear All";
            this.btn_ClearAll.Click += new System.EventHandler(this.btn_ClearAll_Click);
            // 
            // btn_Delete
            // 
            this.btn_Delete.Enabled = false;
            this.btn_Delete.Location = new System.Drawing.Point(12, 209);
            this.btn_Delete.Name = "btn_Delete";
            this.btn_Delete.Size = new System.Drawing.Size(128, 24);
            this.btn_Delete.TabIndex = 23;
            this.btn_Delete.Text = "Delete";
            this.btn_Delete.Click += new System.EventHandler(this.btn_Delete_Click);
            // 
            // ProgressBar
            // 
            this.ProgressBar.Location = new System.Drawing.Point(164, 443);
            this.ProgressBar.Name = "ProgressBar";
            this.ProgressBar.Size = new System.Drawing.Size(520, 16);
            this.ProgressBar.Step = 1;
            this.ProgressBar.TabIndex = 24;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(319, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 25;
            this.label1.Text = "Library :";
            // 
            // labLibraryName
            // 
            this.labLibraryName.AutoSize = true;
            this.labLibraryName.Location = new System.Drawing.Point(363, 9);
            this.labLibraryName.Name = "labLibraryName";
            this.labLibraryName.Size = new System.Drawing.Size(0, 13);
            this.labLibraryName.TabIndex = 26;
            // 
            // btnLoadLibrary
            // 
            this.btnLoadLibrary.Location = new System.Drawing.Point(12, 64);
            this.btnLoadLibrary.Name = "btnLoadLibrary";
            this.btnLoadLibrary.Size = new System.Drawing.Size(128, 23);
            this.btnLoadLibrary.TabIndex = 27;
            this.btnLoadLibrary.Text = "Load Library";
            this.btnLoadLibrary.UseVisualStyleBackColor = true;
            this.btnLoadLibrary.Click += new System.EventHandler(this.btnLoadLibrary_Click);
            // 
            // btnSaveLibrary
            // 
            this.btnSaveLibrary.Location = new System.Drawing.Point(12, 93);
            this.btnSaveLibrary.Name = "btnSaveLibrary";
            this.btnSaveLibrary.Size = new System.Drawing.Size(128, 23);
            this.btnSaveLibrary.TabIndex = 28;
            this.btnSaveLibrary.Text = "Save Library";
            this.btnSaveLibrary.UseVisualStyleBackColor = true;
            this.btnSaveLibrary.Click += new System.EventHandler(this.btnSaveLibrary_Click);
            // 
            // btnNewLibrary
            // 
            this.btnNewLibrary.Location = new System.Drawing.Point(12, 37);
            this.btnNewLibrary.Name = "btnNewLibrary";
            this.btnNewLibrary.Size = new System.Drawing.Size(128, 23);
            this.btnNewLibrary.TabIndex = 29;
            this.btnNewLibrary.Text = "New Library";
            this.btnNewLibrary.UseVisualStyleBackColor = true;
            this.btnNewLibrary.Click += new System.EventHandler(this.btnNewLibrary_Click);
            // 
            // CellPhoto
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(697, 505);
            this.Controls.Add(this.btnNewLibrary);
            this.Controls.Add(this.btnSaveLibrary);
            this.Controls.Add(this.btnLoadLibrary);
            this.Controls.Add(this.labLibraryName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.ProgressBar);
            this.Controls.Add(this.btn_Delete);
            this.Controls.Add(this.btn_ClearAll);
            this.Controls.Add(this.btn_Cancel);
            this.Controls.Add(this.btn_ok);
            this.Controls.Add(this.lab_total);
            this.Controls.Add(this.listView);
            this.Controls.Add(this.btn_AddCellPhoto);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "CellPhoto";
            this.Text = "CellPhoto";
            this.Load += new System.EventHandler(this.CellPhoto_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		#endregion
		static public ImageList imagelist = new ImageList();
		ImageList imagelistCell = new ImageList();
		public ArrayList PicElementPathCell = new ArrayList();
		int CountOpen = 0;
		private void CellPhoto_Load(object sender, System.EventArgs e)
		{
			listView.SmallImageList = imagelistCell;
			for(int i = 0 ;i<imagelistCell.Images.Count;i++)
			{
				ListViewItem item = new ListViewItem(i.ToString());
				item.ImageIndex = i;
				listView.Items.Add(item);
			}
			CountOpen = imagelistCell.Images.Count;
			lab_total.Text = "Total Cell Photo : " + imagelistCell.Images.Count.ToString();
			CountPictureElement = CountOpen;
		}
		int CountPictureElement ;
		private void btn_AddCellPhoto_Click(object sender, System.EventArgs e)
		{
            try
            {
				int start_imageList_show = CountPictureElement;
				using (OpenFileDialog ofd = new OpenFileDialog())
				{
					ofd.RestoreDirectory = true;
					ofd.Multiselect = true ;
				
					if(ofd.ShowDialog() == DialogResult.OK)
					{
                        libraryChange = true;
                        ProgressBar.Maximum = ofd.FileNames.Length;
                        foreach (String f in ofd.FileNames)
                        {
                            KeepInFileElementPath(f);
                        }
					}
					ProgressBar.Value = 0;
					for(int i = start_imageList_show ;i<imagelistCell.Images.Count;i++)
					{
						ListViewItem item = new ListViewItem(i.ToString());
						item.ImageIndex = i;
						listView.Items.Add(item);
					}
					lab_total.Text = "Total Cell Photo : " + imagelistCell.Images.Count.ToString();
				}
			}
            catch
            {
                MessageBox.Show("Insert Pictures are too much Please try again..","Error");
            }
		}
        private void KeepInFileElementPath(string f)
        {
            FileStream fs = File.Open(f, FileMode.Open);
            Bitmap bs = new Bitmap(new Bitmap(fs), 16, 16);
            imagelistCell.Images.Add(bs);
            CountPictureElement++;
            string[] p = new string[5];
            p[0] = p[4] = f;
            for (int i = 1; i < 4; i++)
                p[i] = "";
            PicElementPathCell.Add(p);
            fs.Close();
            ProgressBar.Increment(1);
        }
		public bool OK = false;
		private void btn_ok_Click(object sender, System.EventArgs e)
		{
			//PhotoMosaic.PicElementPath = (ArrayList)PicElementPathCell.Clone();
			OK = true;
			imagelist = CloneImageList(imagelistCell,imagelist);
			this.Close();
		}

		private void btn_ClearAll_Click(object sender, System.EventArgs e)
		{
            string Info = "Are you want to Delete All Item in List ? \n";
            DialogResult result = MessageBox.Show(Info, "Clear List", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK)
            {
                libraryChange = true;
                ClearAll();
            }
		}
        private void ClearAll()
        {
            PicElementPathCell.Clear();
            imagelistCell.Images.Clear();
            listView.Clear();
            CountPictureElement = 0;
            lab_total.Text = "ToTal Cell Photo : 0 ";
        }

		public ImageList CloneImageList (ImageList list1, ImageList list2)
		{
			// Clone list1 to list2
			list2.Images.Clear();
			for(int i = 0; i < list1.Images.Count;i++)
				list2.Images.Add(list1.Images[i]);
			
			return list2;
		}

		private void btn_Delete_Click(object sender, System.EventArgs e)
		{
            string Info = "Are you want to Delete Select Item ?";
            DialogResult result = MessageBox.Show(Info, "Delete Item", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK)
            {
                libraryChange = true;
                for (int i = listView.SelectedIndices.Count - 1; i >= 0; i--)
                {
                    PicElementPathCell.RemoveAt(listView.SelectedIndices[i]);
                    imagelistCell.Images.RemoveAt(listView.SelectedIndices[i]);
                }
                listView.Clear();
                for (int i = 0; i < imagelistCell.Images.Count; i++)
                {
                    ListViewItem item = new ListViewItem(i.ToString());
                    item.ImageIndex = i;
                    listView.Items.Add(item);
                }
                lab_total.Text = "Total Cell Photo : " + imagelistCell.Images.Count.ToString();
            }
		}

		private void listView_SelectedIndexChanged(object sender, System.EventArgs e)
		{
            if (listView.SelectedIndices.Count > 0)
                btn_Delete.Enabled = true;
            else
                btn_Delete.Enabled = false;
		}

        private void btnLoadLibrary_Click(object sender, EventArgs e)
        {
            if (libraryChange)
            {
                ManageChanageLibrary();
            }
            using (OpenFileDialog ofd = new OpenFileDialog())
            {
                ofd.Filter = "Text File|*.txt";
                ofd.RestoreDirectory = true;
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    ClearAll();
                    int start_imageList_show = CountPictureElement;
                    TextReader tr = new StreamReader(ofd.FileName);
                    string path = tr.ReadLine();
                    ProgressBar.Maximum = 705;

                    StreamReader re = new StreamReader("C:\\Mosaic\\Mirror\\1.jpeg");
                    MemoryStream me = new MemoryStream();
                 //   System.Net.FileWebRequest ab = re.BaseStream;
                  //  ab.name

                     string a = ((FileStream)re.BaseStream).Name;
                    try
                    {
                        while (path != null)
                        {
                            KeepInFileElementPath(path);
                            path = tr.ReadLine();
                        }
                    }
                    catch
                    {
                      //  MessageBox.Show("Can't find cell photo path", "warning", MessageBoxButtons.OK);
                    }
                    tr.Close();
                    ProgressBar.Value = 0;
                    for (int i = start_imageList_show; i < imagelistCell.Images.Count; i++)
                    {
                        ListViewItem item = new ListViewItem(i.ToString());
                        item.ImageIndex = i;
                        listView.Items.Add(item);
                    }
                    lab_total.Text = "Total Cell Photo : " + imagelistCell.Images.Count.ToString();
                    labLibraryName.Text = ofd.FileName;
                    libraryChange = false;
                }   
            }
            
        }
        private void btnSaveLibrary_Click(object sender, EventArgs e)
        {
            SaveLibrary();
        }
        private void SaveLibrary()
        {
            if (labLibraryName.Text != "")
            {
                libraryChange = false;
                TextWriter tx = new StreamWriter(labLibraryName.Text);
                for (int i = 0; i < PicElementPathCell.Count; i++)
                {
                    tx.WriteLine(((Array)PicElementPathCell[i]).GetValue(0));
                }
                tx.Close();
                MessageBox.Show("Save done");
            }
            else
            {
                SaveFileDialog sfd = new SaveFileDialog();
                sfd.Filter = "Text File|*.txt";
                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    libraryChange = false;
                    TextWriter tx = new StreamWriter(sfd.FileName);
                    for (int i = 0; i < PicElementPathCell.Count; i++)
                    {
                        tx.WriteLine(((Array)PicElementPathCell[i]).GetValue(0));
                    }
                    tx.Close();
                    MessageBox.Show("Save done");
                }
            }
        }
        public bool libraryChange = false;
        private void ManageChanageLibrary()
        {
            string info = "Do you want to save chage of Library?";
            DialogResult result = MessageBox.Show(info, "Save Change", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK)
            {
                SaveLibrary();
            }
        }
        private void btnNewLibrary_Click(object sender, EventArgs e)
        {
            if (libraryChange)
            {
                ManageChanageLibrary();
            }
            labLibraryName.Text = "";
            ClearAll();
            libraryChange = false;
        }

	}
}
