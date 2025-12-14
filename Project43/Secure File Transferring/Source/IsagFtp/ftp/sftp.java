package IsagFtp.ftp;

import java.io.*;
import java.util.*;

public class sftp
{

     private String Username = null;
	 private String Password = null;
	 private String localDirectory = null;
	 private String remoteDirectory = null;
	 private String localPath = null;
	 private String remotePath = null;
	 BufferedReader keyboardInput = null;
	 String Host = null;
	 FtpEngine f;
	 public static String prompt = "IsagFTP> ";
	
	
	public static void main(String[] args) 
	{       
	   if ( args.length == 0 || args.length > 2)
       {   
	       System.out.println("Usage : java sftp <host> [port].");
	       System.exit(0);
       }
	   
	   
	   try
       {
	     sftp sf = new sftp();
	     if ( args.length == 1)
		 {
		    sf.connect(args[0]);
			sf.Authentication();
		    sf.userCommand();
          }
	    else if (args.length ==2)
	    {
            sf.connect(args[0],Integer.parseInt(args[1]));
		    sf.Authentication();
		    sf.userCommand();
		}

        } catch (Exception ex) { System.out.println(ex.getMessage());}
	}
     
	 public void connect(String host) throws IOException
	 {   Host = host;
	     f = new FtpEngine(Host);
	 }

	 public void connect(String host,int port )  throws IOException
	 {   Host = host;
	     f = new FtpEngine(Host,port);
	}
	 	 
	 public void Authentication() throws IOException
	{ 

  /*    System.out.print(f.getResponseString());
      System.out.print("User name : ");	  
      Username = keyboardInput.readLine();
	  System.out.print("Password : ");
	  Password = keyboardInput.readLine();

      f.login(Username,Password);  */
	  f.login(Username,Password);
      System.out.print(f.getResponseString());


	}
    public void setUsername(String Username)
	{
	  this.Username = Username;
	}

	public void setPassword(String Password)
	{
	  this.Password = Password;
	}
	   
