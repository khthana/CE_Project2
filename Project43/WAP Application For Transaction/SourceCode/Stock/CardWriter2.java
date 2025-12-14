import java.io.*;
import java.io.IOException.*;
import java.util.*;
import java.text.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.System;
import java.net.UnknownHostException;
import java.io.DataInputStream;
import java.io.DataOutputStream;

public class CardWriter2
{
		public void writeInboxList(String InputMessage,ServletOutputStream out,int i,int LastCard,int HasAnother,String InboxOrNew)
			throws Exception
	{
		String StringTemp = "";
//		System.out.println("InputMessage "+i);// = \r\n"+InputMessage);

		int Start,Stop;
		if (InputMessage.indexOf("Error")==0)
		{
		  System.out.println("Message"+i+" is too big.");
		  out.println("<card id = \"Message"+i+"\" title = \"Error\" > <p>");
		  out.println("<a href = \"#MainCard\"> Back to Main </a> <br/>");
		  out.println("Message Number "+i+" can't be read in this phone... Please use your mail browser in your PC!!");
		}
		else
	{
//		System.out.println("Now writing Message for this mail");
		Start = 8;		// Start of Subject:
		Stop = InputMessage.indexOf("From:");
		Stop = Stop -2;
		StringTemp = InputMessage.substring(Start,Stop);
		out.println("");
		out.println("<card id = \"Message"+i+"\" title = \""+StringTemp+"\" > <p>");
		out.println("<a href = \"#MainCard\"> Back to Main </a> <br/>");

		Start = Stop+7;	// Start of From:
		Stop = InputMessage.indexOf("Message :");
		Stop = Stop - 2;
		StringTemp = InputMessage.substring(Start,Stop);
//		System.out.println("Get From = "+StringTemp);

		out.println("From:"+StringTemp + "<br/>");
//		System.out.println("Getting Message");
		Start = Stop+13;		// Strt = Start of Message:
//		System.out.println("Start = "+InputMessage.charAt(Start));
		Stop = InputMessage.indexOf(";;;");
		Stop = Stop - 3;
//		System.out.println("Stop Position="+Stop+"Stop="+InputMessage.charAt(Stop));
		StringTemp = InputMessage.substring(Start,Stop);
//		System.out.println("can get message");
		out.println(StringTemp + "<br/>");
		// --------------------------------------------
	}		// End of Else that test for Too Big Message...

//		System.out.println("Test for TooBig Ok..");
		if (i == LastCard)
		{
			if (HasAnother == 1)
			{
				int NextDeck = i/5;
				NextDeck++;
				out.println("<do type = \"prev\" label = \"Next!!\">");
		        out.println("   <go href = \"/servlet/MainMail1\"");
			    out.println("       method = \"post\" >");
				if (InboxOrNew.equals("Inbox"))
			{
				out.println("       <postfield name = \"DoWhat\"   value = \"CheckMail2\" /> ");
			}
				else
			{
				out.println("       <postfield name = \"DoWhat\"   value = \"CheckNewMail2\" /> ");
			}
				out.println("		<postfield name = \"CurrentDeck\" value = \""+NextDeck+"\" />");
				out.println("   </go>");
			    out.println("</do>");

			}
			// Have to program it to go to Next Five!!
		}
		else if ( i < LastCard )
		{
			out.println("<do type = \"prev\" label = \"Next\">");
			out.println("	<go href = \"#Message"+(i+1)+"\" >");
			out.println("	</go>");
			out.println("</do>");
		}

		if ( (i%5)==1 )
		{
			// Have to set to prev
		}
		else if ( (i%5)>1 )
		{
			out.println("<do type = \"unknown\" label = \"Prev\">");
			out.println("	<go href = \"#Message"+(i-1)+"\" >");
			out.println("	</go>");
			out.println("</do>");
		}
		else if ( (i%5) == 0)
		{
			out.println("<do type = \"option1\" label = \"Prev\">");
			out.println("	<go href = \"#Message"+(i-1)+"\" >");
			out.println("	</go>");
			out.println("</do>");			
		}
		out.println("</p> </card>");

	}		// End of writeInboxList

// --------------- End of writeInboxList -----------------------------------
		public void writeGoto(int DeckCount,int MailCount,ServletOutputStream out,int CurrentDeck)
				throws Exception
	{
		out.println("<p>Goto :");
		out.println("<select name = \"GotoCard\" >");

		for ( int i = 1 ; i < DeckCount ; i++)
		{
			out.println("	<option value = \""+i+"\">" +
							((i-1)*5+1)+"-"+((i-1)*5+5)+"</option>");
		}
		if (((DeckCount-1) * 5+1) == MailCount)
		{
			out.println("	<option value = \""+DeckCount+"\" > "
					+((DeckCount-1) * 5+1)+" </option>");
		}
		else
		{
		out.println("	<option value = \""+DeckCount+"\" > "
					+(((DeckCount-1) * 5)+1)+"-"+ MailCount+" </option>");
		}
		out.println("</select>");

		if (CurrentDeck == DeckCount)
		{
		  int TempI1 = MailCount%5;
		  for (int i = 1; i <= TempI1 ; i++)
		    {	
			  int Temp2 = (CurrentDeck-1)*5 +i;
			  out.println("<a href = \"#Message"+Temp2+"\">"+"Message"+Temp2+" </a> <br/>");
			}	// End of for
		}
		else
		{
		  for (int i = 1; i <=5 ; i++)
		    {	
			  int tempI = (CurrentDeck-1)*5 +i;
			  out.println("<a href = \"#Message"+tempI+"\">"+"Message"+tempI+" </a> <br/>");
			}	// End of for
		}
		out.println("<do type = \"option\" label = \"FoderList\">");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
//		out.println("		<postfield name = \"DataLink\" value = \"$Item\" /> ");
		out.println("		<postfield name = \"DoWhat\" value = \"writeFolder\" /> ");
		out.println("   </go>");
		out.println("</do>");

	}			// End of writeGoto
		// -------------------------------------------------------------
		
