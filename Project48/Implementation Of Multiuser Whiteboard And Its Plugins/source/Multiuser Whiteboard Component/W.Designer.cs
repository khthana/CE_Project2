namespace W
{
    partial class B
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(B));
            this.LB_status = new System.Windows.Forms.Label();
            this.board = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.board)).BeginInit();
            this.SuspendLayout();
            // 
            // LB_status
            // 
            this.LB_status.AutoEllipsis = true;
            resources.ApplyResources(this.LB_status, "LB_status");
            this.LB_status.BackColor = System.Drawing.Color.LawnGreen;
            this.LB_status.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.LB_status.ForeColor = System.Drawing.Color.Black;
            this.LB_status.Name = "LB_status";
            // 
            // board
            // 
            this.board.BackColor = System.Drawing.Color.White;
            this.board.Cursor = System.Windows.Forms.Cursors.Hand;
            this.board.Image = global::W.Resource.Whiteboard;
            resources.ApplyResources(this.board, "board");
            this.board.Name = "board";
            this.board.TabStop = false;
            this.board.MouseDown += new System.Windows.Forms.MouseEventHandler(this.board_MouseDown);
            this.board.MouseMove += new System.Windows.Forms.MouseEventHandler(this.board_MouseMove);
            this.board.MouseUp += new System.Windows.Forms.MouseEventHandler(this.board_MouseUp);
            // 
            // B
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Red;
            this.Controls.Add(this.LB_status);
            this.Controls.Add(this.board);
            this.Cursor = System.Windows.Forms.Cursors.SizeAll;
            this.DoubleBuffered = true;
            this.Name = "B";
            this.Load += new System.EventHandler(this.B_Load);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.B_MouseDown);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.B_MouseMove);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.B_MouseUp);
            this.SizeChanged += new System.EventHandler(this.B_SizeChanged);
            ((System.ComponentModel.ISupportInitialize)(this.board)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox board;

        private System.Windows.Forms.Label LB_status;


    }
}
