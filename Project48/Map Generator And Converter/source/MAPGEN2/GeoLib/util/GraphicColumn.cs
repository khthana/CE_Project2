using System;
using System.Data; 
using System.Windows.Forms;
using System.Drawing;

namespace GeoCon.util
{
	public class DataGridGraphicColumn : DataGridColumnStyle
	{
		private Button button;
		private CurrencyManager cm;
		private int iCurrentRow;

		public DataGridGraphicColumn()
		{
			button=new Button();
			button.BackColor=Color.Transparent; 
			button.FlatStyle=FlatStyle.Popup;
			button.Leave +=new EventHandler(button_Leave);
			button.Click +=new EventHandler(button_Click);
			//button.Paint +=new PaintEventHandler(button_Paint);
		}

		public void updateCurrencyManager()
		{
			cm =(CurrencyManager) this.DataGridTableStyle.DataGrid.BindingContext[this.DataGridTableStyle.DataGrid.DataSource];
			//cm.Refresh();
		}

		#region must override members
		protected override void Edit(CurrencyManager source, int rowNum, Rectangle bounds, bool readOnly, string instantText, bool cellIsVisible)
		{
			//base.Edit(source,rowNum,bounds,readOnly,instantText);
			if(readOnly || cellIsVisible==false) return;
			cm=source;
			iCurrentRow = rowNum;
			button.Parent=this.DataGridTableStyle.DataGrid; 
			Rectangle rect=this.DataGridTableStyle.DataGrid.GetCurrentCellBounds();
			button.Location=rect.Location;
			button.Size=new Size(rect.Width, rect.Height);

			button.BringToFront();
			button.Show();
			button.Focus();
			//TODO : add datagrid.scroll event handler to hide button
		}

		protected override void Paint(Graphics g, Rectangle bounds, CurrencyManager source, int rowNum)	{}
		protected override void Paint(Graphics g, Rectangle bounds, CurrencyManager source, int rowNum, bool alignToRight){	}
		protected override void Paint(Graphics g, Rectangle bounds, CurrencyManager source, int rowNum, Brush backBrush, Brush foreBrush, bool alignToRight)
		{
			////base.Paint(g, bounds, source, rowNum, backBrush, foreBrush, alignToRight);
			if(cm==null) cm =(CurrencyManager) this.DataGridTableStyle.DataGrid.BindingContext[this.DataGridTableStyle.DataGrid.DataSource];
			////cm =(CurrencyManager) this.DataGridTableStyle.DataGrid.BindingContext[this.DataGridTableStyle.DataGrid.DataSource];
			g.FillRectangle(backBrush,bounds); 
			//Bin b = (Bin) cm.List[rowNum];
			//b.binIcon.DrawIcon(g,bounds);
		}
		protected override void Abort(int rowNum)
		{
		}
		protected override bool Commit(CurrencyManager dataSource, int rowNum)
		{
			this.ConcedeFocus();
			return true;
		}
		protected override int GetMinimumHeight(){return 0;}
		protected override int GetPreferredHeight(Graphics g, object value)	{return 20;}
		protected override Size GetPreferredSize(Graphics g, object value){return new Size(50,20);}
		#endregion

		#region optional override members
		protected override void SetColumnValueAtRow(CurrencyManager source, int rowNum, object Value)
		{
			base.SetColumnValueAtRow (source, rowNum, Value);
		}
		protected override object GetColumnValueAtRow(CurrencyManager source, int rowNum)
		{
			return source.List[rowNum];
		}
		protected override void UpdateUI(CurrencyManager source, int rowNum, string instantText)
		{
			base.UpdateUI (source, rowNum, instantText);
		}

		#endregion
		
		#region button event handler
		private void button_Leave(object sender, EventArgs e)
		{
			this.button.Hide();
			this.Invalidate();
		}
		//		private GeoCon.StyleForm styleform=new StyleForm();
		private void button_Click(object sender, EventArgs e)
		{
			//			if(styleform.IsDisposed) styleform = new StyleForm();
			//			styleform.bin = (Bin) cm.List[iCurrentRow];
			//			styleform.Show();
			//			styleform.BringToFront();

			////cm.Refresh(); 
			////re-translate the icon to reflect clicked button
		}
		#endregion

	}
}

