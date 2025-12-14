class MessageScanner
{
	public MessageScanner()
	{
	}
	public String scan(String message)
	{
		int i=-1;
		while((i = message.indexOf('&',i+1)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "&amp;";
			}else{
				message = message.substring(0,i) + "&amp;" + message.substring(i+1);
			}
		}
		i=0;
		while((i = message.indexOf('<',i)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "&lt;";
			}else{
				message = message.substring(0,i) + "&lt;" + message.substring(i+1);
			}
		}
		i=0;
		while((i = message.indexOf('>',i)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "&gt;";
			}else{
				message = message.substring(0,i) + "&gt;" + message.substring(i+1);
			}
		}
		i=0;
		while((i = message.indexOf('\'',i)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "&apos;";
			}else{
				message = message.substring(0,i) + "&apos;" + message.substring(i+1);
			}
		}
		i=0;
		while((i = message.indexOf('\"',i)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "&quot;";
			}else{
				message = message.substring(0,i) + "&quot;" + message.substring(i+1);
			}
		}
		i=-2;
		while((i = message.indexOf('$',i+2)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "$$";
				break;
			}else{
				message = message.substring(0,i) + "$$" + message.substring(i+1);
			}
		}
/*		i=0;
		while((i = message.indexOf(' ',i+1)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "&nbsp;";
			}else{
				message = message.substring(0,i) + "&nbsp;" + message.substring(i+1);
			}
		}*/
		i=0;
		while((i = message.indexOf('\n',i)) >= 0)
		{
			if (i == message.length() - 1){	//end of string
				message = message.substring(0,i) + "<br/>";
			}else{
				message = message.substring(0,i) + "<br/>" + message.substring(i+1);
			}
		}
		return message;
	}
	public boolean verifyLogin(String name)
	{
		for (int i=0; i<name.length(); i++)
		{
			char ch = name.charAt(i);
			if (!((ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || (ch == '_')))
			{
				return false;
			}
		}
		return true;
	}
}