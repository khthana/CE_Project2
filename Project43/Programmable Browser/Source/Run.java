import java.util.*;
import java.net.*;
import java.io.*;

class Run  
{
	int state = 0;
	int loopCount=0;
	int count;
	int countIf = 0; 
	int countWhile = 0;

	boolean swap = false;
	boolean setCurrent = false;
	boolean ifFact = false;
	boolean whileFact=false;
	boolean repeatInLoop = false;
	boolean repeatFact = false;
	boolean tomorrow = false;
	boolean ifNotDone = false;

	String getStatement = "";
	String script;

	TimerAgent agent;

	Hashtable variableInt = new Hashtable();
	Hashtable variableString = new Hashtable();

	Vector statementDone = new Vector();
	Vector statementNotDone = new Vector();
	Vector commandInLoop = new Vector();
	Vector tmpStatementDone = new Vector();
	Vector tmpCommandInLoop = new Vector();


	Run(String script)
	{
		String tmpTest="";
		this.script = script;
		this.script = deleteComment(script);
		this.script = set3(this.script);
		this.script = set4(this.script);
		this.script = set5(this.script);
		this.script = set6(this.script);
		this.script = set7(this.script);

		StringTokenizer all = new StringTokenizer(this.script);
		while (all.hasMoreTokens())
		{
			String k = all.nextToken();
			tmpTest = tmpTest + k;
		}
		getOrder(tmpTest);
	}

