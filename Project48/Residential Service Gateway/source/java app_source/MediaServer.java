import java.util.*;
import java.sql.*;
import com.musicinc.impl.mediastream.*;
import java.net.*;
import java.io.*;

class MediaServerImpl extends Thread {
	Socket sock = null;
	Vector clientThreads = null;
	boolean debug=true;
	MediaServerImpl(Socket sock, Vector clientThreads) {
		this.sock = sock;
		this.clientThreads = clientThreads;
	}
	public void run() {
		// connect to the database
		String data = "jdbc:mysql://localhost/musicincdb";
		Connection conn = null;
		Statement st = null;
		if (debug) System.err.println("Client thread started...");
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(data,"root","admin");
			st = conn.createStatement();
			ObjectInputStream ois = new ObjectInputStream(sock.getInputStream());
			ObjectOutputStream oos = new ObjectOutputStream(sock.getOutputStream());
			Object o = ois.readObject();
			if (o.getClass().getName().equals("com.musicinc.impl.mediastream.SearchRequest")) {
				//process search request
				if (debug) System.out.println("Search request received, processing...");
				SearchRequest sr = (SearchRequest) o;
				st = conn.createStatement();
				String searchQuery = ("SELECT * FROM `tracks` where artisthash like '" + sr.getArtistHash() + "%' and titlehash like '" + sr.getTitleHash() + "%' and albumhash like '" + sr.getAlbumHash() + "%' and genrehash like '" + sr.getGenreHash() + "%'order by titlehash, artisthash desc");
				if (debug) System.out.println("Issuing Query:" + searchQuery);
				ResultSet rec = st.executeQuery(searchQuery);
				SearchResponse searchResp = new SearchResponse();
				String urlStub ="http://161.246.5.111:8001/media/";
				int i;
				for (i=0;rec.next();i++) {
					// add the first 20 search results to the response
					if (i<20) searchResp.addTrack(rec.getString("trackid"), rec.getString("artist"), rec.getString("title"), rec.getString("cost"), rec.getString("genre"), rec.getString("album"), urlStub + rec.getString("filename"));
				}
				// add the number of results to the search response, the client will tell the user if there were more hits than are displayed
				searchResp.setSearchHits(i);
				if (debug) System.out.println("Number of search hits: " + i);
				// clean up the DB connection
				rec.close();
				st.close();
				oos.writeObject(searchResp);
				oos.reset();
			} else {
				System.err.println("Error: invalid class received: " + o.getClass().getName());
			}
		} catch (Exception e){
			System.err.println("Error: " + e.toString());
		}
		// remove this thread from the vector
		clientThreads.removeElement(this);
		try {
			sock.close();
		} catch(IOException e) {
			System.err.println("Error closing client socket");
		}
		if (debug) System.out.println("Client disconnected.");
	}
}

public class MediaServer {
	public static void main(String[] args) throws Exception{
		int port = 9999;
		ServerSocket sock = new ServerSocket(port);
		Socket client = null;
		Vector clientThreads = new Vector();
		System.out.println("MediaStream Media Content Server up and running on port: " + port);
		while (true) {
			client = sock.accept();
			System.out.println("Client connected: " + client.getRemoteSocketAddress().toString()); 
			MediaServerImpl msi = new MediaServerImpl(client, clientThreads);
			clientThreads.addElement(msi);
			msi.start();
		}
	}
}
