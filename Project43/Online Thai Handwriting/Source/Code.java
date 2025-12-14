import java.awt.*;

public class Code {
	String fx, fy, lx, ly, c;
	Feture f;
	Code(String firstx, String firsty, String lastx, String lasty, String chain) {
		fx = firstx; fy = firsty; lx = lastx; ly = lasty; c = chain;
		f = new Feture(fx,fy,lx,ly,c);
	}
	public boolean f01() {
		if ( Math.abs( f.First_long_1_fy() - f.First_long_3_ly() ) <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f02() {
		if ( f.First_long_1_fy() - f.First_long_3_ly() > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f03() {
		if ( f.First_long_3_ly() - f.First_long_1_fy() > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f04() {
		if ( Math.abs( f.First_fy() - f.Last_ly() ) <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f05() {
		if ( f.First_fy() - f.Last_ly() > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f06() {
		if ( f.Last_ly() - f.First_fy() > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f07() {
		if ( f.First_4_fx() - f.First_long_1_fx() <= ((Math.abs( f.First_long_3_fx() + f.First_long_3_lx() )/2) - (Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2))/6 ) { return true; } else { return false; }
	}
	public boolean f08() {
		if ( f.First_4_fx() - f.First_long_1_fx() > ((Math.abs( f.First_long_3_fx() + f.First_long_3_lx() )/2) - (Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2))/6 ) { return true; } else { return false; }
	}
	public boolean f09() {
		if ( f.First_fx() >= f.Last_lx() ) { return true; } else { return false; }
	}
	public boolean f10() {
		if ( f.First_fx() < f.Last_lx() ) { return true; } else { return false; }
	}
	public boolean f11() {
		if ( f.Last_ly() < Math.abs( f.First_long_3_fy() + f.First_long_3_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f12() {
		if ( f.Last_ly() >= Math.abs( f.First_long_3_fy() + f.First_long_3_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f13() {
		if ( f.First_fx() > Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) { return true; } else { return false; }
	}
	public boolean f14() {
		if ( f.First_fx() <= Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) { return true; } else { return false; }
	}
	public boolean f15() {
		if ( Math.abs( f.First_fy() - f.First_long_1_fy() ) <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/3 ) { return true; } else { return false; }
	}
	public boolean f16() {
		if ( f.First_long_1_fy() - f.First_fy() > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/3 ) { return true; } else { return false; }
	}
	public boolean f17() {
		if ( f.First_fy() - f.First_long_1_fy() > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/3 ) { return true; } else { return false; }
	}
	public boolean f18() {
		if ( Math.abs( f.First_fx() - Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) <= ((Math.abs( f.First_long_3_fx() + f.First_long_3_lx() )/2) - (Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2))/6 ) { return true; } else { return false; }
	}
	public boolean f19() {
		if ( Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 - f.First_fx() > ((Math.abs( f.First_long_3_fx() + f.First_long_3_lx() )/2) - (Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2))/6 ) { return true; } else { return false; }
	}
	public boolean f20() {
		if ( f.First_fx() - Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 > ((Math.abs( f.First_long_3_fx() + f.First_long_3_lx() )/2) - (Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2))/6 ) { return true; } else { return false; }
	}
	public boolean f21() {
		if ( Math.abs( f.First_long_3_fy() - f.First_long_1_ly() ) <= Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f22() {
		if ( f.First_long_1_ly() - f.First_long_3_fy() > Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f23() {
		if ( f.First_long_3_fy() - f.First_long_1_ly() > Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f24() {
		if ( f.First_fx() >= ((f.First_long_1_fx() + f.First_long_1_lx())/2 + (f.First_long_3_fx() + f.First_long_3_lx())/2)/2 ) { return true; } else { return false; }
	}
	public boolean f25() {
		if ( f.First_fx() < ((f.First_long_1_fx() + f.First_long_1_lx())/2 + (f.First_long_3_fx() + f.First_long_3_lx())/2)/2 ) { return true; } else { return false; }
	}
	public boolean f26() {
		if ( f.First_long_2_fx() >= f.First_long_3_lx() ) { return true; } else { return false; }
	}
	public boolean f27() {
		if ( f.First_long_2_fx() < f.First_long_3_lx() ) { return true; } else { return false; }
	}
	public boolean f28() {
		if ( f.First_fy() < Math.abs( f.Last_ly() + f.First_long_1_fy() )/2 ) { return true; } else { return false; }
	}
	public boolean f29() {
		if ( f.First_fy() >= Math.abs( f.Last_ly() + f.First_long_1_fy() )/2 ) { return true; } else { return false; }
	}
	public boolean f30() {
		if ( Math.abs( f.First_long_1_fy() - f.Second_long_1_fy() ) <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f31() {
		if ( Math.abs( f.First_long_1_fy() - f.Second_long_1_fy() ) > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f32() {
		if ( f.First_fy() < f.Last_ly() + Math.abs( f.Last_ly() - f.First_long_1_fy() )*2/3 ) { return true; } else { return false; }
	}
	public boolean f33() {
		if ( f.First_fy() >= f.Last_ly() + Math.abs( f.Last_ly() - f.First_long_1_fy() )*2/3 ) { return true; } else { return false; }
	}
	public boolean f34() {
		if ( f.Last_ly() - f.First_fy() <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f35() {
		if ( f.First_fy() - f.Last_ly() <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f36() {
		if ( Math.abs( ( f.First_long_1_fx() + f.First_long_1_lx() )/2 - ( f.First_long_3_fx() + f.First_long_3_lx() )/2 ) <= Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f37() {
		if ( Math.abs( ( f.First_long_1_fx() + f.First_long_1_lx() )/2 - ( f.First_long_3_fx() + f.First_long_3_lx() )/2 ) > Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f38() {
		if ( f.First_fy() < Math.abs( f.First_long_3_fy() + f.First_long_3_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f39() {
		if ( f.First_fy() >= Math.abs( f.First_long_3_fy() + f.First_long_3_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f40() {
		if ( f.First_fx() >= f.Last_lx() ) { return true; } else { return false; }
	}
	public boolean f41() {
		if ( f.First_fx() < f.Last_lx() ) { return true; } else { return false; }
	}
	public boolean f42() {
		if ( Math.abs( f.Last_1_fy() - f.First_long_3_ly() ) <= Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}	
	public boolean f43() {
		if ( f.First_long_3_ly() - f.Last_1_fy() > Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f44() {
		if ( f.Last_1_fy() - f.First_long_3_ly() > Math.abs( f.First_long_3_fy() - f.First_long_3_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f45() {
		if ( Math.abs( f.First_long_3_ly() - f.Second_long_3_ly() ) <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f46() {
		if ( Math.abs( f.First_long_3_ly() - f.Second_long_3_ly() ) > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/5 ) { return true; } else { return false; }
	}
	public boolean f47() {
		if ( Math.abs( f.First_long_1_fy() - f.First_long_1_ly() ) - Math.abs( f.Second_long_1_fy() - f.Second_long_1_ly() ) <= Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f48() {
		if ( Math.abs( f.First_long_1_fy() - f.First_long_1_ly() ) - Math.abs( f.Second_long_1_fy() - f.Second_long_1_ly() ) > Math.abs( f.First_long_1_fy() - f.First_long_1_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f49() {
		if ( f.Last_ly() < Math.abs( f.First_long_1_fy() + f.First_long_1_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f50() {
		if ( f.Last_ly() >= Math.abs( f.First_long_1_fy() + f.First_long_1_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f51() {
		if ( f.Last_ly() <= f.First_long_1_ly() ) { return true; } else { return false; }
	}
	public boolean f52() {
		if ( f.Last_ly() > f.First_long_1_ly() ) { return true; } else { return false; }
	}
	public boolean f53() {
		if ( f.First_fy() < Math.abs( f.First_long_1_fy() + f.First_long_1_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f54() {
		if ( f.First_fy() >= Math.abs( f.First_long_1_fy() + f.First_long_1_ly() )/2 ) { return true; } else { return false; }
	}
	public boolean f55() {
		if ( f.Last_lx() <= f.First_long_2_fx() ) { return true; } else { return false; }
	}
	public boolean f56() {
		if ( f.Last_lx() > f.First_long_2_fx() ) { return true; } else { return false; }
	}
	public boolean f57() {
		if ( f.Last_ly() <= f.First_long_1_ly() ) { return true; } else { return false; }
	}
	public boolean f58() {
		if ( f.Last_ly() > f.First_long_1_ly() ) { return true; } else { return false; }
	}
	public boolean f59() {
		if ( f.Last_ly() < f.First_long_3_ly() - Math.abs( f.First_long_3_ly() - f.First_long_3_fy() )/10 ) { return true; } else { return false; }
	}
	public boolean f60() {
		if ( f.Last_ly() >= f.First_long_3_ly() - Math.abs( f.First_long_3_ly() - f.First_long_3_fy() )/10 ) { return true; } else { return false; }
	}
	public boolean f61() {
		if ( f.Line() > f.Write() ) { return true; } else { return false; }
	}
	public boolean f62() {
		if ( f.Line() < f.Write() ) { return true; } else { return false; }
	}
	public boolean f63() {
		if ( f.Writex() >= f.Last_lx() - Math.abs( f.First_long_2_fx() - f.First_long_2_lx() )/4 ) { return true; } else { return false; }
	}
	public boolean f64() {
		if ( f.Writex() < f.Last_lx() - Math.abs( f.First_long_2_fx() - f.First_long_2_lx() )/4 ) { return true; } else { return false; }
	}
	public boolean f65() {
		if ( f.First_long_4_fy() - f.Last_ly() > Math.abs( f.First_long_4_fy() - f.First_long_4_ly() ) ) { return true; } else { return false; }
	}
	public boolean f66() {
		if ( f.First_long_4_fy() - f.Last_ly() <= Math.abs( f.First_long_4_fy() - f.First_long_4_ly() ) ) { return true; } else { return false; }
	}
	public boolean f67() {
		if ( f.Last_1_fx() > Math.abs( f.Last_3_fx() + f.Last_3_lx() )/2 ) { return true; } else { return false; }
	}
	public boolean f68() {
		if ( f.Last_1_fx() < Math.abs( f.Last_3_fx() + f.Last_3_lx() )/2 ) { return true; } else { return false; }
	}
	public boolean f69() {
		if ( f.First_long_3_lx() > Math.abs( f.Second_long_1_fx() + f.Second_long_1_lx() ) / 2 ) { return true; } else { return false; }
	}
	public boolean f70() {
		if ( f.First_long_1_fx() > f.Second_long_1_fx() ) {
			if ( f.First_long_3_lx() <= Math.abs( f.Second_long_1_fx() + f.Second_long_1_lx() ) / 2 ) { return true; } else { return false; }
		} else {
			if ( f.Second_long_3_lx() <= Math.abs( f.Second_long_1_fx() + f.Second_long_1_lx() ) / 2 ) { return true; } else { return false; }
		}
	}
	public boolean f71() {
		if ( f.Second_long_3_fy() < f.Third_long_3_fy() ) {
			if ( Math.abs( f.Second_long_3_fx() + f.Second_long_3_fy() )/2 <= Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) { return true; } else { return false; }
		} else {
			if ( Math.abs( f.Third_long_3_fx() + f.Third_long_3_fy() )/2 <= Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) { return true; } else { return false; }
		}
	}
	public boolean f72() {
		if ( f.Second_long_3_fy() < f.Third_long_3_fy() ) {
			if ( Math.abs( f.Second_long_3_fx() + f.Second_long_3_fy() )/2 > Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) { return true; } else { return false; }
		} else {
			if ( Math.abs( f.Third_long_3_fx() + f.Third_long_3_fy() )/2 > Math.abs( f.First_long_1_fx() + f.First_long_1_lx() )/2 ) { return true; } else { return false; }
		}
	}
	public boolean f73() {
		if ( f.First_fy() < Math.abs( f.First_long_1_fy() + f.First_long_1_ly() )*3/5 ) { return true; } else { return false; }
	}
	public boolean f74() {
		if ( f.First_fy() >= Math.abs( f.First_long_1_fy() + f.First_long_1_ly() )*3/5 ) { return true; } else { return false; }
	}
}
