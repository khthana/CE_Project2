import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class Open_File {
	FileInputStream fin;
	BufferedInputStream bin;
	DataInputStream din;
	String s = "";
	int i = 0, j = 0;
	int mouseX = 0, mouseY = 0;
	boolean end_file = false;
	Open_File(String filename) {
		try { fin = new FileInputStream(filename); } catch ( IOException e ) {}
		bin = new BufferedInputStream(fin);
		din = new DataInputStream(bin);
	}
	public void Next() {
		try { s = din.readLine(); } catch ( IOException e ) {}
		i = 0;
	}
	public boolean End_File() {
		if (s == null) { end_file = true; } else {end_file = false; }
		return end_file;
	}
	public String getData() {
		return s;
	}
	public void setMouse() {
		i++;
		j = i;
		while (s.substring(i,i+1).equals("/") == false) {
			i++;
		}
		mouseX = Integer.parseInt(s.substring(j,i));
		i = i + 1;
		j = i;
		while (s.substring(i,i+1).equals("]") == false) {
			i++;
		}
		mouseY = Integer.parseInt(s.substring(j,i));
		i = i + 2;
	}
	public int Mousex() {
		return mouseX;
	}
	public int Mousey() {
		return mouseY;
	}
	public void Close() {
		try { din.close(); } catch ( IOException e ) {}
	}
}
