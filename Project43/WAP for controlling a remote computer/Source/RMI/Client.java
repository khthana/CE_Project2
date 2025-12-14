import java.util.*;
import java.io.*;
import java.awt.*;
import java.rmi.*;
import java.rmi.server.*;

public class Client extends Frame implements ClientInterface
{
	Frame1 frame1;
	Frame2 frame2;
	String username = "";
	LogFileWriter log_writer = new LogFileWriter();
	public Client()
	{
		try
		{
			UnicastRemoteObject.exportObject(this);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		frame1 = new Frame1(this);
		frame1.show();
	}
	public static void main(String[] args) 
	{
		Client client = new Client();
	}
	public void loginSuccessed(String username) throws RemoteException
	{
		this.username=username;
		frame1.hide();
		frame2 = new Frame2(this, username);
		frame2.show();
	}
	public void showMessage(String msg) throws RemoteException
	{
		System.out.println(msg);
	}
	public void updateList(Vector authorizedList, Vector unauthorizedList) throws RemoteException
	{
		frame2.updateList(authorizedList, unauthorizedList);
	}
	public void showPostIt(String post_msg) throws RemoteException
	{
		PostItFrame pstItFrm = new PostItFrame(post_msg);
		pstItFrm.show();
	}
	public void showPostIt(String from, String subject, String date, String message) throws RemoteException
	{
		PostItFrame pstItFrm = new PostItFrame(from, subject, date, message);
		pstItFrm.show();	
	}
	public void recieveFile(Hashtable files, String wapname) throws RemoteException
	{
		if (!(frame2.isAuthorize(wapname.toUpperCase())))
		{
			return;
		}
		String path = "file";
		File outPath = new File(path);
		if (!(outPath.exists()))
		{
			outPath.mkdir();
		}
		Enumeration e = files.keys();
		while (e.hasMoreElements())
		{
			try{
				String filename = (String)e.nextElement();
				byte[] byte_file = (byte[])files.get(filename);
				File outFile = new File(path, filename);
				PrintStream outStream = new PrintStream(new FileOutputStream(outFile));
				outStream.write(byte_file, 0, byte_file.length);
				outStream.close();
				log_writer.writeLog(wapname + " wrote file " + outFile.getAbsolutePath() + ".");
			}catch(Exception ex){ex.printStackTrace();}
		}
	}

	public Hashtable sendFile(String current_path, String[] filenames, String wapname) throws RemoteException
	{
		if (!(frame2.isAuthorize(wapname.toUpperCase())))
		{
			return(null);
		}
		Hashtable files = new Hashtable();
		for (int i=0; i<filenames.length; i++)
		{
			File tmp_file = new File(current_path, filenames[i]);
			if (!(tmp_file.exists()))
			{
				return(null);
			}
			try
			{
				DataInputStream inStream = new DataInputStream(new FileInputStream(tmp_file));
				byte[] byte_file = new byte[(new Long(tmp_file.length())).intValue()];
				inStream.readFully(byte_file);
				files.put(filenames[i], byte_file);
				log_writer.writeLog(wapname + " read file " + tmp_file.getAbsolutePath() + ".");
			}catch(Exception e){
				return(null);
			}
		}
		return(files);
	}

	public Vector listFilename(String current_path, String directory) throws RemoteException
	{
		Vector share_vector = new Vector();
		File share_file = new File("sharing.txt");
		if (share_file.exists())
		{
			try
			{
				DataInputStream inStream = new DataInputStream(new FileInputStream(share_file));
				String line="";
				while ((line=inStream.readLine())!=null)
				{
					if ((line.trim()).length()>0)
					{
						File read_file = new File(line.trim());
						if (read_file.exists())
						{
							share_vector.addElement(read_file.getAbsolutePath().toUpperCase());
						}
					}
				}
			}catch(Exception e){e.printStackTrace();}
			String[] share_list = new String[share_vector.size()];
			share_vector.copyInto(share_list);
		}
			
		File pathFile;
		if (current_path.equals(""))
		{
			current_path = (new File("")).getAbsolutePath();
		}
		if (directory.equals(".."))
		{
			String tmp_path = (new File(current_path)).getParent();
			if (tmp_path==null){
				return(null);
			}
			pathFile = new File(tmp_path);
		}else{
			pathFile = new File(current_path, directory);
		}

		//Check whether enable all file and sub-directory
		String tmp_path = pathFile.getAbsolutePath();
		while (tmp_path!=null)
		{
			if (share_vector.contains(tmp_path.toUpperCase()))
			{
			//list all file and sub-directory
				String[] tmp = pathFile.list();
				Vector vec_dir = new Vector();
				Vector vec_file = new Vector();
				try{
					for (int i=0; i < tmp.length; i++)
					{
						if ((new File(pathFile, tmp[i])).isDirectory())
						{
							vec_dir.addElement(tmp[i]);
						}else if ((new File(pathFile, tmp[i])).isFile()){
							vec_file.addElement(tmp[i]);
						}
					}
				}catch(Exception e){e.printStackTrace();}
				String[] arr_dir = new String[vec_dir.size()];
				vec_dir.copyInto(arr_dir);
				String[] arr_file = new String[vec_file.size()];
				vec_file.copyInto(arr_file);
				Vector vector = new Vector();
				vector.addElement(arr_dir);
				vector.addElement(arr_file);
				vector.addElement(pathFile.getAbsolutePath());
				return(vector);
			}
			tmp_path = (new File(tmp_path)).getParent();
		}

		//else
		//determine which sub-directory is enable
		String[] tmp = pathFile.list();
		Vector vec_dir = new Vector();
		Vector vec_file = new Vector();
		try{
			for (int i=0; i < tmp.length; i++)
			{
				File tmp_file = new File(pathFile, tmp[i]);
				if (tmp_file.isDirectory())
				{
					tmp_path = tmp_file.getAbsolutePath().toUpperCase();
					String[] share_dir = new String[share_vector.size()];
					share_vector.copyInto(share_dir);
					for (int j=0; j<share_dir.length; j++)
					{
						if ( share_dir[j].regionMatches(0,tmp_path,0,tmp_path.length()) )
						{
							vec_dir.addElement(tmp[i]);
							break;
						//enable dir[i]
						}
					}

				}
			}
		}catch(Exception e){e.printStackTrace();}
		String[] arr_dir = new String[vec_dir.size()];
		vec_dir.copyInto(arr_dir);
		String[] arr_file = new String[vec_file.size()];
		vec_file.copyInto(arr_file);
		Vector vector = new Vector();
		vector.addElement(arr_dir);
		vector.addElement(arr_file);
		vector.addElement(pathFile.getAbsolutePath());
		return(vector);


	}

	public String executeCommand(String command, String wapname) throws RemoteException
	{
		if (!(frame2.isAuthorize(wapname.toUpperCase())))
		{
			return("You are not allowed to access <i>"+username+"</i>");
		}
		String text="";

		int index = command.lastIndexOf('\\');
		if (index == -1)
		{
			if (command.trim().toUpperCase().equals("DIR"))
			{
				String path = (new File("")).getAbsolutePath();
				String[] list_files = (new File(path)).list();
				String return_string = "";
				int count_dir = 0;
				int count_file = 0;
				Vector vec_dir = new Vector();
				Vector vec_file = new Vector();
				for (int i=0; i<list_files.length; i++)
				{
					File file = new File(path, list_files[i]);
					if (file.isDirectory())
					{
						String tmp = list_files[i] + "<DIR>";
						vec_dir.add(tmp);
						count_dir++;
					}else if(file.isFile()) {
						int size=Math.round(file.length() / 1024);
						if (file.length() % 1024 >0){ size++; }
						String tmp = list_files[i] + "(" + size + "KB)";
						vec_file.add(tmp);
						count_file++;
					}
				}
				for (int i=0; i<vec_dir.size(); i++)
				{
					return_string = return_string + (String)vec_dir.elementAt(i) + "\n";
				}
				for (int i=0; i<vec_file.size(); i++)
				{
					return_string = return_string + (String)vec_file.elementAt(i) + "\n";
				}
				return_string = return_string + count_file + " file(s)\n";
				return_string = return_string + count_dir + " dir(s)";
				return(return_string);
			}
		}else{
			String x = command.substring(index+1);
			if (x.trim().toUpperCase().equals("DIR"))
			{
				String path = command.substring(0, index+1).trim();
				if (!((new File(path)).exists()))
				{
					return("Path not found.");
				}
				String[] list_files = (new File(path)).list();
				String return_string = "";
				int count_dir = 0;
				int count_file = 0;
				Vector vec_dir = new Vector();
				Vector vec_file = new Vector();
				for (int i=0; i<list_files.length; i++)
				{
					File file = new File(path, list_files[i]);
					if (file.isDirectory())
					{
						String tmp = list_files[i] + "<DIR>";
						vec_dir.add(tmp);
						count_dir++;
					}else if(file.isFile()) {
						int size=Math.round(file.length() / 1024);
						if (file.length() % 1024 >0){ size++; }
						String tmp = list_files[i] + "(" + size + "KB)";
						vec_file.add(tmp);
						count_file++;
					}
				}
				for (int i=0; i<vec_dir.size(); i++)
				{
					return_string = return_string + (String)vec_dir.elementAt(i) + "\n";
				}
				for (int i=0; i<vec_file.size(); i++)
				{
					return_string = return_string + (String)vec_file.elementAt(i) + "\n";
				}
				return_string = return_string + "   " + count_file + " file(s)\n";
				return_string = return_string + "   " + count_dir + " dir(s)";
				return(return_string);
			}
		}

		try{
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(command);
			DataInputStream inStream = new DataInputStream(p.getInputStream()); 
			String line="";
			while ((line = inStream.readLine())!=null)
			{
				text = text+line+"\n";
			}
			log_writer.writeLog(wapname + " executed command " + command + ".");
		}catch(Exception e){e.printStackTrace(); return("Error occured while trying command.");}
		return(text+"Command is executed.");
	}
}
