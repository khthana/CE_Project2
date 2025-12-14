package com.poqit.wml.Producer;

public class RadioandCheckbox
{
	public String insert(String html) 
	{	
		
		int index = 0;
		int count = 0;
		int j = 0;
		String htmlLow;
		htmlLow = html.toLowerCase();
		Buffer[] buffer = new Buffer[256];
		Type inputType = new Type();
		inputType.type = new String[256];
		inputType.name = new String[256];
		inputType.index = new int[256];

		//catch and store input tag
		while (htmlLow.indexOf("<input ",index+1) != -1)
		{	
			index = htmlLow.indexOf("<input ",index+1);
			
			buffer[count] = new Buffer();
			buffer[count].startIndex = index;
			buffer[count].tag = htmlLow.substring(index,htmlLow.indexOf(">",index)+1);
			count++;
		}
		
		String itype = "";
		String iname = "";

		//separate radio and checkbox
		for (int i=0; i<count; i++)
		{
			int typeIndex = buffer[i].tag.indexOf(" type=");
			if (typeIndex != -1)
			{
				if ((buffer[i].tag.indexOf(" ",typeIndex+1) < buffer[i].tag.indexOf(">",typeIndex+1)) && (buffer[i].tag.indexOf(" ",typeIndex+1) != -1))
				{
					itype = buffer[i].tag.substring(typeIndex+6,buffer[i].tag.indexOf(" ",typeIndex+1));
				}
				else
				{
					itype = buffer[i].tag.substring(typeIndex+6,buffer[i].tag.indexOf(">",typeIndex+1));
				}
			}
			int nameIndex = buffer[i].tag.indexOf(" name=");
			if (nameIndex != -1)
			{	
				if ((buffer[i].tag.indexOf(" ",nameIndex+1) < buffer[i].tag.indexOf(">",nameIndex+1)) && (buffer[i].tag.indexOf(" ",nameIndex+1) != -1))
				{
					iname = buffer[i].tag.substring(nameIndex+6,buffer[i].tag.indexOf(" ",nameIndex+1));
				}
				else
				{
					iname = buffer[i].tag.substring(nameIndex+6,buffer[i].tag.indexOf(">",nameIndex+1));
				}
			}
			if (itype.equals("radio") || itype.equals("\"radio\""))
			{	
				inputType.type[j] = "radio";
				inputType.name[j] = iname;
				inputType.index[j] = buffer[i].startIndex;
				j++;
			}
			if (itype.equals("checkbox") || itype.equals("\"checkbox\""))
			{
				inputType.type[j] = "checkbox";
				inputType.name[j] = iname;
				inputType.index[j] = buffer[i].startIndex;
				j++;
			}
		}
		j--;
		int startGroup=0;
		int endGroup=0;
		int tempIndex=0;
		String tempType="";
		String tempName;

		//group and insert
		for (int i=j; i>=0; i--)
		{	
			if (i!=0)
			{
				if (inputType.name[i].equals(inputType.name[i-1]))
				{	
					if ((i==j) || (!inputType.name[i].equals(inputType.name[i+1])))
					{
						endGroup = html.indexOf(">",inputType.index[i]) + 1;
					}
					tempName = inputType.name[i];
					tempType = inputType.type[i];
					tempIndex = inputType.index[i];
				}		
				else
				{	
					startGroup = inputType.index[i];
					if ((i==j) || (!inputType.name[i].equals(inputType.name[i+1])))
					{
						endGroup = html.indexOf(">",inputType.index[i]) + 1;
					}
					html = html.substring(0,startGroup) + "<" + inputType.type[i] + ">" + html.substring(startGroup,html.indexOf("<",endGroup)) + "</" + inputType.type[i] +">" + html.substring(html.indexOf("<",endGroup),html.length());
				}
			}
			else
			{
				startGroup = inputType.index[i];
				if ((i==j) || (!inputType.name[i].equals(inputType.name[i+1])))
				{
					endGroup = html.indexOf(">",inputType.index[i]) + 1;
				}
				html = html.substring(0,startGroup) + "<" + inputType.type[i] + ">" + html.substring(startGroup,html.indexOf("<",endGroup)) + "</" + inputType.type[i] +">" + html.substring(html.indexOf("<",endGroup),html.length());
			}
		}
		return html;
	}
}
class Type
{
	int[] index;
	String[] type;
	String[] name;
}
class Buffer
{
	int startIndex;
	String tag;
}