	void stateOrder(String tmpOrder)
	{
		switch (state)
		{
		case 0: if (tmpOrder.equals("int"))		{ state = 3; }
				if (tmpOrder.equals("string"))	{ state = 7; }				
				if (tmpOrder.equals("begin"))	{ state = 1; }				
				break;
		case 1: 
				if (!(statementNotDone.isEmpty()))
				{	
					if (statementNotDone.elementAt(0).equals("if"))
					{
						ifNotDone = true;
					}
					else {ifNotDone = false;}
					if (((tmpOrder.charAt(0)=='i')&&(tmpOrder.charAt(1)=='f')) || ((tmpOrder.charAt(0)=='w')&&(tmpOrder.charAt(1)=='h')&&(tmpOrder.charAt(2)=='i')&&(tmpOrder.charAt(3)=='l')&&(tmpOrder.charAt(4)=='e')) || (tmpOrder.equals("else")))
					{
						setCommandLoop(tmpOrder);
						statementNotDone.addElement(tmpOrder);
						count++;
					}
					else if (tmpOrder.equals("end"))
					{
						setCommandLoop(tmpOrder);
						int size = statementNotDone.size();
						statementNotDone.removeElementAt(size-1);					
					}
					else 
					{
						setCommandLoop(tmpOrder);
					}
					
				}
				else
				{  
					if (tmpOrder.equals("end."))
					{
						state = 11;
					}
					else if (tmpOrder.equals("end"))
					{
						setCommandLoop(tmpOrder);

						Object stateDone = statementDone.lastElement();
					
						String getStatementDone = stateDone.toString();						

						if ((!(getStatementDone.equals("if"))) &&  (!(getStatementDone.equals("else"))) )
						{
							boolean checkLoopCondition = getFactWhileCondition(getStatementDone);

							if (checkLoopCondition)
							{
								Object commandLoop = commandInLoop.lastElement();
							
								String getCommandLoop = commandLoop.toString();
								
								int counting=0;
								String commandDone = "";
								StringTokenizer CommandTag = new StringTokenizer(getCommandLoop,";");
								while (CommandTag.hasMoreElements())
								{
									String comLp = CommandTag.nextToken();
									counting++;
									if (counting>2)
									{
										commandDone = commandDone + comLp + ";";
									}

								}							
								repeatInLoop = true;
								getOrder(commandDone);
							}
							else 
							{
								Object tmpStatement = statementDone.lastElement();
								Object tmpCommand = commandInLoop.lastElement();

								tmpStatementDone.addElement(tmpStatement);
								tmpCommandInLoop.addElement(tmpCommand);

								statementDone.removeElementAt(statementDone.size()-1);
								commandInLoop.removeElementAt(commandInLoop.size()-1);
								if (swap)
								{
									repeatInLoop = true;							
									swap = false;
								}
								else { 
									repeatInLoop = false; 
								}								
								loopCount--;
							}
						}

						else
						{
							statementDone.removeElementAt(statementDone.size()-1);
							commandInLoop.removeElementAt(commandInLoop.size()-1);
						}
					}
					else if ((tmpOrder.charAt(0) == 'i')&&(tmpOrder.charAt(1) == 'f'))
					{
						setCommandLoop(tmpOrder);
						String tmp = tmpOrder.substring(2);
						ifFact = getIfCondition(tmp);
						if (ifFact)
						{
							getStatement = "if";
							statementDone.addElement(getStatement);
							commandInLoop.addElement("if;");
							state = 2;
						}
						else 
						{	
							getStatement = "if";
							statementNotDone.addElement(getStatement);
							count++;
							countIf++;
							state = 1;							
						}
					}

					else if ((tmpOrder.charAt(0) == 'w')&&(tmpOrder.charAt(1) == 'h')&&(tmpOrder.charAt(2) == 'i')&&(tmpOrder.charAt(3) == 'l')&&(tmpOrder.charAt(4) == 'e'))
					{						
						String tmp = tmpOrder.substring(5);
						whileFact = getWhileCondition(tmp);	
						if (whileFact) {
							statementDone.addElement(getStatement);
							commandInLoop.addElement("");									
							loopCount++;
							state = 2;							
						}
						else {	
							statementNotDone.addElement(getStatement);
							count++;
							countWhile++;
							state = 1;							
						}

						if (!repeatInLoop)
						{ setCommandLoop(tmpOrder); }
						else 
						{
							int loop = commandInLoop.size()-1;

							Object tmpCom = tmpCommandInLoop.lastElement();
							String tmpCom1 = tmpCom.toString();

							tmpCommandInLoop.removeElementAt(tmpCommandInLoop.size()-1);
							tmpStatementDone.removeElementAt(tmpStatementDone.size()-1);

							Object loopCom = commandInLoop.elementAt(loop);
							String loopCommand = loopCom.toString();
							loopCommand = loopCommand + tmpCom1;
							commandInLoop.setElementAt(loopCommand,loop);
							swap = true;
						}
						
					}

					else if (tmpOrder.equals("else"))
					{
						setCommandLoop(tmpOrder);
						if (ifNotDone)
						{
							statementDone.addElement("else");
							commandInLoop.addElement("else;");
							state = 2;
							ifNotDone = false;
						}
						else 
						{					
							statementNotDone.addElement(getStatement);
							count++;
							state = 1;
						}
						
					}

					else if (tmpOrder.equals("repeat"))
					{
						statementDone.addElement(tmpOrder);
						commandInLoop.addElement("");
						loopCount++;

						if (!repeatInLoop)
						{ setCommandLoop(tmpOrder); }
						else 
						{
							int loop = commandInLoop.size()-1;

							Object tmpCom = tmpCommandInLoop.lastElement();
							String tmpCom1 = tmpCom.toString();

							tmpCommandInLoop.removeElementAt(tmpCommandInLoop.size()-1);
							tmpStatementDone.removeElementAt(tmpStatementDone.size()-1);

							Object loopCom = commandInLoop.elementAt(loop);
							String loopCommand = loopCom.toString();
							loopCommand = loopCommand + tmpCom1;
							commandInLoop.setElementAt(loopCommand,loop);
							swap = true;
						}
					}

					else if ((tmpOrder.charAt(0) == 'u') && (tmpOrder.charAt(1) == 'n') && (tmpOrder.charAt(2) == 't') && (tmpOrder.charAt(3) == 'i') && (tmpOrder.charAt(4) == 'l'))
					{
						setCommandLoop(tmpOrder);

						String tmp = tmpOrder.substring(5);
						repeatFact = getWhileCondition(tmp);	

						if (!repeatFact)
							{
								Object commandLoop = commandInLoop.lastElement();
						
								String getCommandLoop = commandLoop.toString();
								
								int counting=0;
								String commandDone = "";
								StringTokenizer CommandTag = new StringTokenizer(getCommandLoop,";");
								while (CommandTag.hasMoreElements())
								{
									String comLp = CommandTag.nextToken();
									counting++;
									if (counting>1)
									{ commandDone = commandDone + comLp + ";"; }
								}
								repeatInLoop = true;
								getOrder(commandDone);
							}
							else 
							{
								Object tmpStatement = statementDone.lastElement();
								Object tmpCommand = commandInLoop.lastElement();

								tmpStatementDone.addElement(tmpStatement);
								tmpCommandInLoop.addElement(tmpCommand);

								statementDone.removeElementAt(statementDone.size()-1);
								commandInLoop.removeElementAt(commandInLoop.size()-1);
								if (swap)
								{
									repeatInLoop = true;							
									swap = false;
								}
								else 
								{
									repeatInLoop = false;
								}
								loopCount--;
							}
					}

					else 
					{	
						setCommandLoop(tmpOrder);
						StringTokenizer checkAssign = new StringTokenizer(tmpOrder,"=");
						if (checkAssign.countTokens() == 1)
							{ processOrder(tmpOrder); }
						else { getAssign(tmpOrder); }
					}					
				}
				break;
		case 2: 
				if (tmpOrder.equals("begin"))
				{
					state = 1;
					setCommandLoop("begin");
				}
				break;
	
		case 3: 
				StringTokenizer varStr = new StringTokenizer(tmpOrder,"=");
				if (varStr.countTokens()==1)
				{
					variableInt.put(tmpOrder,new Integer(0));
				}
				else 
				{
					int convert;
					String varName = varStr.nextToken();
					String value = varStr.nextToken();
					convert = new Integer(value).intValue();
					variableInt.put(varName,new Integer(convert));
					
				}
				state = 0;
				break;

		case 4: if (tmpOrder.equals("end"))
					{ state = 1; }
				else {processOrder(tmpOrder);}
				break;

		case 5: if (tmpOrder.equals("until"))
				{ state = 6; }
				break;
		case 6: //comparation after until
				state = 1;
				if (!(getWhileCondition(tmpOrder)))
				{
					statementDone.setElementAt(getStatement,loopCount-1);
					
					Object commandLoop = commandInLoop.elementAt(loopCount-1);
					String getCommandLoop = commandLoop.toString();
								
					int counting=0;
					String commandDone = "";
					StringTokenizer CommandTag = new StringTokenizer(getCommandLoop,";");
					while (CommandTag.hasMoreElements())
					{
						String comLp = CommandTag.nextToken();
						counting++;
						if (counting>2)
						{ commandDone = commandDone + comLp + ";"; }
					}
					repeatInLoop = true;
					getOrder(commandDone);
				}
				else 
				{
					if (loopCount == 1)
					{
						statementDone.removeAllElements();
						commandInLoop.removeAllElements();
					}
					repeatInLoop = false;				
					loopCount--;
				}
				break;
		
		case 7 : 
				StringTokenizer varStr1 = new StringTokenizer(tmpOrder,"=");
				if (varStr1.countTokens()==1)
				{ variableString.put(tmpOrder,""); }
				else 
				{
					String varName = varStr1.nextToken();
					String value = varStr1.nextToken();				
					variableString.put(varName,value);					
				}
				state = 0;
				break;
		case 11:
				break;		
		}
	}

