import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class File_Manage {
	boolean write_temp = false;
	String s = "";
	FileInputStream fin_input, fin_temp;
	BufferedInputStream bin_input, bin_temp;
	DataInputStream din_input, din_temp;
	FileOutputStream fout_input, fout_temp;
	BufferedOutputStream bout_input, bout_temp;
	PrintStream pout_input, pout_temp;
	File_Manage(String filename) {
//////// Check File
		File file = new File(filename);
		if ( file.exists() ) {
			try { fin_input = new FileInputStream(filename); } catch ( IOException e ) {}
			bin_input = new BufferedInputStream(fin_input);
			din_input = new DataInputStream(bin_input);
			try { fout_temp = new FileOutputStream("Temp.txt"); } catch ( IOException e ) {}
			bout_temp = new BufferedOutputStream(fout_temp);
			pout_temp = new PrintStream(bout_temp);
			try { s = din_input.readLine(); } catch ( IOException e ) {}
			while ( s != null ) {
				pout_temp.println(s);
				try { s = din_input.readLine(); } catch ( IOException e ) {}
			}
			try { din_input.close(); } catch ( IOException e ) {}
			pout_temp.close();
			write_temp = true;
		} 
		try { fin_temp = new FileInputStream("Temp.txt"); } catch ( IOException e ) {}
		bin_temp = new BufferedInputStream(fin_temp);
		din_temp = new DataInputStream(bin_temp);
		try { fout_input = new FileOutputStream(filename); } catch ( IOException e ) {}
		bout_input = new BufferedOutputStream(fout_input);
		pout_input = new PrintStream(bout_input);
		if ( write_temp ) {
			try { s = din_temp.readLine(); } catch ( IOException e ) {}
			while ( s != null ) {
				pout_input.println(s);
				try { s = din_temp.readLine(); } catch ( IOException e ) {}
			}
			write_temp = false;
		}
	}
	public void InputData(String data) {
		pout_input.println(data);		
	}
	public void CloseFile() {
		try { din_temp.close(); } catch ( IOException e ) {}
		pout_input.close();
	}
}
