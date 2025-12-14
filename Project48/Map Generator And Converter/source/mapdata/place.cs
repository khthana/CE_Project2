using System;
using System.Collections;
using System.Drawing;

namespace mapdata
{
	/// <summary>
	/// Summary description for place.
	/// </summary>
	public class place
	{
		public ArrayList points = new ArrayList();
		public string id = "";
		public string detail = "";
		public string type = "";
		public string class2 = "";

		public place(string id,string detail,string type,string class2)
		{
			this.id = id;
			this.detail =detail;
			this.type =type;
			this.class2= class2;
		}

		public string getdata()
		{
			string s = "";
			for(int i=0;i<points.Count;i++)
			{
				PointF p =(PointF)points[i]; 
				s += p.X+","+p.Y+" ";
			}
			return s;
		}

		public void setdata(string s)
		{
			char[] sep = new char[] {' '};
			char[] sep1 = new char[] {','};
			string[] st = s.Trim().Split(sep);
			points.Clear();
			for(int i=0;i<st.GetLength(0);i++)
			{
				string[] st1 = st[i].Trim().Split(sep1);
				points.Add(new PointF(Convert.ToSingle(st1[0]),Convert.ToSingle(st1[1])));
			}
		}

		public PointF this[int i]
		{
			get
			{
				return (PointF)points[i];
			}
			set
			{
				points.RemoveAt(i);
				points.Insert(i,value);
			}
		}

		public PointF[] getpoint()
		{
			return (PointF[])points.ToArray(typeof(PointF));
		}

		public void insert(PointF p,int i)
		{
			points.Insert(i,p);
		}

		public void insert(PointF p)
		{
			points.Add(p);
		}

		public void remove(int i)
		{
			points.RemoveAt(i);
		}

		public void remove()
		{
			points.RemoveAt(points.Count-1);
		}
	}
}