	void setCommandLoop(String tmpOrder)
	{
		if ((loopCount>0) && (!repeatInLoop))
		{			
			int loop = commandInLoop.size()-1;

			while (loop >= 0)
			{
				Object loopCom = commandInLoop.elementAt(loop);
				String loopCommand = loopCom.toString();
				loopCommand = loopCommand + tmpOrder + ";";		
				commandInLoop.setElementAt(loopCommand,loop);
				loop--;
			}
		}
	}


	void getAssign(String tmpOrder)
	{
		StringTokenizer assign = new StringTokenizer(tmpOrder,"=");		

		String staticVar = assign.nextToken();
		String changedVar = assign.nextToken();

		if (variableInt.containsKey(staticVar))
		{
			int newValue = assignVarInt(changedVar);
			variableInt.remove(staticVar);
			variableInt.put(staticVar,new Integer(newValue));

		}

		else if (variableString.containsKey(staticVar))
		{
			String newValue = assignVarString(changedVar);
			variableString.remove(staticVar);
			variableString.put(staticVar,newValue);
		}
	}

	int assignVarInt(String changedVar)
	{
		int newValue = 0;
		int i = 0;
		while ((i< changedVar.length()) && (!( (changedVar.charAt(i)=='+') || (changedVar.charAt(i)=='-') || (changedVar.charAt(i)=='*') || (changedVar.charAt(i)=='/')) ))
		{
			i++;
		}
		String chaVar = changedVar.substring(0,i);
		String valueStr = changedVar.substring(i+1);

		Integer valueInt = (Integer)variableInt.get(chaVar);
		int value = valueInt.intValue();
		int tmpValue = new Integer(valueStr).intValue();
		if ( changedVar.charAt(i)=='+'){newValue = value+tmpValue;}
		else if ( changedVar.charAt(i)=='-'){newValue = value-tmpValue;}
		return newValue;
	}

