import app.*;
import java.util.Properties;
import java.io.FileInputStream;
import javax.swing.UIManager;
import java.io.*;

public class IsagSSH{
	///*
	public static void main(String[] args) {
		//Properties props = new Properties();
		try{
			//args[0] = null;
			Properties props = new Properties();
			if (args.length > 0) {
				String opt = args[0];
				if("-prop".equals(opt)){
					
					FileInputStream fin = new FileInputStream(args[1]);
					props.load(fin);
					System.out.println(props.toString());
					fin.close();
				}
				if("isagsftp".equals(props.getProperty("sshmode")) || ("-sftp".equals(opt))){//*/
					IsagSFTP sftp = new IsagSFTP(props);
					sftp.run();
					System.exit(sftp.getExitStatus());	
				}else if("isagterm".equals(props.getProperty("sshmode"))  || ("-ssh".equals(opt)) ){
					IsagTerm ssh2 = new IsagTerm(props);
					ssh2.run();
					System.exit(ssh2.getExitStatus());
					//System.exit(sftp.getExitStatus());	
				}
			}else System.out.println("Usage : IsagSSH [-ssh|-sftp] [-prop <path to properties file>] ");
		}catch(Exception e) {System.out.print(e);}			
	}//*/
	
}
