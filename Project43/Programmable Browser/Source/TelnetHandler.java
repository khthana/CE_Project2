import java.net.*;
import java.io.*;

public class TelnetHandler extends Thread
{
	private Socket incoming;
	private int counter;
	
	int x;
	int state = 0;
	
	PrintStream out;
	InputStream in;

	String str;	
	String script = "";

	public TelnetHandler(Socket i,int c){
		incoming = i;counter = c;
	}//end TelnetHandler1

	public void run(){
		try {
			in	= incoming.getInputStream();				
		}
		catch (IOException ioe_in)
		{ System.out.println( "Cann't get InputStream!" ); }
		try {
			out = new PrintStream(incoming.getOutputStream());				
		}
		catch (IOException ioe_out)	{ 
			System.out.println( "Cann't get OutputStream!" );
			out.println( "Cann't get OutputStream!" );					
		}			
		
		out.print("\n\r***** W E L C O M E  T O  P R O G R A M M A B L E  B R O W S E R *****\n\r\n\nlogin : ");
		boolean pass1 = false;
		str = getText();//-----+++++
		while ( !pass1 )
		{
		
				switch (state)
				{
					case 0 : if ( str.equals("exit") ) 
							 { 
								pass1 = true;
								break;
							 }
							 else if ( str.equals("browser") )
							 { 
								 state = 1; 
								 out.print (/*str+*/"\r\nPassword : ");
								 str = getPassword();
							 }else{
								 out.print (/*str+*/"\n\r Incorrect Login name,try again.\n\rlogin : ");
								 str = getText();//-----+++++
							 }
							 break;

					case 1 : if ( str.equals("exit") )
							 { 
								pass1 = true;
								break; 
							 }
							 else if ( str.equals("agent") )
							 { 
								 state = 2; 
								 out.print ("\n\r Login completed\n\rAgent>");
								 str = getText();//-----+++++
							 }else{
								 out.print ("\n\rIncorrect Password ,try again.\n\rPassword : ");
								 str = getPassword();//-----+++++
							 }
							 break;

					case 2 : if ( str.equals("exit") )
							 { 
								pass1 = true;
								break; 
							 }
							 else if ( str.equals("runscript") )
							 { 
								state = 3; 
								out.print("\n\rFile : ");	
								str = getText();//-----+++++
							 }
							 else if ( str.equals("editscript") )
							 {
								 state = 4;
								 out.print("\n\rscript >>");
								 str = getText();//-----+++++
							 }
							 else {
								out.print(/*str+*/" \r\nAgent>");							 
								str = getText();//-----+++++
							 }
							 break;

					case 3 : if ( str.equals("exit") )
							 { 
								pass1 = true;
								break; 
							 }
							 else {
								String path = str;
								out.print("\r\nAgent>");
								System.out.println(" File : "+path);
								state = 2;
								
								try
								{
									FileInputStream fin = new FileInputStream (path);									
									BufferedReader in = new BufferedReader ( new InputStreamReader (fin) );
									boolean more = true;
								
									while (more)
									{
										try
										{
											String line = in.readLine();
											if (line == null)
											{ more = false; }
											else {
												System.out.println(line + "\n");
												script = script+line;
											}//end else	
										}//end try
										catch (IOException ioe_read)
										{ System.out.println( "IOException occurs at \"readLine();\"" ); }
										

									}//end while								
								
									Run run = new Run(script);
							
								}//end try
								catch (FileNotFoundException fnfe)
								{ 
									System.out.println( "File \""+path+"\" not found" );
									out.print( "File \""+path+"\" not found \r\nAgent>" );
								}
							str = getText();//-----+++++
							 break;
							 }

					case 4 : if ( str.equals("exit") )
							 { 
								pass1 = true;
								break; 
							 }
							 else 
							 {
								 script = str;
								 Run run = new Run(script);
								 state = 2;
								 out.print(/*str+*/" \r\nAgent>");	
								 str = getText();//-----+++++
							 }
							 break;

				}//end switch
			}//end while
		try
		{
			in.close();						
		}
		catch (IOException ioe_closeIn)
		{ 
			System.out.println( "IOException occurs at \"in.close()\"" );
			out.println( "IOException occurs at \"in.close()\"" );
		}
		out.close();	

	}//end run

	public String getText(){
		String text = "";
		boolean flag = true;
		try
		{
			while ( ( ( x = in.read( ) ) > -1 )&&( flag ) )
			{					
				if ( ( x == 13 ) || ( x == 10 ) )
				{ 
					flag = false;				
				}else{
					text = text + (char)x;
					out.write( x );
				}
			}//end while
		}
		catch (IOException iox)
		{	}
		return text;
	}//end getText
		public String getPassword(){
		String text1 = "";
		boolean flag1 = true;
		try
		{
			while ( ( ( x = in.read( ) ) > -1 )&&( flag1 ) )
			{					
				if ( ( x == 13 ) || ( x == 10 ) )
				{ 
					flag1 = false;				
				}else{
					text1 = text1 + (char)x;
					out.write( 42 );
				}
			}//end while
		}
		catch (IOException iox)
		{	}
		return text1;
	}//end Password

} //end TelnetHandler1
