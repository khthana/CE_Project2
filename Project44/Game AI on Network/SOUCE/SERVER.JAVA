//package server;
import  java.net.*;
import  java.io.*;
//import Player;

//class  FullServerException extends Exception;
class  Server{
	public static  void main (String[] args){
		ServerSocket main_sock = null;
		try{
			System.out.println("Server program welcome");
			main_sock = new ServerSocket(5656);
			} catch(IOException e){
		  System.out.println();
		  System.exit(1);
		}
		//Lobby x = new Lobby();
		while (true){
		  try {
		  Socket s = main_sock.accept();
			DataInputStream i = new DataInputStream(s.getInputStream());
			DataOutputStream o = new DataOutputStream(s.getOutputStream());
			(new Player(s, i, o)).start();
			
		  } catch (Exception e){
		    System.out.println("error");
		  }
		
}
}
}
