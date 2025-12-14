import java.sql.*;
import java.io.*;
import java.io.IOException.*;
import java.util.*;
import java.text.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.System;
import java.net.Socket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.io.DataInputStream;
import java.io.DataOutputStream;

public class MainMail1 extends HttpServlet
{
		static String HostName;
		static String UserName;
		static String Password;
		static int MailCount,NewMailCount;

		static String[] InboxList = new String[201];
		static String[] NewMailList = new String[50];

		public static String SessionMailCountString;
		public static String SessionCurrentDeckString;
		public static String SessionDeckCountString;
		public static String SessionLastDeckCardString;
   	    CardWriter2 WriteCard = new CardWriter2();			
      	
		public void init ( ServletConfig config )
                throws ServletException
        {

        }

		public void doPost( HttpServletRequest req,
                            HttpServletResponse res )
                throws ServletException,IOException
    {
				HttpSession session = req.getSession(true);					
                ServletOutputStream out = res.getOutputStream();
                res.setContentType("text/vnd.wap.wml");
				System.out.println("MainMail1 is called...");
                String DoWhat = req.getParameter("DoWhat");
				System.out.println("DoWhat = "+DoWhat);
		
		if (DoWhat.equals("writeMainMail"))
		{
//			System.out.println("writeMainMail is called...");
			WriteCard.writeMainMail(out);
		}
		else if (DoWhat.equals("writeFolder"))
		{
			WriteCard.writeFolder(out,UserName);
		}
		else if (DoWhat.equals("GetMail1"))
	{

	System.out.println("GetMail1 is called.");
	UserName = req.getParameter("UserName");
	Password = req.getParameter("Password");
	HostName = req.getParameter("HostName");
	String NewHostName = req.getParameter("NewHostName");	
	if (NewHostName.length() > 0)
	{
		System.out.println("Hostname is replaced...");
		HostName = NewHostName;
	}
	System.out.println("HostName = "+HostName);
	try
  {
	MailConnection MailConnector = new MailConnection(UserName,Password,HostName);
	String Temp = MailConnector.doCommand("quit");	
	MailConnector.doCommand("quit");	
  }
    catch (Exception Err)
  {
	System.out.println("Error = "+Err);
	WriteCard.WriteErrorLogin(out);
  }
	MailConnection MailConnector = new MailConnection(UserName,Password,HostName);
	String MailTemp = MailConnector.doCommand("stat");
	System.out.println("MailTemp = "+MailTemp);
	System.out.println("IndexOf = "+MailTemp.indexOf("-ERR"));
	if ( (MailTemp.indexOf("-ERR") >= 0)|| MailTemp.indexOf("- ERR") >= 0)
	{
		System.out.println("Found Login Error");
		WriteCard.WriteErrorLogin(out);
	}
	else
  {
	System.out.println("Login Ok..");
	MailCount = MailConnector.CountMail(MailTemp);
	System.out.println("MailCount = "+MailCount);

		for (int i = 1;i<=200 ;i++ )
		{
			InboxList[i] = "";
		}
		GetMailList(MailCount,MailConnector);	
		MailConnector.doCommand("quit");
		System.out.println("MailCount = "+MailCount+" ,NewMailCount = "+NewMailCount);
		WriteCard.writeFolder(out,UserName);
  }
	}	// End of GetMail1
	
			else if (DoWhat.equals("doInboxList"))
	{
			System.out.println("CheckMail1 is called...,Calling PrepareList1");
			PrepareList1(MailCount,session);
			session.putValue("SessionCurrentDeckString","1");
			System.out.println("Calling PrepareList2");
			String CurrentDeckString = req.getParameter("CurrentDeck");
			Integer CurrentDeckInteger = Integer.decode(CurrentDeckString);
			int CurrentDeck = CurrentDeckInteger.intValue();

			try
			{
				PrepareList2(out,InboxList,session,CurrentDeck,MailCount);						
			}
			catch (Exception Err)
			{
				System.out.println("Error = "+Err);
			}
		}			// End of DoWhat == CheckMail1

		else if (DoWhat.equals("CheckMail2"))
		{
			System.out.println("CheckMail2 is called");
			String CurrentDeckString = req.getParameter("CurrentDeck");
			Integer CurrentDeckInteger = Integer.decode(CurrentDeckString);
			int CurrentDeck = CurrentDeckInteger.intValue();
			System.out.println("Get CurrentDeck = "+CurrentDeck);

			try
			{
				PrepareList2(out,InboxList,session,CurrentDeck,MailCount);						
			}
			catch (Exception Err)
			{
				System.out.println("Error = "+Err);
			}
		}			// End of if DoWhat == CheckMail2

		else if (DoWhat.equals("CheckNewMail"))
		{
		if (NewMailCount == 0)
		{
			WriteCard.NoNewMail(out);
		}
		 else
		 {
			try
		  {
			ForNewMail(out,NewMailList,1);
		  }
  			catch (Exception Err)
		  {
			System.out.println("Error = "+Err);
		  }
		 }
		}			
		else if (DoWhat.equals("CheckNewMail2"))
		{
			if (NewMailCount == 0)
		 {
		 	WriteCard.NoNewMail(out);
	  	 }
			else	
		 {
		    String DeckTemp = req.getParameter("CurrentDeck");
			Integer IntegerTemp = Integer.decode(DeckTemp);
			int CurrentDeck = IntegerTemp.intValue();
			try
 		  {
			ForNewMail(out,NewMailList,CurrentDeck);
		  }
  			catch (Exception Err)
		  {
		 	System.out.println("Error = "+Err);
		  }
		 }
		}			
	
	}  //----------------- End of doPost --------------------------
	// -------------------------------------------------------------
		public void PrepareList1(int MailCount,HttpSession session)
	{
		int DeckCount = MailCount/5;
		if ((MailCount/5) < 1)
		{
			DeckCount = 1;
		}
		else if ((MailCount % 5)==0)
		{ }
		else if ((MailCount % 5) > 0)
		{
			DeckCount++;
		}
		int LastDeckCard = (MailCount % 5);
		String Temp ="";
		Temp += MailCount;
		session.putValue("SessionMailCountString",Temp);

		Temp ="";
		Temp += DeckCount;
		session.putValue("SessionDeckCountString",Temp);

		Temp = "";
	    Temp += LastDeckCard;
		session.putValue("SessionLastDeckCardString",Temp);
	}