	String assignVarString(String changedVar)
	{
		String newValue="";
		StringTokenizer checkChange = new StringTokenizer(changedVar,"/");
		if (checkChange.countTokens() > 1)
		{ newValue = cgiFunction(changedVar); }
		else {
			int i = 0;
			while ((i< changedVar.length()) && (!( (changedVar.charAt(i)=='+') ) ))
			{
				i++;
			}

			String chaVar = changedVar.substring(0,i);
			String valueStr = changedVar.substring(i+1);
			String valueInt = (String)variableString.get(chaVar);
			newValue = valueInt+valueStr;
		}
		return newValue;
	}

	boolean getIfCondition(String tmpOrder)
	{
		boolean fact=false;
		int i = 1;
		if (tmpOrder.charAt(0)== '(')
		{	
			while (tmpOrder.charAt(i) != ')')
			{
				i++;
			}
			String condition = tmpOrder.substring(1,i);
			fact = getFactWhileCondition(condition);
		}
		return fact;
	}

	boolean getWhileCondition(String tmpOrder)
	{
		boolean fact=false;
		int i = 1;	
		if (tmpOrder.charAt(0)== '(')
		{
			System.out.println("( => OK");
			while (tmpOrder.charAt(i) != ')')
			{
				i++;
			}
			String condition = tmpOrder.substring(1,i);
			getStatement = condition;		
			fact = getFactWhileCondition(condition);
		}
		return fact;
	}

	boolean getFactWhileCondition(String condition)
	{
		boolean fact=false;
		
		StringTokenizer cond = new StringTokenizer(condition,"<");
			if (cond.countTokens() != 1)
			{
				boolean eq = false;
				String varCompare = cond.nextToken();
				String valueCompare = cond.nextToken();
				if (valueCompare.charAt(0) == '=')
				{
					eq = true;
					valueCompare = valueCompare.substring(1);
				}
				int compValue = new Integer(valueCompare).intValue();
				Integer value = (Integer)variableInt.get(varCompare);
				int realValue = value.intValue();				
				if (eq)
				{
					if (realValue <= compValue)	{ fact = true; }
					else {fact = false;}
					eq = false;
				}
				else
				{
					if (realValue < compValue) { fact = true; }
					else {fact = false;}
				}				
			}

			else
			{
				StringTokenizer cond1 = new StringTokenizer(condition,">");
				if (cond1.countTokens() != 1)
				{
					boolean eq = false;
					String varCompare = cond1.nextToken();				
					String valueCompare = cond1.nextToken();
					if (valueCompare.charAt(0) == '=')
					{
						eq = true;
						valueCompare = valueCompare.substring(1);
					}
					int compValue = new Integer(valueCompare).intValue();
					Integer value = (Integer)variableInt.get(varCompare);
					int realValue = value.intValue();

					if (eq)
					{
						if (realValue >= compValue) { fact = true; }
						else {fact = false;}
						eq = false;
					}
					else
					{
						if (realValue > compValue) { fact = true; }
						else {fact = false;}
					}
					
				}
				else
				{
						StringTokenizer cond3 = new StringTokenizer(condition,"!");
						if (cond3.countTokens() != 1)
						{
							boolean eq = false;
							String varCompare = cond3.nextToken();
							String valueCompare = cond3.nextToken();
							if (valueCompare.charAt(0) == '=')
							{
								eq = true;
								valueCompare = valueCompare.substring(1);
							}
							int compValue = new Integer(valueCompare).intValue();
							Integer value = (Integer)variableInt.get(varCompare);
							int realValue = value.intValue();

							if (eq)
							{
								if (realValue != compValue) { fact = true; }
								else {fact = false;}
								eq = false;
							}
							else fact = false;	
						}
						else
						{
							StringTokenizer cond2 = new StringTokenizer(condition,"==");
							if (cond2.countTokens() != 1)
							{
								String varCompare = cond2.nextToken();
								String valueCompare = cond2.nextToken();
								int compValue = new Integer(valueCompare).intValue();
								Integer value = (Integer)variableInt.get(varCompare);
								int realValue = value.intValue();

								if (realValue == compValue) { fact = true; }
								else {fact = false;}
							}
						}
				}
			}
		return fact;
	}