    public void userCommand() 
    {   
	    // set localDirectory for store file from downloading.
		localDirectory = System.getProperty("user.dir");
 
		keyboardInput = new BufferedReader(new InputStreamReader(System.in));	 
		f.setPassive(true);
		while (true)
		{  
		   System.out.print(prompt);         		   
		 try{	
		   StringTokenizer cmd = new StringTokenizer(keyboardInput.readLine());
		   if ( cmd.hasMoreTokens() )		   		   
			{ 
			  String commander = cmd.nextToken();
			  if ( commander.equalsIgnoreCase("ASCII") )
			    {  f.ascii(); 
			       System.out.println(f.command);
				   System.out.print(f.getResponseString());
			    }
			  else if ( commander.equalsIgnoreCase("BINARY") )
			    {  f.binary();
			       System.out.println(f.command);
				   System.out.print(f.getResponseString());
			    }
			  else if ( commander.equalsIgnoreCase("LS") )
			    { 
				  if ( cmd.hasMoreTokens() )
				   f.ls(cmd.nextToken());
			      else f.ls();
				}
			  else if ( commander.equalsIgnoreCase("GET") )
			    {  
				  if ( cmd.hasMoreTokens())
				  {
				    String myfile = cmd.nextToken();
			        File lf = new File(localDirectory,new File(myfile).getName() );
					long size = fileCheck(lf);
					if (size!=0)
                        { System.out.print("File Exist! ");
						   System.out.print("Do you want to continue? [R=resume;O=overwirte;C=cancel] ");
						   String choice = keyboardInput.readLine().toUpperCase();
                           if (choice.startsWith("R") )                           
				               f.Download(lf,myfile,size);		 
                           else if (choice.startsWith("O") )
                                f.Download(lf,myfile,0);
						}
					else f.Download(lf,myfile,0);
				  }
				  else System.out.println("Usage : Get <filename>.");
			    }
			  else if ( commander.equalsIgnoreCase("PUT") )
			    { 
				  if ( cmd.hasMoreTokens() )
				    {
                      File lp;
						String localFile = cmd.nextToken();
						if ( localFile.length() > 1 && localFile.charAt(1) == ':' )						   
						   lp = new File(localFile);
						else lp = new File(localDirectory,localFile);
						remotePath = lp.getName();	
					   try
					   {					   
						   f.size(remotePath);
						   String answer = f.getResponseString().substring(4).trim();							   
						   System.out.print("File Exist! ");
						   System.out.print("Do you want to continue? [R=resume;O=overwirte;C=cancel] ");
						   String choice = keyboardInput.readLine().toUpperCase();
                           if (choice.startsWith("R") )                           
				             {
		   					   long rePoint = Long.parseLong(answer);
							   f.Upload(lp,remotePath,rePoint);		 
							 }
                           else if (choice.startsWith("O") )
						    f.Upload(lp,remotePath,0);
						 }
						catch (IOException ex) 
						 {
							f.Upload(lp,remotePath,0);
						 }
					}
				  else System.out.println("Usage : Put <filename>.");
			    }
			  else if ( commander.equalsIgnoreCase("BYE") )
			    {
				    f.closeServer();
					System.out.println(f.command);
					System.out.print(f.getResponseString());
					System.exit(1);
			    }
			  else if ( commander.equalsIgnoreCase("DELETE") )
			    {  
				   if ( cmd.hasMoreTokens() )
			          {
					   f.delete(cmd.nextToken());
					   System.out.println(f.command);
					   System.out.print(f.getResponseString());
					  }
					else System.out.println("Usage : delete <filename>.");			    
			    }
			  else if ( commander.equalsIgnoreCase("CD") )
			    {  
				   if ( cmd.hasMoreTokens() )
				      {
					   f.cd(cmd.nextToken());
					   System.out.println(f.command);
					   System.out.print(f.getResponseString());
				      }
					else System.out.println("Usage : cd <directory>.");
			    }
			  else if ( commander.equalsIgnoreCase("PWD") )
			    {
			          f.pwd();
					  System.out.println(f.command);
					  System.out.print(f.getResponseString());
			    }
			  else if ( commander.equalsIgnoreCase("MKDIR") )
			    {
				   if ( cmd.hasMoreTokens() )
				     {
					   f.mkdir(cmd.nextToken());
					   System.out.println(f.command);
					   System.out.print(f.getResponseString());
				     }
					else System.out.println("Usage : mkdir <directory>.");
			    }
			  else if ( commander.equalsIgnoreCase("RMDIR") )
			    {
				   if ( cmd.hasMoreTokens() )
				     {
				      f.rmdir(cmd.nextToken());
					  System.out.println(f.command);
					  System.out.print(f.getResponseString());
				     }
				    else System.out.println("Usage : rmdir <directory>.");
			    }
			  else if ( commander.equalsIgnoreCase("LCD") )
			    {
				     if ( cmd.hasMoreTokens() )
				     {  String  namePath = cmd.nextToken();
					    if	  (namePath.equals("?") )						
						  System.out.println("Local directory now "+localDirectory);
				        else {												          
						      if ( !( namePath.charAt(1) ==':' ) )   
							    namePath = localDirectory+"\\"+namePath;
							    
								  File  localDir = new File(namePath);
							  if (localDir.exists() && localDir.isDirectory())
							        {  
									   localDirectory = localDir.getCanonicalPath();
							           System.out.println("Local directory now "+localDirectory);
								    }
							  else  System.out.println(localDir.getCanonicalPath()+" : Directory not found");	
							 }
							   
					 }  else  {  
					      localDirectory = System.getProperty("user.dir");
						  System.out.println("Local directory now "+localDirectory); 
					 }
				  
			    }
			  else if ( commander.equalsIgnoreCase("MGET") )
			  { 
			      if ( cmd.hasMoreTokens())
				    {
					  do
				       { 				        						
						String myPath = cmd.nextToken();
		                // Keep remote directory for future use.
			            f.pwd();
						String  reply =  f.getResponseString();
 					    remoteDirectory = reply.substring(reply.indexOf("/"),reply.lastIndexOf("\"")  );				
                        //  Compute absolute remotePath .					
						File test = new File(myPath);
						String last = test.getName();
					   if ( last.indexOf("*") != -1 )
						{
						     if  ( myPath.startsWith("/") )						     
							   remotePath = test.getParent().replace('\\','/');
						     else 
							  {  if	( test.getParent() == null ) remotePath = remoteDirectory;
							     else 
							     remotePath = remoteDirectory+"/"+test.getParent().replace('\\','/');
							   }
						}
						else
						{
						     if	 ( myPath.startsWith("/") )
						      remotePath = myPath;
						     else  
						      remotePath = remoteDirectory+"/"+myPath;
                        }
             //  Compute absolute localPath
			       File lp;
				   if ( last.indexOf("*") != -1 )
			         lp = new File(localDirectory);  
				   else
			         lp = new File(localDirectory,last);
			 //  go to get file.
                       try
					    { 
						  f.cd(remotePath);
						}
					  catch(IOException ex)
					   {
					      String rep = f.getResponseString();
				          if ( rep.startsWith("550") )  // check if file
                        { 
					      long size = fileCheck(lp);
					      if (size!=0)
                          { 
						      System.out.print("File Exist! ");
						      System.out.print("Do you want to continue? [R=resume;O=overwirte;C=cancel] ");
						      String choice = keyboardInput.readLine().toUpperCase();
                              if (choice.startsWith("R") )                           
				                f.Download(lp,myPath,size);		 
                              else if (choice.startsWith("O") )
                                f.Download(lp,myPath,0);
						  }
					      else f.Download(lp,myPath,0);	                       					   					   					   
					    }
					   }
				        
						  String rep = f.getResponseString();
						if ( rep.startsWith("250") )  // check if directory
				        {
					       recureGet(lp,remotePath,last);
                           f.cd(remoteDirectory);
						   f.getResponseString();						  
				        }
			        }while (cmd.hasMoreTokens());			
					}
				  else System.out.println("Usage : mget <filename>.");
			  }
			  else if ( commander.equalsIgnoreCase("MPUT") )
			    {
			       if ( cmd.hasMoreTokens() )
			       { 
				      do
					   { 					   					   					   
					   File lp;
					   String myPath = cmd.nextToken();
 					   // find and keep remote directory for future use
						f.pwd();						
						String rep = f.getResponseString();
						remoteDirectory = rep.substring(rep.indexOf("/"),rep.lastIndexOf("\"")  );
						//  find local path from arguement 
					   File test = new File(myPath);
                       String last = test.getName();
				   if ( last.indexOf("*") != -1 )
                       {					   					
					   if ( test.getParent() != null)
					   {					   					   
					   if ( myPath.length() > 1 && myPath.charAt(1) == ':')					    
						 lp = new File(test.getParent());
					   else 					    
					     lp = new File(localDirectory,test.getParent());
					   } else lp = new File(localDirectory);
					   }
				   else 
				       {
					   if ( myPath.length() > 1 && myPath.charAt(1) == ':')					    
						 lp = new File(myPath);
					   else 					    
					     lp = new File(localDirectory,myPath);
				        }				
						// find remote path too
						remotePath = last;

					 /*   check localPath : 3 case 
					  *      1. *
					  *      2. file
					  *      3. Directory
					  */				
						
						// Case 1
						 
					      if ( last.indexOf("*") != -1 )
						     {					
					    	  if (!recurePut(lp,remoteDirectory,last))
							   System.out.println("File not match."); 
							  }
					      else 
						   {  if	( lp.exists() && lp.isFile() )
						         f.Upload(lp,remotePath,0);
							  else if ( lp.exists() && lp.isDirectory() )
							  {  f.mkdir(remotePath); 
							     f.cd(remotePath);
								 recurePut(lp,remoteDirectory,"*");
								 f.cdup();
								 f.getResponseString();
							  }else System.out.println(lp.getName()+" : File not Found.");					           					  
                           }
				}
					  while (cmd.hasMoreTokens());					  					  
			       }
				   else System.out.println("Usage : mput <filename>.");
			    }
			  else if ( commander.equalsIgnoreCase("HASH") )
			    {
                    if (f.hash)
                    { 
					  f.hash = false;
					  System.out.println("Hash off");
					}
					else
					{  f.hash = true;
					   System.out.println("Hash On");
					}					
			    }
			  else if ( commander.equalsIgnoreCase("PASSIVE") )
			  {
			     f.setPassive(true);
				 System.out.println("Passive mode");
			  }
			  else if ( commander.equalsIgnoreCase("ACTIVE") )
			  {  
			     f.setPassive(false);
				 System.out.println("Active mode");
			  }
			  else if ( commander.equalsIgnoreCase("HELP") )
			    {  
				     System.out.println("ascii   binary    ls     get    put     bye    delete    cd");
					 System.out.println("pwd     mkdir     rmdir  mput   mget    !dir   passive   active");
					 System.out.println("lcd     hash");
			    }
            //  local command..
			  else if ( commander.equalsIgnoreCase("!DIR") )
			    { 			         					 
					 System.out.println("\n\tSizes\tFile name\n");
					 File localDir = new File(localDirectory);
					 String files[] =  localDir.list();
                     for ( int i=0;i < files.length ; i++ )
                     {
                       File file = new File(files[i]);
					   if (file.isDirectory())
					     files[i] = files[i]+"/";					   
					   System.out.println("\t"+file.length()+"\t"+files[i]);
                     }
			    }

              else System.out.println("Invalid Command.");
			}
		    } catch (IOException ex) { 
			 System.out.println(ex.getMessage());
			 System.out.print(f.getResponseString());
			 }					
		}
		
	}

