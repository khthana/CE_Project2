import java.io.*;
import java.util.*;
import java.sql.*;

public class AddMedia {
	public static void main(String args[]) throws Exception {
		if (args.length<=1) {
			System.err.println("AddMedia [cost] [files]");
			System.exit(1);
		}
		// connect to the database
		String data = "jdbc:mysql://localhost/musicincdb";
		Connection conn = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(data,"root","admin");
			st = conn.createStatement();
		} catch (Exception e){
			System.err.println("Error: " + e.toString());
		}
		int cost = Integer.parseInt(args[0]);
		for (int i=1; i<args.length; i++) {
			File f = new File(args[i]);
			if (!f.exists()) {
				System.err.println("File " + args[i]+ " does not exist, ignoring...");
				continue;
			}
			File target = new File("C:\\Tomcat\\webapps\\ROOT\\media\\" + args[i]);
			if (target.exists()) {
				System.err.println("File " + args[i]+ " already exists in media folder, ignoring...");
				continue;
			}
			FileInputStream fis = new FileInputStream(f);
			FileOutputStream fos = new FileOutputStream(target);
			byte[] buffer = new byte[1024];
			int readBytes;
			do {
				readBytes = fis.read(buffer);
				if (readBytes!=-1) fos.write(buffer,0, readBytes);
			} while (readBytes!=-1);
			fis.close();
			fos.close();
			fis = new FileInputStream(target);
			VorbisInfo vi = new VorbisInfo(fis);
			String filename = args[i];
			String artist, title, album, genre;
			try {
				artist = (String) vi.getComments("ARTIST").elementAt(0);
				title = (String) vi.getComments("TITLE").elementAt(0);
				album = (String) vi.getComments("ALBUM").elementAt(0);
				genre = (String) vi.getComments("GENRE").elementAt(0);
			} catch (NullPointerException e) {
				System.err.println("Error: required tags do not exist in file: " + args[i] + ", ignoring...");
				fis.close();
				target.delete();
				continue;
			}
			String artisthash = getHash(artist);
			String titlehash = getHash(title);
			String albumhash = getHash(album);
			String genrehash = getHash(genre);
			int rec = st.executeUpdate("insert into tracks (filename, artist, artisthash, title, titlehash, album, albumhash, genre, genrehash, cost) values ('" + filename +"', '" + artist + "', '" + artisthash + "', '" + title + "', '" + titlehash + "', '" + album + "', '" + albumhash+ "', '" + genre + "', '" + genrehash + "', '" + cost + "')");
			System.out.println("========================================================");
			System.out.println("File : " + args[i]);
			System.out.println("Artist : " + artist);
			System.out.println("Hash : " + artisthash);
			System.out.println("Title : " + title);
			System.out.println("Hash : " + titlehash);
			System.out.println("Album : " + album);
			System.out.println("Hash : " + albumhash);
			System.out.println("Genre : " + genre);
			System.out.println("Hash : " + genrehash);
			System.out.println("Cost : " + cost);
			System.out.println("========================================================");
		}
		// close the database connection
		st.close();
	}

	public static String getHash(String original) {
		String search = original.toUpperCase();
		String hash = "";
		String alphabet ="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
		String hashes ="1112223334445556667778889901234567890";
		for (int i=0;i<search.length();i++){
			int index = alphabet.indexOf(search.charAt(i));
			if (index != -1) hash += hashes.charAt(index);
		}
		if (hash.length()>9)hash = hash.substring(0,8);
		if (hash.length()<9){
			for (int i=hash.length();i<9;i++){
				hash += "0";
			}
		}
		return hash;
	}
}