		public void PrepareList2(ServletOutputStream out,String[] InboxList,HttpSession session,int CurrentDeck,int MailCount)
			throws Exception
	{
//		System.out.println("In PrepareList2");
		System.out.println("MailCount = "+MailCount);

		int DeckCount = MailCount/5;
		if ((MailCount/5) < 1)
		{
			DeckCount = 1;
		}
		else if ((MailCount % 5)==0)
		{ }
		else if ((MailCount % 5) > 0)
		{
			DeckCount++;
		}
		int LastDeckCard = (MailCount % 5);

		System.out.println("MailCount = "+MailCount);		
		System.out.println("LastDeckCard = "+LastDeckCard);
		System.out.println("DeckCount = "+DeckCount);
		System.out.println("CurrentDeck = "+CurrentDeck);

		int i = (5*(CurrentDeck-1)+1);
		int i2 = i+5;	// for CurrentCount < DeckCount (1,2)

		WriteCard.writeHeader(out);
		out.println("<wml> ");
		out.println("<card id = \"MainCard\" title = \"InboxList\" >");
		
		if (DeckCount > 1)
		{
			WriteCard.writeGoto(DeckCount,MailCount,out,CurrentDeck);

			out.println("<do type = \"prev\" label = \"Goto!!\">");
            out.println("   <go href = \"/servlet/MainMail1\"");
            out.println("       method = \"post\" >");
            out.println("       <postfield name = \"DoWhat\"   value = \"CheckMail2\" /> ");
			out.println("		<postfield name = \"CurrentDeck\" value = \"$GotoCard\" />");
			out.println("   </go>");
            out.println("</do>");
			out.println("</p>");
			out.println("</card>");
		}
		else if (DeckCount == 1)
		{
		  out.println("<p>");
		  for (int i3 = 1; i3 <= MailCount ; i3++)
		    {	
			  out.println("<a href = \"#Message"+i3+"\">"+"Message"+i3+" </a> <br/>");
			}	// End of for
  	    out.println("</p>");
		out.println("<do type = \"option\" label = \"FolderList\">");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
		out.println("		<postfield name = \"DataLink\" value = \"$Item\" /> ");
		out.println("		<postfield name = \"DoWhat\" value = \"writeFolder\" /> ");
		out.println("   </go>");
		out.println("</do>");
		out.println("</card>");
		}
//------------- Finish Prepare for Header 
//------------- Now will write InboxList

		if (CurrentDeck < DeckCount)
		{
			System.out.println("CurrentDeck < DeckCount,i="+i+",i2="+i2);
			for ( i=i ; i < i2 ; i++)
			{
				WriteCard.writeInboxList(InboxList[i],out,i,(i2-1),1,"Inbox");
			}
		}	
		else if (CurrentDeck == DeckCount)
		{
			System.out.println("CurrentDeck == DeckCount,LastDeckCard = "+LastDeckCard);
			System.out.println("MailCount = "+MailCount);
			int LastTemp = i+LastDeckCard;
			for ( i=i ; i <= MailCount; i++)
			{
				WriteCard.writeInboxList(InboxList[i],out,i,MailCount,0,"Inbox");
			}
		}
		out.println("</wml>");

	}		// End of PrepareList2

