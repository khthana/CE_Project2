using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for Promotion.
	/// </summary>
	public class Promotion
	{
		private string name;
		private string note;
		private string reserve;
		public Promotion()
		{

		}
		public Promotion(string name,string note,string reserve)
		{
			this.name = name;
			this.note = note;
			this.reserve = reserve;
		}
		/*
		public string getName()
		{return name;}
		public void setName(string name)
		{this.name = name;}

		public string getNote()
		{return note;}
		public void setNote(string note)
		{this.note = note;}

		public string getReserve()
		{return reserve;}
		public void setReserve(string reserve)
		{this.reserve = reserve;}
*/
		public string Promote
		{
			get{ return name; }
			set{ name = value; }
		}
		public string Note
		{
			get{ return note; }
			set{ note = value; }
		}
		public string Reserve
		{
			get{ return reserve; }
			set{ reserve = value; }
		}

	}
}
