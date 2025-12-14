using System;
using System.Collections;
using System.Drawing;
using System.Xml.Serialization;
using GeoCon;

namespace mapdata
{
	/// <summary>
	/// Summary description for allplace.
	/// </summary>
	public class allplace
	{
		public ArrayList places = new ArrayList();
		public style[] styles = new style[6];
		string group="";
		double lat1=0;
		double lon1=0;
		double lat2=0;
		double lon2=0;


		public allplace(string group,double lat1,double lon1,double lat2,double lon2)
		{
			styles[0] = new style("building",Color.Red,1,Color.Black,1);
			styles[1] = new style("struct",Color.Orange,1,Color.Black,1);
			styles[2] = new style("water",Color.Blue,1,Color.Black,1);
			styles[3] = new style("road",Color.Gray,1,Color.Black,1);
			styles[4] = new style("rail",Color.Brown,1,Color.Black,1);
			styles[5] = new style("amphur",Color.Green,1,Color.Black,1);
			this.group = group;
		}

		public allplace()
		{
			styles[0] = new style("building",Color.Red,1,Color.Black,1);
			styles[1] = new style("struct",Color.Orange,1,Color.Black,1);
			styles[2] = new style("water",Color.Blue,1,Color.Black,1);
			styles[3] = new style("road",Color.Gray,1,Color.Black,1);
			styles[4] = new style("rail",Color.Brown,1,Color.Black,1);
			styles[5] = new style("amphur",Color.Green,1,Color.Black,1);
			this.group = "group1";
		}

		public void clear()
		{
			places.Clear();
		}
		public place this[int i]
		{
			get
			{
				return (place)places[i];
			}
			set
			{
				places.Insert(i,value);
			}
		}

		public void insert(place p,int i)
		{
			places.Insert(i,p);
		}

		public void insert(place p)
		{
			places.Add(p);
		}

		public void remove(int i)
		{
			places.RemoveAt(i);
		}

		public void remove()
		{
			places.RemoveAt(places.Count-1);
		}


		string stylestring()
		{
			string st = "";
			for(int i=0;i<styles.GetLength(0);i++)
			{
				st+=".style-"+styles[i].name+"{";
				st+="fill:RGB("+styles[i].Fill.R+","+styles[i].Fill.G+","+styles[i].Fill.B+");";
				st+="fill-opacity:"+styles[i].Fill_Opacity+";";
				st+="stroke:RGB("+styles[i].Stroke.R+","+styles[i].Stroke.G+","+styles[i].Stroke.B+");";
				st+="stroke-width:"+styles[i].Stroke_Width+";";
				st+="}";
			}
			return st;
		}
		
		public void exportsvg(string filename)
		{
			//style
			svg.style style = new svg.style();
			style.Item=stylestring();

			//group
			svg.group rootGroup = new svg.group();
			rootGroup.Items = new svg.SvgElement[places.Count];
			for(int i=0;i<places.Count;i++)
			{
				place p = this[i];
				if (p.type=="polygon")
				{
					svg.polygon[] poly = new svg.polygon[1] {new svg.polygon(p.getdata())};
					poly[0].@class = "style-"+p.class2;
					svg.group g = new svg.group(poly);
					g.id = p.id+":"+p.type;
					rootGroup.Items[i] = g;
				}
				if (p.type=="polyline")
				{
					svg.polyline[] poly = new svg.polyline[1] {new svg.polyline(p.getdata())};
					poly[0].@class = "style-"+p.class2;
					svg.group g = new svg.group(poly);
					g.id = p.id+":"+p.type;
					rootGroup.Items[i] = g;
				}
				if (p.type=="point")
				{
					svg.circle[] poly = new svg.circle[1] {new svg.circle(p[0].X,p[0].Y,5)};
					poly[0].@class = "style-"+p.class2;
					svg.group g = new svg.group(poly);
					g.id = p.id+":"+p.type;
					rootGroup.Items[i] = g;
				}
			}

			//root
			svg.svg rootsvg = new svg.svg();
			rootsvg.setDimension("0","0","100%","100%");
			rootsvg.viewBox = lon1+" "+lat1+" "+lon2+" "+lat2;
			rootsvg.Items=new svg.SvgElement[2]{style,rootGroup};

			//namespace
			XmlSerializerNamespaces nsnames = new XmlSerializerNamespaces();
			nsnames.Add("","http://www.w3.org/2000/svg");
			nsnames.Add("xlink","http://www.w3.org/1999/xlink");

			//attribute
			XmlRootAttribute xra = new XmlRootAttribute(); 
			xra.Namespace = "http://www.w3.org/2000/svg";

			//writefile
			XmlSerializer ser = new XmlSerializer( typeof(svg.svg), null, System.Type.EmptyTypes, xra, "");
			System.IO.FileStream fs = new System.IO.FileStream( filename,System.IO.FileMode.Create);
			ser.Serialize(fs,rootsvg,nsnames);
			fs.Close();

			//dispose
			nsnames=null;
			xra=null;
			rootsvg=null;
			rootGroup=null;
			ser=null;
		}

