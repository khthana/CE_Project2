package com.musicinc.impl.mediastream;

public class PanelController {
	TrackSelectorPanel tsp = null;
	PlayListPanel plp = null;
	QueuePanel qp = null;
	public PanelController() {
	}
	public void set(TrackSelectorPanel tsp) {
		this.tsp = tsp;
	}
	public void set(PlayListPanel plp) {
		this.plp = plp;
	}
	public void set(QueuePanel qp) {
		this.qp=qp;
	}
	public void disable() {
		tsp.disable();
		plp.disable();
	}
	public void enable() {
		tsp.enable();
		plp.enable();
	}
	public void addTrack(String title, String artist, String cost, String fileURL) {
		plp.addTrack(title, artist, cost, fileURL);
	}
	public void queueTrack(String title, String artist, String fileURL) {
		qp.queueTrack(title,artist,fileURL);
	}
}