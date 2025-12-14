using System;
using System.IO;
using System.Collections;

namespace Maker
{
	/// <summary>
	/// Summary description for File.
	/// </summary>
	public class File
	{
		private int		e;
		private string	error;
		private string	data;
		private char[]	delimiters;
		private Queue	tokens;
		private byte[]	dataByte;

		public File()
		{
			//
			// TODO: Add constructor logic here
			//
			error	= "failed";
			delimiters	= new char[] {';',' ','"',',','\r','\n','\t'};
			dataByte	= new byte[0];
		}

		public string Error
		{
			get
			{
				switch (e)
				{
					case 0:

						break;
					case 1:

						break;
					case 2:

						break;
					default:
						error	= "Unknown error!";
						break;
				}
				return error;
			}
		}

		public bool Read(string fname)
		{
			FileStream		fs	= new FileStream(fname, FileMode.Open, FileAccess.Read);
			StreamReader	sr	= new StreamReader(fs);
			data	= sr.ReadToEnd();
			sr.Close();

			return true;
		}

		public bool ReadByte(string fname)
		{
			FileStream		fs	= new FileStream(fname, FileMode.Open, FileAccess.Read);
			fs.Read(dataByte, 0, (int)fs.Length);
			fs.Close();
			return true;
		}

		public bool Write(string fname)
		{

			return true;
		}


		public void Tokenize()
		{
			string[] token	= data.Split(delimiters);
			tokens	= new Queue();
			for (int i=0; i<token.Length; i++)
			{
				if (token[i].Length>0)
					tokens.Enqueue(token[i].ToLower());
			}
		}

		public Queue Tokens
		{
			get
			{
				return tokens;
			}
		}

		public byte[] Bytes
		{
			get
			{
				return dataByte;
			}
		}
	}
}