	    void recureGet(File localPath,String remotePath,String star) throws IOException
		{  
			String nextRemotePath="";
		    File nextLocalPath;
			// Create local Directory
		        localPath.mkdir();			
				String listOfFile;
				 listOfFile = f.getList("-p");
				 if (star.indexOf("*") == -1)
				   star = "*";				 
				 getFilter fil = new getFilter(star);
				StringTokenizer listFile = new StringTokenizer(listOfFile,"\n");
                while (listFile.hasMoreTokens())
                {				    
					String  remoteFile = listFile.nextToken();
					if ( fil.accept(remoteFile) ) 									
					{
					if (remoteFile.endsWith("/") )
					{  
   					     remoteFile = remoteFile.substring(0,remoteFile.length()-1);
						 System.out.println("remoteFile : "+remoteFile);
						 nextRemotePath = remotePath+"/"+remoteFile;
						 nextLocalPath = new File(localPath,remoteFile);
						 f.cd(nextRemotePath);
						 recureGet(nextLocalPath,nextRemotePath,"*");
						 f.cdup();
						 f.getResponseString();
					}
					else
				    {
					   if	(remoteFile.equals("*")) 
					     remoteFile = remoteFile.substring(0,remoteFile.length()-1);
					   remoteFile = remoteFile.trim();
					   nextRemotePath = remotePath+"/"+remoteFile;
					   File f1 = new File(localPath,remoteFile);
//					   System.out.println("\n==> Create local File : "+nextLocalPath);
					      long size = fileCheck(f1);
					      if (size!=0)
                          { 
						      System.out.print("File Exist! ");
						      System.out.print("Do you want to continue? [R=resume;O=overwirte;C=cancel] ");
						      String choice = keyboardInput.readLine().toUpperCase();
                              if (choice.startsWith("R") )                           
				                f.Download(f1,nextRemotePath,size);		 
                              else if (choice.startsWith("O") )
                                f.Download(f1,nextRemotePath,0);
						  }
					      else f.Download(f1,nextRemotePath,0);					   

					}
					}
                }

		   
		}
		