		public void writeMainMail(ServletOutputStream out) throws IOException
		{
			System.out.println("writeMainMail is called.");
			writeHeader(out);
			out.println("<wml> <card id = \"MainMail\" title = \"Welcome!!!\" newcontext = \"true\"> <p>");
			out.println("User Name :");
			out.println("<input name = \"UserName\" maxlength = \"20\" emptyok=\"false\" /> <br/> ");
			out.println(" Password :");
			out.println("<input name = \"Password\" maxlength = \"20\" type = \"password\" emptyok=\"false\" />");
			out.println("<br/>");
			out.println("<select name = \"HostName\" >");
			out.println("  <option value = \"161.246.10.21\" > Chaokhun (KMITL) </option>");
			out.println("  <option value = \"161.246.4.3\" > Diamond (KMITL) </option>");
			out.println("  <option value = \"mail.thairakthai.or.th\" > ThaiRakThai Mail </option>");
			out.println("  <option value = \"pop.mail.yahoo.com\" > Yahoo Mail </option> ");
			out.println("  <option value = \"operamail.com\" > Opera Mail </option> ");
			out.println("</select>");
			out.println("New Host Name:");
			out.println("<input name = \"NewHostName\" maxlength = \"30\" emptyok=\"true\" /> <br/> ");
			
			out.println("<do type = \"accept\" label = \"Go!!\">");
            out.println("   <go href = \"/servlet/MainMail1\"");
            out.println("       method = \"post\" >");
            out.println("       <postfield name = \"UserName\" value = \"$UserName\" /> ");
            out.println("       <postfield name = \"DoWhat\"   value = \"GetMail1\" /> ");
			out.println("		<postfield name = \"Password\" value = \"$Password\" /> ");
			out.println("		<postfield name = \"HostName\" value = \"$HostName\" /> ");
			out.println("		<postfield name = \"NewHostName\" value = \"$NewHostName\"/>");
			out.println("		<postfield name = \"CurrentDeck\" value = \"1\" />");
			out.println("		<postfield name = \"Clear\" value = \"Yes\" />");
			out.println("   </go>");
            out.println("</do>");
			out.println("</p> </card> </wml> ");
		}