				public void GetMailList(int MailCount,MailConnection MailConnector)
{
	String Answer = "";
	NewMailCount = 0;
	int ICount = 1;
	try
	{
		for (ICount = 1; ICount <= MailCount; ICount++)
		{
			int MailSize = MailConnector.CheckSize(ICount);
			if (MailSize > 2500)
			{
				InboxList[ICount] = "Error";
				System.out.println("Mail over Size!!");
			}
			else 
			{
				String Command = "retr "+ICount;
//				System.out.println("Getting Mail Number :"+ICount);
				Answer = MailConnector.GetMail(Command,MailSize);
				if ( MailConnector.IsNewMail(Answer) == 1 )
				{
					NewMailCount++;
					System.out.println("Found New Mail Number = "+ICount);
					NewMailList[NewMailCount] = MailConnector.ParseAnswer(Answer);
					System.out.println("NewMailCount = "+NewMailCount);
				
				}
//				System.out.println("Get Message "+ICount+" OK.");
				InboxList[ICount] = MailConnector.ParseAnswer(Answer);
			}
		}
		System.out.println("GetMail OK!!");
	}
	catch (Exception ex)
    {
		System.out.println(ex);
	}
}		// End of GetMailList[]

//--------------- For New Mail -------------------

		public void ForNewMail(ServletOutputStream out,String[] InboxList,int CurrentDeck)
			throws Exception
	{
		System.out.println("NewMailCount = "+NewMailCount);
		int DeckCount = NewMailCount/5;
		if ((NewMailCount/5) < 1)
		{
			DeckCount = 1;
		}
		else if ((NewMailCount % 5)==0)
		{ }
		else if ((NewMailCount % 5) > 0)
		{
			DeckCount++;
		}
		int LastDeckCard = (NewMailCount % 5);

		System.out.println("MailCount = "+NewMailCount);		
		System.out.println("LastDeckCard = "+LastDeckCard);
		System.out.println("DeckCount = "+DeckCount);
		System.out.println("CurrentDeck = "+CurrentDeck);

		int i = (5*(CurrentDeck-1)+1);
		int i2 = i+5;	// for CurrentCount < DeckCount (1,2)

		WriteCard.writeHeader(out);
		out.println("<wml> ");
		out.println("<card id = \"NewMailCard\" title = \"NewMail\" >");
		
		if (DeckCount > 1)
		{
			WriteCard.writeGoto(DeckCount,NewMailCount,out,CurrentDeck);

			out.println("<do type = \"prev\" label = \"Goto!!\">");
            out.println("   <go href = \"/servlet/MainMail1\"");
            out.println("       method = \"post\" >");
            out.println("       <postfield name = \"DoWhat\"   value = \"CheckNewMail2\" /> ");
			out.println("		<postfield name = \"CurrentDeck\" value = \"$GotoCard\" />");
			out.println("   </go>");
            out.println("</do>");
			out.println("</p>");
			out.println("</card>");
		}
		else if (DeckCount == 1)
		{
		  out.println("<p>");
		  for (int i3 = 1; i3 <= NewMailCount ; i3++)
		    {	
			  out.println("<a href = \"#Message"+i3+"\">"+"Message"+i3+" </a> <br/>");
			}	// End of for
  	    out.println("</p>");
		out.println("<do type = \"option\" label = \"ToMain\">");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
		out.println("		<postfield name = \"DataLink\" value = \"$Item\" /> ");
		out.println("		<postfield name = \"DoWhat\" value = \"writeFolder\" /> ");
		out.println("   </go>");
		out.println("</do>");
		out.println("</card>");
		}
//------------- Finish Prepare for Header 
//------------- Now will write InboxList

		if (CurrentDeck < DeckCount)
		{
			System.out.println("CurrentDeck < DeckCount,i="+i+",i2="+i2);
			for ( i=i ; i < i2 ; i++)
			{
				WriteCard.writeInboxList(InboxList[i],out,i,(i2-1),1,"NewMail");
			}
		}	
		else if (CurrentDeck == DeckCount)
		{
			System.out.println("CurrentDeck == DeckCount,LastDeckCard = "+LastDeckCard);
			System.out.println("NewMailCount = "+NewMailCount);
			int LastTemp = i+LastDeckCard;
			for ( i=i ; i <= NewMailCount; i++)
			{
				System.out.println("Doing MailNumber = "+i);
				WriteCard.writeInboxList(NewMailList[i],out,i,NewMailCount,0,"NewMail");
				System.out.println("MailNubmer "+i+" Done...");
			}
		}
		out.println("</wml>");

	}		// ForNewMail

}					// End of Class

