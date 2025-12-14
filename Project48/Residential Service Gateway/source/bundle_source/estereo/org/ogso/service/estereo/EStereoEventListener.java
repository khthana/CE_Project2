package org.ogso.service.estereo;

import javax.sound.sampled.AudioInputStream;

public interface EStereoEventListener {
	public void EStereoEvent(AudioInputStream ais, boolean suceeded);
}