		boolean recurePut(File localDirectory,String remoteDirectory,String wildcard) throws IOException
		{
		   //  wildcard must to check before get list of name.        
			   String files[] = localDirectory.list(new putFilter(wildcard));  
			   if  ( files.length == 0 ) return false;
		   for ( int i =0; i < files.length ; i++ )
		     {  			    
				String localFile  =  files[i]; 
			    File  what = new File(localDirectory,localFile);
				   if (   what.isFile() && what.exists() ) 
				     { 
					    String remoteFile = localFile;                          
						f.Upload(what,remoteFile,0);
					 }
				   else if ( what.isDirectory() && what.exists() )
				     {
					   String nextRemoteDirectory = remoteDirectory+"/"+what.getName();
					   f.mkdir(localFile);					   
					   f.cd(localFile);
					   f.getResponseString();
					   recurePut(what,nextRemoteDirectory,"*");
					   f.cdup();
					 }
			  }
			  return true;
	     }
			
				

		   
		long fileCheck(File f)
		{   		     			 
			 if (f.exists()) return f.length();
			 else return 0;			
			
		}

 }
   
   class getFilter
   {
     String x;
	 StringTokenizer xPart;
	 int myMark;
	 boolean hack;
	 getFilter(String x) {
          this.x = x.trim();
	}	   		 
		 		
	public boolean accept(String n)
	 {
	   if   (x.equals("*")) 	    
		  return true;

	   xPart = new StringTokenizer(x,"*");
	   hack=true;
	   
	   while (xPart.hasMoreTokens())
	    {  
		  String xp = xPart.nextToken();
		  if ( (myMark = n.indexOf(xp)) == -1 ) 
	       {
		      hack = false; 
			  break;
	       }
		  else n = n.substring(myMark+xp.length());

	    }		 
	   return hack;  
	 }
  }



  class putFilter implements FilenameFilter 
  { 
    String x;
	StringTokenizer xPart;
	int myMark;
	boolean hack ;
	putFilter(String x) {
          this.x = x.trim();
	}	   		 
		 		
	public boolean accept(File d,String n)
	 {
	   if   (x.equals("")) 	    
		  return true;

	   xPart = new StringTokenizer(x,"*");
	   hack=true;
	   
	   while (xPart.hasMoreTokens())
	    {  
		  String xp = xPart.nextToken();
		  if ( (myMark = n.indexOf(xp)) == -1 ) 
	       {
		      hack = false; 
			  break;
	       }
		  else n = n.substring(myMark+xp.length());

	    }		 
	   return hack;  
	 }
  }