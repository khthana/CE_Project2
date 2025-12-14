import java.io.*;
import java.awt.*;

public class ListFile
{
	SAXParserDemo sax;
	String[] list;
	TextArea status_list ;

	ListFile(String filename,TextArea status_list )
	{
		int i = 0;
		this.status_list=status_list;
		File init;
		init = new File(filename);
		list = init.list();
		while (i < list.length)
		{
			list[i] = init.getPath()+"\\"+list[i];
			i++;
		}
	}

	public void recursive()
	{
		ListFile test;
		File temp;
		int i = 0;
		while (i < list.length)
		{
			/*temp = new File(list[i]);
			if (temp.isDirectory())
			{
				System.out.println("Directory -> "+list[i]);
				test = new ListFile(list[i]);
				test.recursive();
			}
			else*/
			{
				//if (list[i].indexOf(".xml") != -1)
				if (list[i].trim().endsWith(".xml"))
				{
					System.out.println("File ------> "+list[i]);
					status_list.append("File -> "+list[i]+'\n');
					String[] arg = new String[1];
					arg[0] = list[i];
					sax = new SAXParserDemo(arg,status_list);
				}
			}
			i++;
		}
		status_list.append("==== FINISH INDEX ====");
	}

	public static void main(String[] args) 
	{
		/*if (args.length > 0)
		{
			ListFile t = new ListFile(args[0]);
			t.recursive();
		}
		else System.out.println("Error\nRequired 1 Parameter");*/
	}
}