package com.musicinc.impl.mediastream;

import java.util.*;
import java.io.Serializable;

public class SearchResponse implements Serializable {
	private Vector response = new Vector();
	private int searchHits;
	public static final int TRACKID = 0;
	public static final int ARTIST = 1;
	public static final int TITLE = 2;
	public static final int COST = 3;
	public static final int GENRE = 4;
	public static final int ALBUM = 5;
	public static final int FILEURL = 6;
	public SearchResponse() {
	}
	public void addTrack(String trackID, String artist, String title, String cost, String genre, String album, String fileURL) {
		String[] track = new String[]{trackID, artist, title, cost, genre, album, fileURL};
		response.addElement(track);
	}
	public String getTrackID(int i) {
		return ((String[]) response.elementAt(i))[0];
	}
	public String getArtist(int i) {
		return ((String[]) response.elementAt(i))[1];
	}
	public String getTitle(int i) {
		return ((String[]) response.elementAt(i))[2];
	}
	public String getCost(int i) {
		return ((String[]) response.elementAt(i))[3];
	}
	public String getGenre(int i) {
		return ((String[]) response.elementAt(i))[4];
	}
	public String getAlbum(int i) {
		return ((String[]) response.elementAt(i))[5];
	}
	public String getFileURL(int i) {
		return ((String[]) response.elementAt(i))[6];
	}
	public String[] getFields(int i) {
		return (String[]) response.elementAt(i);
	}
	public int getNumTracks() {
		return response.size();
	}
	public void setSearchHits(int i) {
		this.searchHits = i;
	}
	public int getSearchHits() {
		return searchHits;
	}	
}