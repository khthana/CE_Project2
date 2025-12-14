package com.poqit.wml.Producer;

import java.io.*;
import java.net.*;

public class FormFilter 
{
	public void execute(URL context,String html) throws Exception
	{
		int formIndex;
		int formCount;
		String htmlLOWER;
		String[] nameArray = new String[50];
		htmlLOWER = html.toLowerCase();

		//count form tag
		formCount = 0;
		formIndex = htmlLOWER.indexOf("<form",0);
		while (htmlLOWER.indexOf("<form",formIndex) != -1)
		{
			formCount++;
			formIndex = htmlLOWER.indexOf("<form",formIndex) + 5;
		}

		//get variable for each form
		int from = 0;

		FileWriter fout = new FileWriter("c:/success/properties/form.properties");
		BufferedWriter bout = new BufferedWriter(fout);
		PrintWriter pout = new PrintWriter(bout);

		for (int i=0; i<formCount; i++)
		{
			for (int j=0; j<50; j++)
			{
				nameArray[j]="";
			}
			int startForm = htmlLOWER.indexOf("<form",from);
			int endForm = htmlLOWER.indexOf("</form>",htmlLOWER.indexOf("<form",from));
			from = htmlLOWER.indexOf("<form",from) + 5;
			int current = startForm;
			int inputCount = 0;

			//get action of form
			int actionIndex = htmlLOWER.indexOf("action=",startForm) + 7;
			String quote = htmlLOWER.substring(actionIndex,actionIndex+1);
			String action = "";
			if (quote.equals("\""))
			{
				action = html.substring(actionIndex+1,htmlLOWER.indexOf("\"",actionIndex+1));
			}
			else
			{
				int space = htmlLOWER.indexOf(" ",actionIndex);
				int bracket = htmlLOWER.indexOf(">",actionIndex);
				if ((space<bracket) && (space != -1))
				{
					action = html.substring(actionIndex,space);
				}
				else
				{
					action = html.substring(actionIndex,bracket);
				}
			}
			URL actionFull = new URL(context,action);
			pout.println("form" + i + ".action=" + actionFull);

			//get method of form
			int methodIndex = htmlLOWER.indexOf("method=",startForm) + 7;
			quote = htmlLOWER.substring(methodIndex,methodIndex+1);
			String method = "";
			if (quote.equals("\""))
			{
				method = htmlLOWER.substring(methodIndex+1,htmlLOWER.indexOf("\"",methodIndex+1));
			}
			else
			{
				int space = htmlLOWER.indexOf(" ",methodIndex);
				int bracket = htmlLOWER.indexOf(">",methodIndex);
				if ((space<bracket) && (space != -1))
				{
					method = htmlLOWER.substring(methodIndex,space);
				}
				else
				{
					method = htmlLOWER.substring(methodIndex,bracket);
				}
			}
			pout.println("form" + i + ".method=" + method);

			//get type and name of each input
			while (htmlLOWER.indexOf("<input",current)<endForm && htmlLOWER.indexOf("<input",current) != -1)
			{
				int startInput = htmlLOWER.indexOf("<input",current);
				int endInput = htmlLOWER.indexOf(">",startInput);

				// get type of input
				int startType = htmlLOWER.indexOf("type=",startInput)+5;
				quote = htmlLOWER.substring(startType,startType+1);
				String type = "";
				if (quote.equals("\""))
				{
					type = htmlLOWER.substring(startType+1,htmlLOWER.indexOf("\"",startType+1));
				}
				else
				{
					int space = htmlLOWER.indexOf(" ",startType);
					int bracket = htmlLOWER.indexOf(">",startType);
					if ((space<bracket) && (space != -1))
					{
						type = htmlLOWER.substring(startType,space);
					}
					else
					{
						type = htmlLOWER.substring(startType,bracket);
					}
				}

				int startName = htmlLOWER.indexOf("name=",startInput)+5;
				quote = htmlLOWER.substring(startName,startName+1);
				String name = "";
				if (quote.equals("\""))
				{
					name = html.substring(startName+1,htmlLOWER.indexOf("\"",startName+1));
				}
				else
				{
					int space = htmlLOWER.indexOf(" ",startName);
					int	bracket = htmlLOWER.indexOf(">",startName);
					if ((space<bracket) && (space != -1))
					{
						name = html.substring(startName,space);
					}
					else
					{
						name = html.substring(startName,bracket);
					}
				}

				// get value of hidden
				String value = "";
				if (type.equals("hidden"))
				{
					int valueIndex = htmlLOWER.indexOf("value=",startInput)+6;
					quote = htmlLOWER.substring(valueIndex,valueIndex+1);
					if (quote.equals("\""))
					{
						value = html.substring(valueIndex+1,htmlLOWER.indexOf("\"",valueIndex+1));
					}
					else
					{
						int space = htmlLOWER.indexOf(" ",valueIndex);
						int	bracket = htmlLOWER.indexOf(">",valueIndex);
						if ((space<bracket) && (space != -1))
						{
							value = html.substring(valueIndex,space);
						}
						else
						{
							value = html.substring(valueIndex,bracket);
						}
					}
				}
				else
				{
					value="";
				}

				//store variable name
				boolean recur = false;
				for (int k=0; k<inputCount; k++)
				{
					if (nameArray[k].equals(name))
					{
						recur = true;
					}
				}

				if ((type.equals("hidden") || type.equals("text") || type.equals("password") || type.equals("checkbox") || type.equals("radio") || type.equals("file")) && (!recur))
				{
					pout.println("form" + i +".variable" + inputCount + "=" + name);
					nameArray[inputCount] = name;
					pout.println("form" + i +".value" + inputCount + "=" + value);
					inputCount++;
				}
				current = endInput;
			}//end while loop input
			
			//get name of select tag
			current = startForm;
			while (htmlLOWER.indexOf("<select",current)<endForm && htmlLOWER.indexOf("<select",current) != -1)
			{
				int startSel = htmlLOWER.indexOf("<select",current);
				int endSel = htmlLOWER.indexOf(">",startSel);

				// get name of input
				int startName = htmlLOWER.indexOf("name=",startSel)+5;
				quote = htmlLOWER.substring(startName,startName+1);
				String name = "";
				if (quote.equals("\""))
				{
					name = html.substring(startName+1,htmlLOWER.indexOf("\"",startName+1));
				}
				else
				{
					int space = htmlLOWER.indexOf(" ",startName);
					int	bracket = htmlLOWER.indexOf(">",startName);
					if ((space<bracket) && (space != -1))
					{
						name = html.substring(startName,space);
					}
					else
					{
						name = html.substring(startName,bracket);
					}
				}

				//store variable name
				boolean recur = false;
				for (int k=0; k<inputCount; k++)
				{
					if (nameArray[k].equals(name))
					{
						recur = true;
					}
				}

				if (!recur)
				{
					pout.println("form" + i +".variable" + inputCount + "=" + name);
					nameArray[inputCount] = name;
					pout.println("form" + i +".value" + inputCount + "=");
					inputCount++;
				}
				current = endSel;
			}//end while loop (select)

			//get name of <textarea> tag
			current = startForm;
			while (htmlLOWER.indexOf("<textarea",current)<endForm && htmlLOWER.indexOf("<textarea",current) != -1)
			{
				int startTA = htmlLOWER.indexOf("<textarea",current);
				int endTA = htmlLOWER.indexOf(">",startTA);

				// get name of textarea
				int startName = htmlLOWER.indexOf("name=",startTA)+5;
				quote = htmlLOWER.substring(startName,startName+1);
				String name = "";
				if (quote.equals("\""))
				{
					name = html.substring(startName+1,htmlLOWER.indexOf("\"",startName+1));
				}
				else
				{
					int space = htmlLOWER.indexOf(" ",startName);
					int	bracket = htmlLOWER.indexOf(">",startName);
					if ((space<bracket) && (space != -1))
					{
						name = html.substring(startName,space);
					}
					else
					{
						name = html.substring(startName,bracket);
					}
				}

				//store variable name
				boolean recur = false;
				for (int k=0; k<inputCount; k++)
				{
					if (nameArray[k].equals(name))
					{
						recur = true;
					}
				}

				if (!recur)
				{
					pout.println("form" + i +".variable" + inputCount + "=" + name);
					nameArray[inputCount] = name;
					pout.println("form" + i +".value" + inputCount + "=");
					inputCount++;
				}
				current = endTA;
			}//end while loop (textarea)

			pout.println("form" + i + ".variable.count=" + inputCount);

		}//end for loop
		pout.close();
	}
}