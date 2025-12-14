//  Search  จาก Title
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
import java.io.*;
public class   Sug {
		
	
	public  void Find(String in)throws IOException{	
	FileOutputStream WriteData = new FileOutputStream("sugestion.txt",true);
			int c=0;
			String   test =   in;
			   for(int i=0;i<test.length();i++){
			    c = test.charAt(i) ;
			   WriteData.write(c);
			   }
			 WriteData.write(32);
	 		WriteData.close();

			System.out.println("WriteData  Compleat");

	}

}