	String set6(String script)
	{
		int i = 0;
		int tmpIndex = i;
		while (i < script.length()-5)
		{
			if ((script.charAt(i) == 'b')&& (script.charAt(i+1) == 'e') && (script.charAt(i+2) == 'g') && (script.charAt(i+3) == 'i') && (script.charAt(i+4) == 'n') && ((script.charAt(i+5) == ' ')||(script.charAt(i+5) == '\n'))) 
			{
				String tmpScript = script.substring(0,i+6);
				String tmp = script.substring(i+6);
				tmpScript = tmpScript+";";
				script = tmpScript + tmp;
				tmpIndex = i;
			}
			i++;
		}
		return(script);
	}

	String set5(String script)
	{
		int i = 0;
		int tmpIndex = i;
		while (i < script.length()-4)
		{
			if (((script.charAt(i) == 't')&& (script.charAt(i+1) == 'h') && (script.charAt(i+2) == 'e') && (script.charAt(i+3) == 'n')&& ((script.charAt(i+4) == ' ')||(script.charAt(i+4) == '\n')))  || ((script.charAt(i) == 'e')&& (script.charAt(i+1) == 'l') && (script.charAt(i+2) == 's') && (script.charAt(i+3) == 'e') && ((script.charAt(i+4) == ' ')||(script.charAt(i+4) == '\n'))))
			{
				String tmpScript = script.substring(/*tmpIndex*/0,i+5);
				String tmp = script.substring(i+5);
				tmpScript = tmpScript+";";
				script = tmpScript + tmp;				
			}
			i++;
		}
		return(script);
	}

	String set3(String script)
	{
		int i = 0;
		int tmpIndex = i;
		while (i < script.length()-2)
		{
			if ((script.charAt(i) == 'd')&& (script.charAt(i+1) == 'o') && ((script.charAt(i+2) == ' ')||(script.charAt(i+2) == '\n')) )
			{
				String tmpScript = script.substring(/*tmpIndex*/0,i+3);
				String tmp = script.substring(i+3);
				tmpScript = tmpScript+";";
				script = tmpScript + tmp;
			}
			i++;
		}
		return(script);
	}


	String set4(String script)
	{
		int i = 0;
		int tmpIndex = i;
		while (i < script.length()-3)
		{
			if ((script.charAt(i) == 'i')&& (script.charAt(i+1) == 'n') && (script.charAt(i+2) == 't') && ((script.charAt(i+3) == ' ')||(script.charAt(i+3) == '\n')) )
			{
				String tmpScript = script.substring(/*tmpIndex*/0,i+4);
				String tmp = script.substring(i+4);
				tmpScript = tmpScript+";";
				script = tmpScript + tmp;				
			}
			i++;
		}
		return(script);
	}
	
