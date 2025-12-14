import java.lang.System;
import java.net.Socket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

class MailConnection
{
    public static Socket connection;
    public static DataOutputStream outStream;
    public static DataInputStream inStream;
	String ServerResponse="";
	int port = 110;
//    String MailServer = "161.246.4.3";
	String MailServer = "";
      public MailConnection(String UserName,String Password,String MailServer)
     {
        int inByte;
		System.out.println("MailConnection is called!!!");
		try
        {
           connection = new Socket(MailServer,port);
		   System.out.println("Connection Success...");
        }
        catch (UnknownHostException ex)
        {
                System.out.println("Unknown host");
        }
        catch (IOException ex)
        {
                System.out.println("IO error creating socket");
        }

        try
        {
           inStream = new DataInputStream(connection.getInputStream()); 
           outStream = new DataOutputStream(connection.getOutputStream()); 
        }
        catch (IOException ex)
        {
                System.out.println("IO error getting streams");
        }
		System.out.print("MailServer : ");

		try
        {
			   ServerResponse = inStream.readLine();		   
			   System.out.println(ServerResponse);
		}
        catch (Exception ex)
        {
           System.out.println(ex);
           System.out.println("Error while reading from server.");
        }
		doCommand("user "+UserName);
		doCommand("pass "+Password);
 }          // End of Constructor

	public static String doCommand(String InputCommand)
	{
		int inByte=0 ;
		char temp;
		String Answer="";

		System.out.println("User : "+InputCommand);
		try
		 {
				outStream.writeBytes(InputCommand+"\r\n"); 
                outStream.flush();
		 }
		catch (Exception ex)
		 {
			System.out.println("Error while sending Command to server :"+ex);
		 }

		try
		 {
		   System.out.print("MailServer : ");
		   Answer = inStream.readLine();	 
		   System.out.println(Answer); 
		 }
	    catch (Exception ex)
         {
           System.out.println(ex);
           System.out.println("Error while reading from server.");
         }
//		System.out.print("Return Answer = " + Answer);
		return(Answer);		
	 }			// End of doCommand method

	public static String GetMail(String InputCommand,int MailSize)
	{
		String Answer="" ;
		String Answer2 = "";
		System.out.println("GetMail User : "+InputCommand);
		try
		 {
				outStream.writeBytes(InputCommand+"\r\n"); 
                outStream.flush();
		 }
		catch (Exception ex)
		 {
			System.out.println("Error while sending Command to server :"+ex);
		 }
		int Flag1 = 1;

		try
		 {
		   System.out.print("MailServer : ");
		   while (Flag1 == 1)
		   {
				Answer = inStream.readLine();

				if (Answer.length()==1 && Answer.charAt(0)=='.')
		  {
		  	  Flag1 = 0;

		  }
	 	  else
 	      {
			  if ( (Answer.indexOf(".\r\n")) > 0 || (Answer.indexOf("\r\n.\r\n") > 0))
			  {
				  Flag1 = 0;
			      System.out.println("Found End of Message!!!2.");
				  continue;
			  }
		  }			// End of else

 		  Answer2 += Answer+"\r\n";
		   }		// End of while loop
		 }			// End of try block
	    catch (Exception ex)
         {
           System.out.println(ex);
           System.out.println("Error while reading from server.");
         }
		System.out.println("--------------------------------------------------------");
		Answer2=Answer2+";;;";
		return(Answer2);		
	}			// End of GetMail method.


	public static String ParseAnswer(String InputMail)
	{
		String OutputMail = "";
		OutputMail += GetSubject(InputMail)+"\r\n";
		OutputMail += GetFrom(InputMail)+"\r\n";
		OutputMail += GetMessage(InputMail);

		return(OutputMail);
	}			// End of ParseAnswer Method.

	public static String GetFrom(String InputMail)
	{
		String FromWho = "";
		int MailPointer;

		MailPointer = InputMail.indexOf("From:");
		if (MailPointer > 0)
	{
		for (int i = MailPointer ; InputMail.charAt(i)!= '\r' 
			 && InputMail.charAt(i+1) != '\n' ; i++ )
		{
			if (InputMail.charAt(i) == '<')
			{
				FromWho += '(';
			}
			else if (InputMail.charAt(i) == '>')
			{
				FromWho += ')';
			}
			else 
			{
				FromWho += InputMail.charAt(i);
			}
		}
	}
	else
	{
				FromWho = "From: ??";
	}
		return(FromWho);
	}

	public static String GetSubject(String InputMail)
	{
		String SubjectWhat = "";
		int MailPointer;
		MailPointer = InputMail.indexOf("Subject:");
		if (MailPointer > 0)
	{
		for (int i = MailPointer ; InputMail.charAt(i)!= '\r' 
			 && InputMail.charAt(i+1) != '\n' ; i++ )
		{
			SubjectWhat += InputMail.charAt(i);
		}
	}
		else
	{
			SubjectWhat = "Subject: ??";
	}
		return(SubjectWhat);
	}

	public static String GetMessage(String InputMail)
	{
		String MessageWhat = "";
		int MailPointer;
		int MailPointer2 = 0;

		MailPointer = InputMail.indexOf("Status:");
		for (int i = MailPointer ; InputMail.charAt(i)!= '\r' 
			 && InputMail.charAt(i+1) != '\n' ; i++ )
		{
			MailPointer++;
		}
		MailPointer = MailPointer + 3;
		MessageWhat = "Message : ";

		for (int i = MailPointer ; InputMail.charAt(i) != ';'
			 && InputMail.charAt(i+1) != ';' && InputMail.charAt(i+2) != ';' ; i++)
		{
//			MessageWhat += InputMail.charAt(i);
			if (InputMail.charAt(i) == '<')
			{
				MessageWhat += '(';
			}
			else if (InputMail.charAt(i) == '>')
			{
				MessageWhat += ')';
			}
			else if (InputMail.charAt(i) == '&')
			{
				MessageWhat += " 'n ";
			}

			else 
			{
				MessageWhat += InputMail.charAt(i);
			}

		}
		MessageWhat += ";;;";
		return(MessageWhat);
	}

	public static int CountMail(String InputAnswer)
	{
		InputAnswer = InputAnswer.substring(4,InputAnswer.length());
		InputAnswer = InputAnswer.substring(0,(InputAnswer.indexOf(" ")));
		Integer TempCount1 = Integer.decode(InputAnswer);
		int MailCount = TempCount1.intValue();
		return(MailCount);
	}
	
	static int CheckSize(int MailNumber) throws Exception
	{
		System.out.println("Checking Mail Number:"+MailNumber);
		int temp1 = 0;
		String InputAnswer = doCommand("list "+MailNumber);
		InputAnswer = InputAnswer.substring(4,InputAnswer.length());
		temp1 = InputAnswer.indexOf(" ");
		temp1++;
		InputAnswer = InputAnswer.substring(temp1,InputAnswer.length());
		System.out.println(InputAnswer);
		Integer TempCount1 = Integer.decode(InputAnswer);
		int Size = TempCount1.intValue();
//		System.out.println("size = "+Size);
		return(Size);
	}			// End of ...

	public static int IsNewMail(String InputMail) throws Exception
	{
		int Answer = 0;
		int Pointer = InputMail.indexOf("Status:");
		Pointer = Pointer + 8;
//		System.out.println("Checking for new Mail");
		if (InputMail.charAt(Pointer)==' ')
		{
			Answer = 1;
			System.out.println("Found New Mail!!!");
		}
		else 
		{
			Answer = 0;
		}
		return(Answer);
	}

}               // End of GetConnection Class

