import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class Chain {
	Mode Mo = new Mode();
	String Ochain = "", chain = "";
	String firstx = "", firsty = "";
	String lastx = "", lasty = "";
	String group = "", ch = "";
	int intmil = 0, intsec = 0, intmin = 0, inthour = 0, usedtime = 0;
	int finalmil = 0, finalsec = 0, finalmin = 0, finalhour = 0;
	int mX = 0, mY = 0, OmX = 0, OmY = 0;
	int mode = 0, current_mode = 0;
	int up = 0;
	int i = 0, j = 0;
	int c1 = 0, c2 = 0,c3 =0, c4 = 0;
	int step = 0;
	int fx1 = 0, fx2 = 0, fx3 = 0, fx4 = 0, fx5 = 0;
	int fy1 = 0, fy2 = 0, fy3 = 0, fy4 = 0, fy5 = 0;
	boolean first = true;
	boolean last = false, b_last = false;
	boolean c1_w = false, c2_w = false, c3_w = false, c4_w = false;
	Chain() {}
	public void Create(int mX, int mY) {
		fx5 = fx4; fx4 = fx3; fx3 = fx2; fx2 = fx1;
		fy5 = fy4; fy4 = fy3; fy3 = fy2; fy2 = fy1;
		fx1 = mX;
		fy1 = mY;
		if (last == false) {
			if (mX == 999) {
				step = 2;
			}
			if (step != 0) {
				step --;
			} else {
				if (mX == 0) {
					if (b_last == false) {
						b_last = true;
					} else {
						b_last = false;
						last = true;
						lastx = lastx + fx5 + ",";
						lasty = lasty + fy5 + ",";
					}
				} else {
					if ((OmX == 0) && (first == false)) {
						chain = chain + "s";
						firstx = firstx + "0,";
						firsty = firsty + "0,";
						lastx = lasty + "0,";
						lasty = lasty + "0,";
						up ++;
						current_mode = 0;
						c1 = c2 = c3 = c4 =0;
						c1_w = c2_w = c3_w = c4_w = false;
					}
				}
				if (OmX != 0) {
					if ((OmX != mX) || (OmY != mY)) {
						first = false;
 						Mo.Mode(OmX,OmY,mX,mY);
						mode = Mo.ReMode();
						switch (mode) {
						case 1 : c1++; break;
						case 2 : c2++; break;
						case 3 : c3++; break;
						case 4 : c4++; break;
						}
						if (current_mode != mode) {
							if ((c1 == 3) && (c1_w == false)) {
								if (current_mode != 1) {
									chain = chain + "1";
									current_mode = 1;
									firstx = firstx + fx4 + ",";
									firsty = firsty + fy4 + ",";
									if (chain.length() > 1) {
										lastx = lastx + fx4 + ",";
										lasty = lasty + fy4 + ",";
									}
								}
								c1_w = true;
								c2_w = c3_w = c4_w = false;
								c2 =  c3 = c4 = 0;
							}
							if ((c2 == 3) && (c2_w == false)) {
								if (current_mode != 2) {
									chain = chain + "2";
									current_mode = 2;
									firstx = firstx + fx4 + ",";
									firsty = firsty + fy4 + ",";
									if (chain.length() > 1) {
										lastx = lastx + fx4 + ",";
										lasty = lasty + fy4 + ",";
									}
								}
								c2_w = true;
								c1_w = c3_w = c4_w = false;
								c1 =  c3 = c4 = 0;
							}
							if ((c3 == 3) && (c3_w == false)) {
								if (current_mode != 3) {
									chain = chain + "3";
									current_mode = 3;
									firstx = firstx + fx4 + ",";
									firsty = firsty + fy4 + ",";
									if (chain.length() > 1) {
										lastx = lastx + fx4 + ",";
										lasty = lasty + fy4 + ",";
									}
								}
								c3_w = true;
								c2_w = c1_w = c4_w = false;
								c1 =  c2 = c4 = 0;
							}
							if ((c4 == 3) && (c4_w == false)) {
								if (current_mode != 4) {
									chain = chain + "4";
									current_mode = 4;
									firstx = firstx + fx4 + ",";
									firsty = firsty + fy4 + ",";
									if (chain.length() > 1) {
										lastx = lastx + fx4 + ",";
										lasty = lasty + fy4 + ",";
									}
								}
								c4_w = true;
								c2_w = c3_w = c1_w = false;
								c1 =  c3 = c2 = 0;
							}
						} else {
							if (current_mode == 1) { c2 =  c3 = c4 = 0; }
							if (current_mode == 2) { c1 =  c3 = c4 = 0; }
							if (current_mode == 3) { c2 =  c1 = c4 = 0; }
							if (current_mode == 4) { c2 =  c3 = c1 = 0; }
						}
					}
				}
			}
		} else {
			if (up > 0) {
				chain = "s" + chain;
				firstx = "0," + firstx;
				firsty = "0," + firsty;
				lastx = "0," + lastx;
				lasty = "0," + lasty;
			}
			Check C = new Check(chain);
			group = C.Send_Char();
			if (C.Send_Char().length() > 2) {
				C.Feture(firstx,firsty,lastx,lasty);
			}
			ch = C.Send_Char();
			if ( ch.length() > 1 ) { ch = ch.substring(0,2); }
  	}
		OmX = mX;
		OmY = mY;
	}
	public void Clear() {
		b_last = last = false;
		up = 0;
		current_mode = 0;
		chain = "";
		c1 = c2 = c3 = c4 = 0;
		step = 0;
		mode = 0;
		c1_w = c2_w = c3_w = c4_w = false;
		firstx = firsty = lastx = lasty = "";
		fx1 = fx2 =fx3 =fx4 = fx5 = fy1 = fy2 = fy3 = fy4 =fy5 = 0;
		first = true;
	}
	public String getChain() {
		return chain;
	}
	public String getGroup() {
		return group;
	}
	public String getChar() {
		if (ch.equals("")) {
			ch = "?";
		} else {
			ch = ch.substring(0,1);
		}
		return ch;
	}
	public int getTime() {
		return usedtime;
	}
  public void setChain(String s1) {
    chain = s1;
		Check C = new Check(chain);
		group = C.Send_Char();
  }
}