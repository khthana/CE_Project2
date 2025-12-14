public class Mode {
	int mode = 0;
	Mode() {}
	public void Mode(int OmX, int OmY, int mX, int mY) {
		if ( OmX > mX ) {
			if ( OmY > mY ) {
				if (Math.abs(OmX-mX)>=Math.abs(OmY-mY)) { mode = 4; } else { mode = 1; }
			} else {
				if (Math.abs(OmX-mX)>=Math.abs(OmY-mY)) { mode = 4; } else { mode = 3; }
			}
		} else {		
			if ( OmY > mY ) {
				if (Math.abs(OmX-mX)>=Math.abs(OmY-mY)) { mode = 2; } else { mode = 1; }
			} else {
				if (Math.abs(OmX-mX)>=Math.abs(OmY-mY)) { mode = 2; } else { mode = 3; }
			}
		}
	}
	public int ReMode() {
		return mode;
	}
}
