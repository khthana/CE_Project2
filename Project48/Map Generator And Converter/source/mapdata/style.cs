using System;
using System.Drawing;

namespace mapdata
{
	/// <summary>
	/// Summary description for style.
	/// </summary>
	public class style
	{
		public Color Fill;
		public double Fill_Opacity;
		public Color Stroke;
		public double Stroke_Width;
		public string name;

		public style(string name,Color fill,double fill_opacity,Color stroke,double stroke_width)
		{
			this.name = name;
			this.Fill = fill;
			this.Fill_Opacity = fill_opacity;
			this.Stroke = stroke;
			this.Stroke_Width = stroke_width;
		}
	}
}
