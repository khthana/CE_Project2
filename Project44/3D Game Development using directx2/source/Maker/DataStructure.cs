using System;
using System.Collections;
using System.IO;

namespace Maker
{
	/// <summary>
	/// Summary description for DataStructure.
	/// </summary>
	public struct vector3d
	{
		public float x,y,z;

		public vector3d(float x, float y, float z)
		{
			this.x	= x;
			this.y	= y;
			this.z	= z;
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(x);
			bw.Write(y);
			bw.Write(z);
		}
	}

	public struct vector2d
	{
		public float x,y;

		public vector2d(float x, float y)
		{
			this.x	= x;
			this.y	= y;
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(x);
			bw.Write(y);
		}
	}
	
	public struct colorRGBA
	{
		public float r,g,b,a;

		public colorRGBA(float r, float g, float b, float a)
		{
			this.r	= r;
			this.g	= g;
			this.b	= b;
			this.a	= a;
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(r);
			bw.Write(g);
			bw.Write(b);
			bw.Write(a);
		}

		public string ToString()
		{
			string str = a.ToString() + ", " + r.ToString()+ ", " + g.ToString() + ", " + b.ToString();
			return str;
		}

		public string ToStringB()
		{
			string str;
			int ra = (int)(r*255);
			int ga = (int)(g*255);
			int ba = (int)(b*255);
			int aa = (int)(a*255);
			str = aa.ToString() + ", " + ra.ToString()+ ", " + ga.ToString() + ", " + ba.ToString();
			return str;
		}
	}

	public struct colorRGB
	{
		public float r,g,b;

		public colorRGB(float r, float g, float b)
		{
			this.r	= r;
			this.g	= g;
			this.b	= b;
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(r);
			bw.Write(g);
			bw.Write(b);
		}

		public string ToString()
		{
			string str = r.ToString()+ ", " + g.ToString() + ", " + b.ToString();
			return str;
		}

		public string ToStringB()
		{
			string str;
			int ra = (int)(r*255);
			int ga = (int)(g*255);
			int ba = (int)(b*255);
			str = ra.ToString()+ ", " + ga.ToString() + ", " + ba.ToString();
			return str;
		}
	}
}

	