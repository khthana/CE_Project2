using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using ChartDirector;

namespace Org.Snmp.Snmp_pp
{
	/// <summary>
	/// Summary description for Chart_view.
	/// </summary>
	public class Chart_view : System.Windows.Forms.Form
	{
		private ChartDirector.WinChartViewer chartview;
		private System.ComponentModel.Container components = null;
		private MyStat data = new MyStat();
		private int index_Var;
		private int index_Int;
		private bool is_Interface = false;
		private int no_group;							//number of group chi_square for show
		private string [] Label = new string[11];		// use label at x axis
		private double admin_limit;
		private double admin_limit1;
		private double admin_limit2;
        
		public Chart_view(string title,MyStat obj)
		{
			// Required for Windows Form Designer support
			InitializeComponent();
			Text = title;		//ตั้งชื่อบน form
			data = new MyStat(obj);
		
		}

		public Chart_view(string title,MyStat obj,int number)
		{
			// Required for Windows Form Designer support
			InitializeComponent();
			Text = title;		//ตั้งชื่อบน form
			data = new MyStat(obj);
			no_group = number;
		}
		public Chart_view(string title,MyStat obj,int number,double assign_chi_val,double assign_chi_val1,double assign_chi_val2)
		{
			// Required for Windows Form Designer support
			InitializeComponent();
			Text = title;		//ตั้งชื่อบน form
			data = new MyStat(obj);
			no_group = number;
			admin_limit = assign_chi_val;
			admin_limit1 = assign_chi_val1;
			admin_limit2 = assign_chi_val2;
		}

		public Chart_view(string title,MyStat obj,int arg_index_Int,int arg_index_Var,bool arg_is_Interface)
		{
			// Required for Windows Form Designer support
			InitializeComponent();
			Text = title;		//ตั้งชื่อบน form
			data = new MyStat(obj);
			index_Var = arg_index_Var;
			index_Int = arg_index_Int;
			is_Interface = arg_is_Interface;
		}
		
		
		

		public Chart_view()
		{
			// Required for Windows Form Designer support
			InitializeComponent();
			Text = "";		//ตั้งชื่อบน form
			//data = new MyStat(obj);
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
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
			this.chartview = new ChartDirector.WinChartViewer();
			this.SuspendLayout();
			// 
			// chartview
			// 
			this.chartview.Location = new System.Drawing.Point(0, 0);
			this.chartview.Name = "chartview";
			this.chartview.Size = new System.Drawing.Size(790, 460);
			this.chartview.TabIndex = 0;
			this.chartview.TabStop = false;
			// 
			// Chart_view
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(782, 426);
			this.Controls.Add(this.chartview);
			this.Name = "Chart_view";
			this.Text = "Chart_view";
			this.Resize += new System.EventHandler(this.Chart_view_Resize);
			this.Load += new System.EventHandler(this.Chart_view_Load);
			this.ResumeLayout(false);

		}
		#endregion
		
		private void Chart_view_Load(object sender, System.EventArgs e)
		{
			createChart(chartview,this.Text+".jpg",this.Height,this.Width);
		}
		
