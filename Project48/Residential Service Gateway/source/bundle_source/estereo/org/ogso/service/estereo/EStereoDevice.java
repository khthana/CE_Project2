package org.ogso.service.estereo;

import javax.sound.sampled.*;
import org.osgi.service.device.Device;

public interface EStereoDevice extends Device {
	public void play(AudioInputStream ais,EStereoEventListener esel) throws UnsupportedAudioFileException;
}