	String set7(String script)
	{
		int i = 0;
		int tmpIndex = i;
		while (i < script.length()-6)
		{
			if (((script.charAt(i) == 'r')&& (script.charAt(i+1) == 'e') && (script.charAt(i+2) == 'p') && (script.charAt(i+3) == 'e') && (script.charAt(i+4) == 'a') && (script.charAt(i+5) == 't') && ((script.charAt(i+6) == ' ')||(script.charAt(i+6) == '\n'))) || ((script.charAt(i) == 's')&& (script.charAt(i+1) == 't') && (script.charAt(i+2) == 'r') && (script.charAt(i+3) == 'i') && (script.charAt(i+4) == 'n') && (script.charAt(i+5) == 'g') && ((script.charAt(i+6) == ' ')||(script.charAt(i+6) == '\n')))   )
			{
				String tmpScript = script.substring(/*tmpIndex*/0,i+7);
				String tmp = script.substring(i+7);
				tmpScript = tmpScript+";";
				script = tmpScript + tmp;				
			}
			i++;
		}
		return(script);
	}

	String cgiFunction(String changedVar)
	{
		String result = "";		 
		StringTokenizer cgiOrder = new StringTokenizer(changedVar,"(");
		String cgiUrl = cgiOrder.nextToken();
		String param = cgiOrder.nextToken();

		StringTokenizer cgiPath = new StringTokenizer(cgiUrl,"/");
		String cgiComm="";
		while (cgiPath.hasMoreTokens())
		{
			cgiComm = cgiPath.nextToken();
		}

		if (cgiComm.equals("fc2b"))
		{

			StringTokenizer cgiParam = new StringTokenizer(param,",");
			String d_currency = cgiParam.nextToken();
			String fc_amount = cgiParam.nextToken();
			fc_amount = fc_amount.substring(0,fc_amount.length()-1);
			
			try
			{
				GetHtml url = new GetHtml("http://"+cgiUrl+".cgi?d_currency="+d_currency+"&fc_amount="+fc_amount);	
				String ans1 = getDataFromFile("d://search_result.html");
				result = getResult(ans1);
			}
			catch (MalformedURLException me)
			{ System.out.println("MalformedURLException occurs!!!"); }
			catch (IOException ioe)
			{ System.out.println("IOException occurs!!!"); }

		}

		return(result);

	}

//*****************
	String getDataFromFile(String path)
	{
		boolean more=true;
		String line;
		String result = "";
		try
		{			
				FileInputStream fin = new FileInputStream(path);
				BufferedReader in = new BufferedReader(new InputStreamReader(fin));

				while (more)
				{
					line = in.readLine();
					if (line == null)
					{
						more = false;
					}
					else result = result + line;
				}
		}
		catch (FileNotFoundException fe){System.out.println(fe);}		
		catch (IOException ie)			{System.out.println(ie);}			

		return result;
	}

//******************

	String getResult(String ans)
	{
		int i = 0;
		int lengthAns = ans.length();
		while (i<lengthAns-6)
		{
			if ((ans.charAt(i) == 'A') && (ans.charAt(i+1) == 'n') && (ans.charAt(i+2) == 's') && (ans.charAt(i+3) == 'w') && (ans.charAt(i+4) == 'e') && (ans.charAt(i+5) == 'r') && (ans.charAt(i+6) == '=') )
			{
				ans = ans.substring(i+7,lengthAns-3);
				i=lengthAns-6;
				
			}
			else i++;
		}
		return ans;
	}

	String deleteComment(String script)
	{
		String tmpScript = "";
		int i=0;
		int begin = 0;
		while (i<script.length()-1)
		{
			if ((script.charAt(i) == '/') && (script.charAt(i+1) == '/'))
			{
				int tmp = i;
				while (script.charAt(i)!= '\n')
				{
					i++;
				}
				tmpScript = tmpScript + script.substring(begin,tmp);
				begin = i+1;
			}
			i++;		
		}
	
		tmpScript = tmpScript + script.substring(begin);
		System.out.println(tmpScript);
		return(tmpScript);
	}