		public void createChart(WinChartViewer viewer, string img,int height , int width)
		{
			
			//==========================Data From DB===================================//
			
			//Create a XYChart object of size 250 x 250 pixels
			XYChart chart = new XYChart(width, height,0xe0e0ff, 0xccccff);

			//Set the plotarea at (30, 20) and of size 200 x 200 pixels
			chart.setPlotArea(130, 40, width -160, height - 120,0xffffff);

			//Add a line chart layer using the given data
			//double [] temp = new double[12];
			double [] temp = new double[11];
			double max = 0;
			//for(int i =0;i<12;i++)
			for(int i =0;i<11;i++)
			{
				
				temp[i] = this.data.data[index_Var,i];	
				if(max < temp[i])
				{
					max = temp[i];
				}
			}
			if(is_Interface)
			{
				for(int i =0;i<12;i++)
				{
					chart.xAxis().setTitle(" Time ","Times New Roman Bold Italic", 14);
					chart.yAxis().setTitle(" Number of Packet ","Times New Roman Bold Italic", 14);
					chart.yAxis().setAutoScale(0,0);
					chart.addLineLayer(temp);
				}
			}

			else
			{
				chart.addLegend(120,15 , false, "", 8).setBackground(Chart.Transparent);
				if(no_group == 0)
				{
					//Add a purple (0x800080) mark at y = 70 using a line width of 2.
					chart.yAxis().addMark(admin_limit, 0x338033, "Admin_Limit = "+admin_limit.ToString()).setLineWidth(2);
					chart.yAxis().setTitle(" Chi_square (Group InPacket)","Times New Roman Bold Italic", 14);
					chart.xAxis().setTitle(" Time ","Times New Roman Bold Italic", 14);
					chart.yAxis().setAutoScale(0,0);
					LineLayer lineLayer = chart.addLineLayer(this.data.chi_square, 0x800080,"Chi_square");
					lineLayer.setLineWidth(1);
					//สร้างเส้น control limit
					LineLayer limit = chart.addLineLayer2();
					limit.addDataSet(data.Upper_bound,0x338033,"Limit");
					limit.addDataSet(data.Upper1_bound,0x338033);
					limit.addDataSet(data.Upper2_bound,0x338033);
					limit.addDataSet(data.Lower_bound,0x338033);
					limit.setLineWidth(1);
					// กำหนดสีขอบเขตใน control limit//
					chart.addInterLineLayer(limit.getLine(0), limit.getLine(3),
						unchecked((int)0x8099ff99), unchecked((int)0x8099ff99));
					// กำหนดสีเมื่อเกิดการเกินขอบเขต //
					chart.addInterLineLayer(lineLayer.getLine(0), limit.getLine(0),
						0xff0000, Chart.Transparent);
					chart.addInterLineLayer(lineLayer.getLine(0), limit.getLine(3),
						Chart.Transparent, 0xff0000);

					




				}
				else if(no_group == 1)
				{
					chart.yAxis().addMark(admin_limit1, 0x338033, "Admin_Limit = "+admin_limit1.ToString()).setLineWidth(2);
					chart.yAxis().setTitle(" Chi_square (Group OutPacket ) ","Times New Roman Bold Italic", 14);
					chart.xAxis().setTitle(" Time ","Times New Roman Bold Italic", 14);
					chart.yAxis().setAutoScale(0,0);
					LineLayer lineLayer = chart.addLineLayer(this.data.chi_square1, 0x800080,"Chi_square");
					lineLayer.setLineWidth(1);
					//สร้างเส้น control limit
					LineLayer limit = chart.addLineLayer2();
					limit.addDataSet(data.Upper_bound1,0x338033,"Limit");
					limit.addDataSet(data.Upper1_bound1,0x338033);
					limit.addDataSet(data.Upper2_bound1,0x338033);
					limit.addDataSet(data.Lower_bound1,0x338033);
					limit.setLineWidth(1);
					// กำหนดสีขอบเขตใน control limit//
					chart.addInterLineLayer(limit.getLine(0), limit.getLine(3),
						unchecked((int)0x8099ff99), unchecked((int)0x8099ff99));
					// กำหนดสีเมื่อเกิดการเกินขอบเขต //
					chart.addInterLineLayer(lineLayer.getLine(0), limit.getLine(0),
						0xff0000, Chart.Transparent);
					chart.addInterLineLayer(lineLayer.getLine(0), limit.getLine(3),
						Chart.Transparent, 0xff0000);

					
				}
					
				else 
				{
					chart.yAxis().addMark(admin_limit2, 0x338033, "Admin_Limit = "+admin_limit2.ToString()).setLineWidth(2);
					chart.yAxis().setTitle(" Chi_square (Group EtherStatpacketsize)","Times New Roman Bold Italic", 14);
					chart.xAxis().setTitle(" Time ","Times New Roman Bold Italic", 14);
					chart.yAxis().setAutoScale(0,0);
					LineLayer lineLayer = chart.addLineLayer(this.data.chi_square2, 0x800080,"Chi_square");
					lineLayer.setLineWidth(1);
					//สร้างเส้น control limit
					LineLayer limit = chart.addLineLayer2();
					limit.addDataSet(data.Upper_bound2,0x338033,"Limit");
					limit.addDataSet(data.Upper1_bound2,0x338033);
					limit.addDataSet(data.Upper2_bound2,0x338033);
					limit.addDataSet(data.Lower_bound2,0x338033);
					limit.setLineWidth(1);
					
					// กำหนดสีขอบเขตใน control limit//
					chart.addInterLineLayer(limit.getLine(0), limit.getLine(3),
						unchecked((int)0x8099ff99), unchecked((int)0x8099ff99));
					// กำหนดสีเมื่อเกิดการเกินขอบเขต //
					chart.addInterLineLayer(lineLayer.getLine(0), limit.getLine(0),
						0xff0000, Chart.Transparent);
					chart.addInterLineLayer(lineLayer.getLine(0), limit.getLine(3),
						Chart.Transparent, 0xff0000);

					
					//Enable data label on the data points. Set the label format to nn%.
					


				}
				
				}
					//Set the labels on the x axis.
					Label_Xaxis();
					chart.xAxis().setLabels(Label);		//Lable variable เป็นตัวแปร Global ที่เก็บ label แกน X

			//Display 1 out of 3 labels on the x-axis.
			chart.xAxis().setLabelStep(1);

			//output the chart
			viewer.Image = chart.makeImage();

			//include tool tip for the chart
			/*viewer.ImageMap = chart.getHTMLImageMap("clickable", "",
				"title='Hour {xLabel}: Traffic {value} GBytes'");*/

		}
		

		private void Chart_view_Resize(object sender, System.EventArgs e)
		{
			createChart(chartview,this.Text+".jpg",this.Height,this.Width);
		}

		public void Show(string title,MyStat obj)
		{
			// Required for Windows Form Designer support
			InitializeComponent();
			Text = title;		//ตั้งชื่อบน form
			data = new MyStat(obj);
		}
		
		public void Label_Xaxis()
		{
			int hour = int.Parse(DateTime.Now.Hour.ToString());
			int min = int.Parse(DateTime.Now.Minute.ToString());
			for(int i = 10;i>=0;i--)
			{
				Label[i] = hour.ToString() + "." + min.ToString();
				if((min - 5) >= 0)
				{
					min = min - 5;
				}
				else if((min - 5 < 0) && (hour-1 >= 0))
				{
					hour = hour - 1;
					int temp = 5 - min;
					min = 60 - temp;
				}
				else if((min - 5 < 0) && (hour-1 < 0))
				{
					hour = 23;
					int temp = 5 - min;
					min = 60 - temp;
				}
			}
		}
	}
}
