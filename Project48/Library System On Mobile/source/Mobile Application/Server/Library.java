import java.io.*;
import java.net.*;
import java.sql.*;
import javax.swing.*;
import javax.swing.JOptionPane;
import java.util.*;
class Library{
	public static void main(String[] args) throws Exception{
ServerSocket ss = new ServerSocket(12345);
		System.out.println("Server is created.");			
	while (true) {
			Socket s = ss.accept();				
			ServerThread t = new ServerThread(s);		
				t.start();			
	}	
	}
}