		public void writeHeader(ServletOutputStream out) throws IOException
        {
             out.println("<?xml version=\"1.0\"?>");
             out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"");
             out.println("\"http://www.wapforum.org/DTD/DTD/wml_1.1.xml\">");
        }		//	  End of writHeader method...

		// -------------------------------------------------------------
		public void writeFolder(ServletOutputStream out,String UserName) throws IOException
	{
		System.out.println("writeFolder is called.");
		writeHeader(out);
		out.println("<wml> <card id = \"Folder\" title = \""+UserName+"\" > <p>");
		out.println("<b>Folder List </b> <br/> Please select Options for InboxList or NewMail");

		out.println("<do type = \"option1\" label = \"NewMail\">");
        out.println("   <go href = \"/servlet/MainMail1\"");
	    out.println("       method = \"post\" >");
		out.println("       <postfield name = \"DoWhat\"   value = \"CheckNewMail\" /> ");
		out.println("   </go>");
	    out.println("</do>");
		out.println("<do type = \"next\" label = \"Inbox\">");
        out.println("   <go href = \"/servlet/MainMail1\"");		
	    out.println("       method = \"post\" >");
		out.println("       <postfield name = \"DoWhat\"   value = \"doInboxList\" /> ");
		out.println("		<postfield name = \"CurrentDeck\" value = \"1\" />");
//		out.println("		<postfield name = \"Clear\" value = \"Yes\" />");
		out.println("	</go> ");
		out.println("</do>");

		out.println("<do type = \"prev\" label = \"New Login\">");
        out.println("   <go href = \"/servlet/MainMail1\"");		
	    out.println("       method = \"post\" >");
		out.println("       <postfield name = \"DoWhat\"   value = \"writeMainMail\" /> ");
//		out.println("		<postfield name = \"Clear\" value = \"Yes\" />");
		out.println("	</go> ");
		out.println("</do>");

		out.println("</p> </card> </wml> ");
	}	// ---------
		public void NoNewMail(ServletOutputStream out) throws IOException
	{
		System.out.println("NoNewMail is called.");
		writeHeader(out);
		out.println("<wml> ");
		out.println("<card id = \"NoNewMail\" title =\"No NewMail!\" > ");

		out.println("<onevent type = \"ontimer\" > ");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
		out.println("		<postfield name = \"DoWhat\" value = \"writeFolder\" /> ");
		out.println("   </go>");
		out.println("</onevent>");
		out.println("<timer value = \"40\" />");

		out.println("<p> No New Mail!!!! </p> ");
		out.println("<do type = \"prev\" label = \"FolderList\">");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
		out.println("		<postfield name = \"DoWhat\" value = \"writeFolder\" /> ");
		out.println("   </go>");
		out.println("</do>");
		out.println("</card> </wml> ");
	}	// --------- End of NoNewMail --------------------

		public void WriteErrorLogin(ServletOutputStream out) throws IOException
	{
		System.out.println("NoNewMail is called.");
		writeHeader(out);
		out.println("<wml> ");
		out.println("<card id = \"ErrorLogin\" title = \"Error Login\" >");
		out.println("<onevent type = \"ontimer\" > ");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
		out.println("		<postfield name = \"DoWhat\" value = \"writeMainMail\" /> ");
		out.println("   </go>");
		out.println("</onevent>");
		out.println("<timer value = \"40\" />");

		out.println("<p> Error Login </p>");
		out.println("<do type = \"prev\" label = \"ToMain\">");
		out.println("	<go href = \"/servlet/MainMail1\"");
		out.println("  		method = \"post\" >");
		out.println("		<postfield name = \"DoWhat\" value = \"writeMainMail\" /> ");
		out.println("   </go>");
		out.println("</do>");
		out.println("</card> </wml> ");
	}	// End of WriteErrorLogin

}					// End of CardWriter Class

