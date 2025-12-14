using System;
using System.Collections;
namespace Restaurant
{
	/// <summary>
	/// Summary description for A.
	/// </summary>
	public class A
	{
		private string aa;
		private string bb;
		private Menu me;
		
		public A()
		{

		}
		
		
		public A(string a,string b,Menu m)
		{   me = m;
			aa = a;
			bb = b;
		}
		public void SetAA(string aa)
		{
			this.aa = aa;
		}
		public string GetAA()
		{
			return aa;
		}
		public void SetBB(string bb)
		{
			this.bb = bb;
		}
		public string GetBB()
		{
			return bb;
		}
		public string AA
		{
			get{ return aa; }
			set{ aa = value; }
		}
		public string BB
		{
			get{ return bb; }
			set{ bb = value; }
		}
		public Menu Me
		{
			get{ return me; }
			set{ me = value; }
		}
		
		
	}
}
