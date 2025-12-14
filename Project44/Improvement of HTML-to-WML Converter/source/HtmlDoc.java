public class HtmlDoc  
{
	public HtmlDoc()
	{
		index = 0;
		stOut = "";
	} 
	int index;
	String stOut;
	public int incIndex(int incVal)
	{
		index += incVal;
		return index;
	}
	public int getIndex()
	{
		return index;
	}
	public void setIndex(int setVal)
	{
		index = setVal;
	}
	public String incStr(String incVal)
	{
		stOut += incVal;
		return stOut;
	}
	public String incStr(char incVal)
	{
		stOut += incVal;
		return stOut;
	}
	public String getStr()
	{
		return stOut;
	}
	public void setStr(String setVal)
	{	
		stOut = setVal;
	}
	public void setStr(char setVal)
	{
		stOut = "";
		stOut += setVal;
	}
}