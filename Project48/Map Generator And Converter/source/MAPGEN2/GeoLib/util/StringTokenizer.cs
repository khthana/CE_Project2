using System;

namespace GeoCon.util
{
	/// <summary>
	/// crude imitation of StringTokenizer.
	/// </summary>
	public class StringTokenizer
	{
		// \n:newline(\x0a) \t:tab(\x09) \v:verticaltab(\x0b)  \0x2C = comma
		// \r:carriagereturn(\x0d)
		public char[] delimiters;
		public string str;
		private string token;
		private int charIndex=0;
		private int nextIndex=0;

		/// <summary>
		/// false : don't return delimiter as token
		/// true : also return each delimiter as token with length of 1
		/// </summary>
		public bool returnTokens=false;

		/// <summary>
		/// Tokenize string using 'space' as delimiter.
		/// </summary>
		/// <param name="Value">String for token</param>
		public StringTokenizer(string Value)
		{
			delimiters=new char[1]{' '};
			str=Value;
		}

		/// <summary>
		/// Tokenize string using a character as delimiter.
		/// </summary>
		/// <param name="Value">String for token</param>
		/// <param name="delim">delimiter</param>
		public StringTokenizer(string Value, char delim)
		{
			delimiters=new char[1]{delim};
			str=Value;
		}

		/// <summary>
		/// Tokenize string using array of characters as delimiters.
		/// </summary>
		/// <param name="Value">String for token</param>
		/// <param name="delims">delimiters</param>
		public StringTokenizer(string Value, char[] delims)
		{
			delimiters=delims;
			str=Value;
		}
		public void reset()
		{
			charIndex = 0;
			nextIndex = 0;
		}
		public bool hasMoreTokens()
		{
			//using Array.split will create many new string objects 
			if(charIndex >= str.Length) return false;
			int foundIdx = str.IndexOfAny(delimiters,charIndex);
			if(foundIdx == charIndex) //consecutive delimiters
			{
				if(returnTokens==false)	//skip consecutive delimiters
				{
					while(foundIdx == charIndex) 
					{
						charIndex++;
						if(charIndex >= str.Length) return false;
						foundIdx = str.IndexOfAny(delimiters,charIndex);
					}
				}
				nextIndex = foundIdx;
			}
			else if(foundIdx > charIndex)  // non consecutive delimiter
			{
				nextIndex = foundIdx;
			}
			else	//no more delimiter
			{
				nextIndex = str.Length-0;
			}
			return true;
		}
		public void skipNextToken()
		{
			if(nextIndex<=charIndex) nextIndex=charIndex+1;
			charIndex = returnTokens? nextIndex : nextIndex+1;
		}

		public string nextToken()
		{
			if(hasMoreTokens()==false) return token;
			if(nextIndex<=charIndex) nextIndex=charIndex+1;
			token = str.Substring(charIndex,nextIndex-charIndex);
			charIndex = returnTokens? nextIndex : nextIndex+1;
			return token;
		}
//		#region IDisposable Members
//		public void Dispose()
//		{
//			delimiters=null;
//			token=null;
//			str=null;
//		}
//		#endregion
	}
}
