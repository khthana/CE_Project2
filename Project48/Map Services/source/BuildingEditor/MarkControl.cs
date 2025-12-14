//Nothing to see here, it's only a red square :D Personalize it (circles,cross, etc)

using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Windows.Forms;

namespace PictureViewer
{
	
	public class MarkControl : UserControl
	{
		private Container components = null;

		public MarkControl()
		{		
			InitializeComponent();
			this.BackColor = Color.Green;	
		}

		public Point Center
		{
			get{return new Point(Location.X+4,Location.Y+4);}
		}

		protected override void OnPaint(PaintEventArgs e)
		{
		//
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

		#region Component Designer generated code
		
		private void InitializeComponent()
		{
			// 
			// MarkControl
			// 
			this.ForeColor = System.Drawing.SystemColors.ControlText;
			this.Name = "MarkControl";
			this.Size = new System.Drawing.Size(9, 9);

		}
		#endregion
	}
}
