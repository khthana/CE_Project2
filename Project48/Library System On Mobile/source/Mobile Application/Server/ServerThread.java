// ServerThread.java
import java.io.*;
import java.net.*;
import java.util.*;
import javax.swing.*;
class ServerThread extends Thread {
	protected BufferedReader br;
	protected PrintWriter pw;
	protected Vector clients;
   PrintStream op;
	ServerThread(Socket s) throws IOException {
		this.clients = clients;
		br = new BufferedReader(new InputStreamReader(s.getInputStream()));
		op = new PrintStream(s.getOutputStream());
	}
	public void run() {
  	String  input="";
		
		try {
			while(true){
			  input = br.readLine();		 
			//  	JOptionPane.showMessageDialog(null,input);

	StringTokenizer st = new StringTokenizer(input); 
	String   temp =  st.nextToken();
    String    choise = st.nextToken();

		  if(!choise.equals("7")){
		 System.out.println("String in Search  ="+ input);		 
		 }

  
		 System.out.println(temp);
		System.out.println(choise);

	   if(choise.equals("1")){
		
		System.out.println("Auter");
		Auther  auther =new Auther();
   String ey =		auther.Find(temp);		
		System.out.println(ey);
		op.println(ey);


		
		}
else if(choise.equals("2")){
Title title = new Title();

   String ey =		title.Find(temp);		
		System.out.println(ey);	
		op.println(ey);

}
else if(choise.equals("3")){
Subject  sub = new Subject();

   String ey =		sub.Find(temp);		
		System.out.println(ey);	
		op.println(ey);

}


else if(choise.equals("4")){
Word  word = new Word();
System.out.println("5555");
   String ey =		word.Find(temp);		
		System.out.println(ey);	
		op.println(ey);
}
else if(choise.equals("5")){
Isbn title = new Isbn();

   String ey =		title.Find(temp);		
		System.out.println(ey);
		op.println(ey);
}

else if(choise.equals("6")){
View  view = new View();

   String ey =		view.Find(temp);		
		System.out.println(ey);
		op.println(ey);

		} else if(choise.equals("7")){
			Sug sug = new Sug();
		sug.Find(temp);
		System.out.println("Debun sug");
	
		}
			else{
  		String idstudent = temp;
				System.out.println(idstudent);
                 System.out.println(choise);			
			Update2  update = new Update2(idstudent,choise);
		

			}

			}		
			} catch (IOException e) {}
	}
}
