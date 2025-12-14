package com.musicinc.impl.mediastream;

import java.io.Serializable;

public class SearchRequest implements Serializable {
	String titlehash, artisthash, albumhash, genrehash;
	public SearchRequest(String titlehash, String artisthash, String albumhash, String genrehash) {
		this.titlehash = titlehash;
		this.artisthash = artisthash;
		this.albumhash = albumhash;
		this.genrehash = genrehash;
	}
	public String getTitleHash() {
		return titlehash==null?"":titlehash;
	}
	public String getArtistHash() {
		return artisthash==null?"":artisthash;
	}
	public String getAlbumHash() {
		return albumhash==null?"":albumhash;
	}
	public String getGenreHash() {
		return genrehash==null?"":genrehash;
	}
}
