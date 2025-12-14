///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;

namespace GeoCon.Data
{
	/// <summary>
	/// Delegate to handle status event
	/// </summary>
	public delegate void StatusEventHandler(object sender, StatusEventArgs args);

	/// <summary>
	/// StatusEvent to update reading and writing status.
	/// </summary>
	[Serializable]
	public class StatusEventArgs : System.EventArgs
	{
		public string statusText;
		public int statusValue;

		public StatusEventArgs(string statustext,int statusvalue)
		{
			setCurrentStatus(statustext,statusvalue);
		}
		public void setCurrentStatus(string text,int val)
		{
			statusText=text;
			statusValue=val;
		}
	}

}
