using System;
using System.Xml;
using System.Data;
using System.IO;
using System.Text;


namespace WebApplication1
{
	/// <summary>
	/// Summary description for XMLConverter.
	/// </summary>
	public class XMLConverter
	{
		private DataSet dataSet;
		public XMLConverter(string xmlString)
		{
			try
			{	
				Stream xmlStream = new MemoryStream(ASCIIEncoding.Default.GetBytes(xmlString));
				dataSet = new DataSet();
				dataSet.ReadXml(xmlStream,XmlReadMode.Auto);
			}
			catch(Exception ex)
			{
				ex.ToString();
			}
		}
		public DataSet getXmlDataSet()
		{
			return dataSet;
		}
	}
}