		public void importsvg(string filename)
		{
			//style
			//svg.style style = new svg.style();
			//style.Item=stylestring();

			//attribute
			XmlRootAttribute xra = new XmlRootAttribute(); 
			xra.Namespace = "http://www.w3.org/2000/svg";

			//writefile
			XmlSerializer ser = new XmlSerializer( typeof(svg.svg), null, System.Type.EmptyTypes, xra, "");
			System.IO.FileStream fs = new System.IO.FileStream( filename,System.IO.FileMode.Open);
			svg.svg rootsvg = (svg.svg)ser.Deserialize(fs);
			fs.Close();

			//root
			string[] box = rootsvg.viewBox.Trim().Split(new char[] {' '});
			lon1 = Convert.ToDouble(box[0]);
			lat1 = Convert.ToDouble(box[1]);
			lon2 = Convert.ToDouble(box[2]);
			lat2 = Convert.ToDouble(box[3]);

			for(int h=0;h<rootsvg.Items.GetLength(0);h++)
			{
				if(rootsvg.Items[h].GetType() == typeof(svg.style))
				{
					//style
					svg.style style = (svg.style)rootsvg.Items[h];
				}
				if(rootsvg.Items[h].GetType() == typeof(svg.group))
				{
					// group
					svg.group rootGroup = (svg.group)rootsvg.Items[h];
					this.clear();
					for(int i=0;i<rootGroup.Items.GetLength(0);i++)
					{
						svg.group g = (svg.group)rootGroup.Items[i];
						string[] st = g.id.Split(new char[] {':'});
						string id = st[0];

						for(int j=0;j<g.Items.GetLength(0);j++)
						{
							if (g.Items[j].GetType() == typeof(svg.polygon))
							{
								svg.polygon poly = (svg.polygon)g.Items[j];
								string class2 = poly.@class.Remove(0,6);
								place p = new place(id,"","polygon",class2);
								p.setdata(poly.points);
								this.insert(p);
							}
							if (g.Items[j].GetType() == typeof(svg.polyline))
							{
								svg.polyline poly = (svg.polyline)g.Items[j];
								string class2 = poly.@class.Remove(0,6);
								place p = new place(id,"","polyline",class2);
								p.setdata(poly.points);
								this.insert(p);
							}
							if (g.Items[j].GetType() == typeof(svg.circle))
							{
								svg.circle poly = (svg.circle)g.Items[j];
								string class2 = poly.@class.Remove(0,6);
								place p = new place(id,"","point",class2);
								p.setdata(poly.cx+","+poly.cy);
								this.insert(p);
							}
						}
					}
				}
			}

			//dispose
			xra=null;
			rootsvg=null;
			//rootGroup=null;
			ser=null;
		}

		public void exportdatabase()
		{
			database data = new database();
			data.query("delete from item");
			for(int i=0;i<places.Count;i++)
			{
				place p = this[i];
				string sql = "insert into item ";
				sql += "values('"+this.group+"','"+p.id+"','"+p.detail+"','"+p.type+"','"+p.class2+"','"+p.getdata()+"')";
				data.query(sql);
			}
			data.close();
		}
		public void importdatabase()
		{
			this.clear();
			database data = new database();
			data.query("select * from item");
			while(data.dr.Read())
			{
				
				string id = ""+data.dr["ID"];
				string detail = ""+data.dr["DETAIL"];
				string type = ""+data.dr["TYPE"];
				string class2 = ""+data.dr["CLASS"];
				place p = new place(id,detail,type,class2);
				p.setdata(""+data.dr["DATA"]);
				this.insert(p);
			}
			data.close();
		}

		public void draw(Graphics gc)
		{
			for(int i=0;i<places.Count;i++)
			{
				if(this[i].type.ToLower()=="polygon")
				{
					mapdata.style s ;
					s = this.styles[0];
					if (this[i].class2=="building") s = styles[0];
					if (this[i].class2=="struct") s = styles[1];
					if (this[i].class2=="water") s = styles[2];
					if (this[i].class2=="road") s = styles[3];
					if (this[i].class2=="rail") s = styles[4];
					if (this[i].class2=="amphur") s = styles[5];
					Pen p = new Pen(s.Stroke,1);
					Brush b = new SolidBrush(s.Fill);
					//gc.DrawPolygon(p,this[i].getpoint());
					//gc.DrawBeziers(p,this[i].getpoint());
					gc.FillPolygon(b,(this[i].getpoint()));
					gc.DrawPolygon(p,(this[i].getpoint()));
				}
				if(this[i].type.ToLower()=="polyline")
				{
					mapdata.style s ;
					s = styles[0];
					if (this[i].class2=="building") s = styles[0];
					if (this[i].class2=="struct") s = styles[1];
					if (this[i].class2=="water") s = styles[2];
					if (this[i].class2=="road") s = styles[3];
					if (this[i].class2=="rail") s = styles[4];
					if (this[i].class2=="amphur") s = styles[5];
					Pen p = new Pen(s.Stroke,1);
					gc.DrawLines(p,(this[i].getpoint()));
				}
				if(this[i].type.ToLower()=="point")
				{
					mapdata.style s ;
					s = styles[0];
					if (this[i].class2=="building") s = styles[0];
					if (this[i].class2=="struct") s = styles[1];
					if (this[i].class2=="water") s = styles[2];
					if (this[i].class2=="road") s = styles[3];
					if (this[i].class2=="rail") s = styles[4];
					if (this[i].class2=="amphur") s = styles[5];
					Pen p = new Pen(s.Stroke,1);
					gc.DrawEllipse(p,(this[i][0].X),(this[i][0].Y),5,5);
					//gc.DrawPolygon(p,this[i].getpoint());
				}
			}
		}

		PointF[] Convertpoint(PointF[] input)
		{
			double ratex = 2000/(lon2-lon1);
			double ratey = 2000/(lat2-lat1);
			PointF[] output = new PointF[input.GetLength(0)];
			for(int i=0;i<input.GetLength(0);i++)
			{
				output[i] = new PointF(Convert.ToSingle(input[i].X*ratex),Convert.ToSingle(input[i].Y*ratey));
			}
			return output;
		}

		float ConvertpointX(float input)
		{
			float ratex = 2000/Convert.ToSingle(lon2-lon1);
			return input * ratex;
		}

		float ConvertpointY(float input)
		{
			float ratey = 2000/Convert.ToSingle(lat2-lat1);
			return input * ratey;
		}
	}
}
