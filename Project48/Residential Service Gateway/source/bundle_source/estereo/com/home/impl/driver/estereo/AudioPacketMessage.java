package com.home.impl.driver.estereo;

import java.io.Serializable;

public class AudioPacketMessage implements Serializable{
	private byte[] audioData;
	public AudioPacketMessage(byte[] audioData, int offset, int length) {
		// make a copy of the passed data packet
		this.audioData = new byte[length];
		for (int i = 0; i < length; i++) {
			this.audioData[i] = audioData[i+offset];
		}
	}
	public byte[] getData() {
		return audioData;
	}
}