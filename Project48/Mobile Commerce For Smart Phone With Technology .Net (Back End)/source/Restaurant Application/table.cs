using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for table.
	/// </summary>
	public class table
	{
		private int tableID;
		private string note;
		private int covers;

		public table()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public table(int tableID,string note,int covers)
		{
			this.tableID = tableID;
			this.note = note;
			this.covers = covers;
		}

		public int getTableID()
		{
			return tableID;
		}
		public void setTableID(int tableID)
		{
			this.tableID = tableID;
		}

		public string getNote()
		{
			return note;
		}
		public void setNote(string note)
		{
			this.note = note;
		}

		public int getCovers()
		{
			return covers;
		}
		public void setCovers(int covers)
		{
			this.covers = covers;
		}
	}
}
