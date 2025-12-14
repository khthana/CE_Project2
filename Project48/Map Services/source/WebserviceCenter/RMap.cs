using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for RMap.
	/// </summary>
	public class RMap
	{
		private byte[] data;
		
		public RMap()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public byte[] map
		{
			get {return this.data;}
			set {this.data = value;}
		}
		
	}
}