	void getOrder(String tmpTest)
	{
		try
		{
			StringTokenizer order = new StringTokenizer(tmpTest,";");
			while (order.hasMoreTokens())
			{
				String tmpOrder = order.nextToken();
				System.out.println("Token : " + tmpOrder);
				stateOrder(tmpOrder);
			}
			System.out.println("Not have more token!!");
		}
		catch (NoSuchElementException ns)
		{ System.out.println("Oh!!! No Such Element"); }		
	}

	void processOrder(String tmpOrder)
	{
		String time = "";
		StringTokenizer subOrder = new StringTokenizer(tmpOrder,"#");
		agent = new TimerAgent();
		if (subOrder.countTokens() != 1)
		{
			String getTime = subOrder.nextToken();
			StringTokenizer timer = new StringTokenizer(getTime,"%");
			if (timer.countTokens() !=1)
			{
				String day = timer.nextToken();
				if (day.equals("tomorrow")) { tomorrow = true; }
				else tomorrow = false;
				agent.getTomorrow(tomorrow);
				time = timer.nextToken();
			}
			else time = timer.nextToken();
			
			setTime(time);
		}
		else {setCurrent = true;}

		String function = subOrder.nextToken();
		while (agent.running){}
		if (setCurrent)
		{
			setCurrentTime();
			setCurrent = false;
		}
		setFunction(function);
	}

	void setCurrentTime()
	{

			Calendar now = Calendar.getInstance();	
			int hour = now.get(Calendar.HOUR);
			int min = now.get(Calendar.MINUTE);
			int mid = now.get(Calendar.AM_PM);
			if (mid == 0) { agent.setMid(0); }
			else agent.setMid(1);

			now.set(Calendar.HOUR,hour);
			now.set(Calendar.MINUTE,min);

			agent.setTime(now.getTime());
	}

	void setTime(String time)
	{
		

		try
		{
			StringTokenizer tokTime = new StringTokenizer(time,":");
			int hour = new Integer(tokTime.nextToken()).intValue();
			int min = new Integer(tokTime.nextToken()).intValue();
			Calendar functionTime = Calendar.getInstance();

			if (hour>=12)
			{			
				agent.setMid(1);
				System.out.println("At PM!!");
				hour = hour - 12;
			}
			else 	agent.setMid(0);
			functionTime.set(Calendar.HOUR,hour);
			functionTime.set(Calendar.MINUTE,min);
			

			agent.setTime(functionTime.getTime());
			
		}
		catch (NumberFormatException nf)
		{
			System.out.println("Oh Noooooooooooooooooooooooooooooooo");
		}
		
	}

	void setFunction(String function)
	{
		if (function.equals("open")) { agent.process(1); }
		else if ((function.charAt(0)=='o')&&(function.charAt(1)=='p')&&
				 (function.charAt(2)=='e')&&(function.charAt(3)=='n')&&(function.charAt(4)=='('))
		{
			String tmp = function.substring(5,function.length()-1);
			agent.process(tmp);
		}
		else if (function.equals("close"))
		{
			agent.process(2);
		}		
		else if ((function.charAt(0)=='s')&&(function.charAt(1)=='e')&&
				 (function.charAt(2)=='a')&&(function.charAt(3)=='r')&&
				 (function.charAt(4)=='c')&&(function.charAt(5)=='h')&&
				 (function.charAt(6)=='('))
		{
			agent.processSearch(function);			
		}
		else if ((function.charAt(0)== 'n')&&(function.charAt(1)== 'e')
				&&(function.charAt(2)== 'w')&&(function.charAt(3)== 's')
				&&(function.charAt(4)== '('))
		{		
			agent.processNews(function);			
		}
		else if ((function.charAt(0) == 'w')&&(function.charAt(1) == 'a')
				&&(function.charAt(2) == 'i')&&(function.charAt(3) == 't')&&(function.charAt(4) == '('))
		{
			String timer = function.substring(5,function.length()-1);
			int time = new Integer(timer).intValue();
			agent.setWait(time);
			agent.process(0);
		}

		else 
		{
			StringTokenizer checkCGI = new StringTokenizer(function,"/");
			if (checkCGI.countTokens() > 1)
			{
				agent.getVarStr(variableString);
				agent.processCGI(function);				
			}
		}

	}

	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
