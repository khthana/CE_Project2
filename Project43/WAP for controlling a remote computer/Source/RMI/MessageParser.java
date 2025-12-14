import java.util.Hashtable;
class MessageParser
{
	Hashtable table = new Hashtable();
	public MessageParser(String msg)
	{
		parseMessage(msg);
	}
	void parseMessage(String message)
	{
		try
		{
			int note_attr_start = message.indexOf("<note");
			int note_attr_end = message.indexOf('>', note_attr_start);
			String note_attr = message.substring(note_attr_start+(new String("<note")).length(), note_attr_end);
			int date_str_start = note_attr.indexOf("date=\"");
			int date_str_end = note_attr.indexOf('"', date_str_start+(new String("date=\"")).length());
			String date_str = note_attr.substring(date_str_start+(new String("date=\"")).length(), date_str_end);
			String from_str = message.substring(message.indexOf("<from>")+(new String("<from>")).length() , message.indexOf("</from>"));
			String to_str = message.substring(message.indexOf("<to>")+(new String("<to>")).length() , message.indexOf("</to>"));
			String subject_str = message.substring(message.indexOf("<head>")+(new String("<head>")).length() , message.indexOf("</head>"));
			String msg_str = message.substring(message.indexOf("<body>")+(new String("<body>")).length() , message.indexOf("</body>"));
			table.put("from", from_str);
			table.put("subject", subject_str);
			table.put("date", date_str);
			table.put("message", msg_str);
		}catch(Exception e)
		{
			System.out.println("Parse Message Error!");
			System.out.println(e);
		}
	}
	public String get(String name)
	{
		return (String)table.get(name);
	}
}
