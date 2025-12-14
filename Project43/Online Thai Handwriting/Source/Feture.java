public class Feture {
	private int last_fx = 0, last_fy = 0, last_lx = 0, last_ly = 0;
	private int first_fx = 0, first_fy = 0, first_lx = 0, first_ly = 0;
	private int first_1_fx = 0, first_1_fy = 0, first_1_lx = 0, first_1_ly = 0;
	private int first_2_fx = 0, first_2_fy = 0, first_2_lx = 0, first_2_ly = 0;
	private int first_3_fx = 0, first_3_fy = 0, first_3_lx = 0, first_3_ly = 0;
	private int first_4_fx = 0, first_4_fy = 0, first_4_lx = 0, first_4_ly = 0;
	private int last_1_fx = 0, last_1_fy = 0, last_1_lx = 0, last_1_ly = 0;
	private int last_2_fx = 0, last_2_fy = 0, last_2_lx = 0, last_2_ly = 0;
	private int last_3_fx = 0, last_3_fy = 0, last_3_lx = 0, last_3_ly = 0;
	private int last_4_fx = 0, last_4_fy = 0, last_4_lx = 0, last_4_ly = 0;
	private int first_long_1_fx = 0, first_long_2_fx = 0, first_long_3_fx =0, first_long_4_fx = 0;
	private int first_long_1_fy = 0, first_long_2_fy = 0, first_long_3_fy =0, first_long_4_fy = 0;
	private int first_long_1_lx = 0, first_long_2_lx = 0, first_long_3_lx =0, first_long_4_lx = 0;
	private int first_long_1_ly = 0, first_long_2_ly = 0, first_long_3_ly =0, first_long_4_ly = 0;
	private int second_long_1_fx = 0, second_long_2_fx = 0, second_long_3_fx =0, second_long_4_fx = 0;
	private int second_long_1_fy = 0, second_long_2_fy = 0, second_long_3_fy =0, second_long_4_fy = 0;
	private int second_long_1_lx = 0, second_long_2_lx = 0, second_long_3_lx =0, second_long_4_lx = 0;
	private int second_long_1_ly = 0, second_long_2_ly = 0, second_long_3_ly =0, second_long_4_ly = 0;
	private int third_long_1_fx = 0, third_long_2_fx = 0, third_long_3_fx =0, third_long_4_fx = 0;
	private int third_long_1_fy = 0, third_long_2_fy = 0, third_long_3_fy =0, third_long_4_fy = 0;
	private int third_long_1_lx = 0, third_long_2_lx = 0, third_long_3_lx =0, third_long_4_lx = 0;
	private int third_long_1_ly = 0, third_long_2_ly = 0, third_long_3_ly =0, third_long_4_ly = 0;
	private int lowest_1_fx = 0, lowest_1_fy = 0, lowest_1_lx = 0, lowest_1_ly = 0;
	private int lowest_2_fx = 0, lowest_2_fy = 0, lowest_2_lx = 0, lowest_2_ly = 0;
	private int lowest_3_fx = 0, lowest_3_fy = 0, lowest_3_lx = 0, lowest_3_ly = 0;
	private int heightest_1_fx = 0, heightest_1_fy = 0, heightest_1_lx = 0, heightest_1_ly = 0;
	private int heightest_2_fx = 0, heightest_2_fy = 0, heightest_2_lx = 0, heightest_2_ly = 0;
	private int heightest_3_fx = 0, heightest_3_fy = 0, heightest_3_lx = 0, heightest_3_ly = 0;
	private int line = 0;
	private int writey = 0, writex = 0;
	private String firstx = "", firsty = "", lastx = "", lasty = "", chain = "";
	Feture(String fx, String fy, String lx, String ly, String c) {
		firstx = fx; firsty = fy; lastx = lx; lasty = ly; chain = c;
		First_1();
		First_2();
		First_3();
		First_4();
		Last();
		Long();
		Lowest();
		Heightest();
		First();
		Last_Point();
		Line1();
		Write1();
	}
	private void First() {
		first_fx = Cut(0,firstx);
		first_fy = Cut(0,firsty);
		first_lx = Cut(0,lastx);
		first_ly = Cut(0,lasty);
	}
	public int First_fx() { return first_fx; }
	public int First_fy() { return first_fy; }
	public int First_lx() { return first_lx; }
	public int First_ly() { return first_ly; }
	private void Last_Point() {
		last_fx = Cut(chain.length()-1,firstx);
		last_fy = Cut(chain.length()-1,firsty);
		last_lx = Cut(chain.length()-1,lastx);
		last_ly = Cut(chain.length()-1,lasty);
	}
	public int Last_fx() { return last_fx; }
	public int Last_fy() { return last_fy; }
	public int Last_lx() { return last_lx; }
	public int Last_ly() { return last_ly; }
	private void Heightest() {
		int i = 0;
		while (i < chain.length()) {
			if (chain.substring(i,i+1).equals("1")) {
				if (heightest_1_fy > Cut(i,firsty)) {
					heightest_1_fx = Cut(i,firstx); heightest_1_fy = Cut(i,firsty); heightest_1_lx = Cut(i,lastx); heightest_1_ly = Cut(i,lasty);
				}
			}
			if (chain.substring(i,i+1).equals("2")) {
				if (heightest_2_fy > Cut(i,firsty)) {
					heightest_2_fx = Cut(i,firstx); heightest_2_fy = Cut(i,firsty); heightest_2_lx = Cut(i,lastx); heightest_2_ly = Cut(i,lasty);
				}
			}
			if (chain.substring(i,i+1).equals("3")) {
				if (heightest_3_ly > Cut(i,firsty)) {
					heightest_3_fx = Cut(i,firstx); heightest_3_fy = Cut(i,firsty); heightest_3_lx = Cut(i,lastx); heightest_3_ly = Cut(i,lasty);
				}
			}
			i++;
		}
	}
	public int Heightest_1_fx() { return heightest_1_fx; }
	public int Heightest_1_fy() { return heightest_1_fy; }
	public int Heightest_1_lx() { return heightest_1_lx; }
	public int Heightest_1_ly() { return heightest_1_ly; }
	public int Heightest_2_fx() { return heightest_2_fx; }
	public int Heightest_2_fy() { return heightest_2_fy; }
	public int Heightest_2_lx() { return heightest_2_lx; }
	public int Heightest_2_ly() { return heightest_2_ly; }
	public int Heightest_3_fx() { return heightest_3_fx; }
	public int Heightest_3_fy() { return heightest_3_fy; }
	public int Heightest_3_lx() { return heightest_3_lx; }
	public int Heightest_3_ly() { return heightest_3_ly; }
	private void Lowest() {
		int i = 0;
		while (i < chain.length()) {
			if (chain.substring(i,i+1).equals("1")) {
				if (lowest_1_fy < Cut(i,firsty)) {
					lowest_1_fx = Cut(i,firstx); lowest_1_fy = Cut(i,firsty); lowest_1_lx = Cut(i,lastx); lowest_1_ly = Cut(i,lasty);
				}
			}
			if (chain.substring(i,i+1).equals("2")) {
				if (lowest_2_fy < Cut(i,firsty)) {
					lowest_2_fx = Cut(i,firstx); lowest_2_fy = Cut(i,firsty); lowest_2_lx = Cut(i,lastx); lowest_2_ly = Cut(i,lasty);
				}
			}
			if (chain.substring(i,i+1).equals("3")) {
				if (lowest_3_ly < Cut(i,firsty)) {
					lowest_3_fx = Cut(i,firstx); lowest_3_fy = Cut(i,firsty); lowest_3_lx = Cut(i,lastx); lowest_3_ly = Cut(i,lasty);
				}
			}
			i++;
		}
	}
	public int Lowest_1_fx() { return lowest_1_fx; }
	public int Lowest_1_fy() { return lowest_1_fy; }
	public int Lowest_1_lx() { return lowest_1_lx; }
	public int Lowest_1_ly() { return lowest_1_ly; }
	public int Lowest_2_fx() { return lowest_2_fx; }
	public int Lowest_2_fy() { return lowest_2_fy; }
	public int Lowest_2_lx() { return lowest_2_lx; }
	public int Lowest_2_ly() { return lowest_2_ly; }
	public int Lowest_3_fx() { return lowest_3_fx; }
	public int Lowest_3_fy() { return lowest_3_fy; }
	public int Lowest_3_lx() { return lowest_3_lx; }
	public int Lowest_3_ly() { return lowest_3_ly; }
	private void Long() {
		int i = 0;
		while (i < chain.length()) {
			if (chain.substring(i,i+1).equals("1")) {
				if (Length(first_long_1_fx,first_long_1_lx,first_long_1_fy,first_long_1_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
					third_long_1_fx = second_long_1_fx; third_long_1_fy = second_long_1_fy; third_long_1_lx = second_long_1_lx; third_long_1_ly = second_long_1_ly;
					second_long_1_fx = first_long_1_fx; second_long_1_fy = first_long_1_fy; second_long_1_lx = first_long_1_lx; second_long_1_ly = first_long_1_ly;
					first_long_1_fx = Cut(i,firstx); first_long_1_fy = Cut(i,firsty); first_long_1_lx = Cut(i,lastx); first_long_1_ly = Cut(i,lasty);
				} else {
					if (Length(second_long_1_fx,second_long_1_lx,second_long_1_fy,second_long_1_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
						third_long_1_fx = second_long_1_fx; third_long_1_fy = second_long_1_fy; third_long_1_lx = second_long_1_lx; third_long_1_ly = second_long_1_ly;
						second_long_1_fx = Cut(i,firstx); second_long_1_fy = Cut(i,firsty); second_long_1_lx = Cut(i,lastx); second_long_1_ly = Cut(i,lasty);
					} else {
						if (Length(third_long_1_fx,third_long_1_lx,third_long_1_fy,third_long_1_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
							third_long_1_fx = Cut(i,firstx); third_long_1_fy = Cut(i,firsty); third_long_1_lx = Cut(i,lastx); third_long_1_ly = Cut(i,lasty);
						}
					}
				}
			}
			if (chain.substring(i,i+1).equals("2")) {
				if (Length(first_long_2_fx,first_long_2_lx,first_long_2_fy,first_long_2_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
					third_long_2_fx = second_long_2_fx; third_long_2_fy = second_long_2_fy; third_long_2_lx = second_long_2_lx; third_long_2_ly = second_long_2_ly;
					second_long_2_fx = first_long_2_fx; second_long_2_fy = first_long_2_fy; second_long_2_lx = first_long_2_lx; second_long_2_ly = first_long_2_ly;
					first_long_2_fx = Cut(i,firstx); first_long_2_fy = Cut(i,firsty); first_long_2_lx = Cut(i,lastx); first_long_2_ly = Cut(i,lasty);
				} else {
					if (Length(second_long_2_fx,second_long_2_lx,second_long_2_fy,second_long_2_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
						third_long_2_fx = second_long_2_fx; third_long_2_fy = second_long_2_fy; third_long_2_lx = second_long_2_lx; third_long_2_ly = second_long_2_ly;
						second_long_2_fx = Cut(i,firstx); second_long_2_fy = Cut(i,firsty); second_long_2_lx = Cut(i,lastx); second_long_2_ly = Cut(i,lasty);
					} else {
						if (Length(third_long_2_fx,third_long_2_lx,third_long_2_fy,third_long_2_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
							third_long_2_fx = Cut(i,firstx); third_long_2_fy = Cut(i,firsty); third_long_2_lx = Cut(i,lastx); third_long_2_ly = Cut(i,lasty);
						}
					}
				}
			}
			if (chain.substring(i,i+1).equals("3")) {
				if (Length(first_long_3_fx,first_long_3_lx,first_long_3_fy,first_long_3_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
					third_long_3_fx = second_long_3_fx; third_long_3_fy = second_long_3_fy; third_long_3_lx = second_long_3_lx; third_long_3_ly = second_long_3_ly;
					second_long_3_fx = first_long_3_fx; second_long_3_fy = first_long_3_fy; second_long_3_lx = first_long_3_lx; second_long_3_ly = first_long_3_ly;
					first_long_3_fx = Cut(i,firstx); first_long_3_fy = Cut(i,firsty); first_long_3_lx = Cut(i,lastx); first_long_3_ly = Cut(i,lasty);
				} else {
					if (Length(second_long_3_fx,second_long_3_lx,second_long_3_fy,second_long_3_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
						third_long_3_fx = second_long_3_fx; third_long_3_fy = second_long_3_fy; third_long_3_lx = second_long_3_lx; third_long_3_ly = second_long_3_ly;
						second_long_3_fx = Cut(i,firstx); second_long_3_fy = Cut(i,firsty); second_long_3_lx = Cut(i,lastx); second_long_3_ly = Cut(i,lasty);
					} else {
						if (Length(third_long_3_fx,third_long_3_lx,third_long_3_fy,third_long_3_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
							third_long_3_fx = Cut(i,firstx); third_long_3_fy = Cut(i,firsty); third_long_3_lx = Cut(i,lastx); third_long_3_ly = Cut(i,lasty);
						}
					}
				}
			}
			if (chain.substring(i,i+1).equals("4")) {
				if (Length(first_long_4_fx,first_long_4_lx,first_long_4_fy,first_long_4_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
					third_long_4_fx = second_long_4_fx; third_long_4_fy = second_long_4_fy; third_long_4_lx = second_long_4_lx; third_long_4_ly = second_long_4_ly;
					second_long_4_fx = first_long_4_fx; second_long_4_fy = first_long_4_fy; second_long_4_lx = first_long_4_lx; second_long_4_ly = first_long_4_ly;
					first_long_4_fx = Cut(i,firstx); first_long_4_fy = Cut(i,firsty); first_long_4_lx = Cut(i,lastx); first_long_4_ly = Cut(i,lasty);
				} else {
					if (Length(second_long_4_fx,second_long_4_lx,second_long_4_fy,second_long_4_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
						third_long_4_fx = second_long_4_fx; third_long_4_fy = second_long_4_fy; third_long_4_lx = second_long_4_lx; third_long_4_ly = second_long_4_ly;
						second_long_4_fx = Cut(i,firstx); second_long_4_fy = Cut(i,firsty); second_long_4_lx = Cut(i,lastx); second_long_4_ly = Cut(i,lasty);
					} else {
						if (Length(third_long_4_fx,third_long_4_lx,third_long_4_fy,third_long_4_ly) < Length(Cut(i,firstx),Cut(i,lastx),Cut(i,firsty),Cut(i,lasty))) {
							third_long_4_fx = Cut(i,firstx); third_long_4_fy = Cut(i,firsty); third_long_4_lx = Cut(i,lastx); third_long_4_ly = Cut(i,lasty);
						}
					}
				}
			}
			i++;
		}
	}
	public int First_long_1_fx() { return first_long_1_fx; }
	public int First_long_1_fy() { return first_long_1_fy; }
	public int First_long_1_lx() { return first_long_1_lx; }
	public int First_long_1_ly() { return first_long_1_ly; }
	public int First_long_2_fx() { return first_long_2_fx; }
	public int First_long_2_fy() { return first_long_2_fy; }
	public int First_long_2_lx() { return first_long_2_lx; }
	public int First_long_2_ly() { return first_long_2_ly; }
	public int First_long_3_fx() { return first_long_3_fx; }
	public int First_long_3_fy() { return first_long_3_fy; }
	public int First_long_3_lx() { return first_long_3_lx; }
	public int First_long_3_ly() { return first_long_3_ly; }
	public int First_long_4_fx() { return first_long_4_fx; }
	public int First_long_4_fy() { return first_long_4_fy; }
	public int First_long_4_lx() { return first_long_4_lx; }
	public int First_long_4_ly() { return first_long_4_ly; }
	public int Second_long_1_fx() { return second_long_1_fx; }
	public int Second_long_1_fy() { return second_long_1_fy; }
	public int Second_long_1_lx() { return second_long_1_lx; }
	public int Second_long_1_ly() { return second_long_1_ly; }
	public int Second_long_2_fx() { return second_long_2_fx; }
	public int Second_long_2_fy() { return second_long_2_fy; }
	public int Second_long_2_lx() { return second_long_2_lx; }
	public int Second_long_2_ly() { return second_long_2_ly; }
	public int Second_long_3_fx() { return second_long_3_fx; }
	public int Second_long_3_fy() { return second_long_3_fy; }
	public int Second_long_3_lx() { return second_long_3_lx; }
	public int Second_long_3_ly() { return second_long_3_ly; }
	public int Second_long_4_fx() { return second_long_4_fx; }
	public int Second_long_4_fy() { return second_long_4_fy; }
	public int Second_long_4_lx() { return second_long_4_lx; }
	public int Second_long_4_ly() { return second_long_4_ly; }
	public int Third_long_1_fx() { return third_long_1_fx; }
	public int Third_long_1_fy() { return third_long_1_fy; }
	public int Third_long_1_lx() { return third_long_1_lx; }
	public int Third_long_1_ly() { return third_long_1_ly; }
	public int Third_long_2_fx() { return third_long_2_fx; }
	public int Third_long_2_fy() { return third_long_2_fy; }
	public int Third_long_2_lx() { return third_long_2_lx; }
	public int Third_long_2_ly() { return third_long_2_ly; }
	public int Third_long_3_fx() { return third_long_3_fx; }
	public int Third_long_3_fy() { return third_long_3_fy; }
	public int Third_long_3_lx() { return third_long_3_lx; }
	public int Third_long_3_ly() { return third_long_3_ly; }
	public int Third_long_4_fx() { return third_long_4_fx; }
	public int Third_long_4_fy() { return third_long_4_fy; }
	public int Third_long_4_lx() { return third_long_4_lx; }
	public int Third_long_4_ly() { return third_long_4_ly; }
	private void First_1() {
		int i = 0;
		boolean end = false;
		while ((end == false) && (i < chain.length())) {
			if (chain.substring(i,i+1).equals("1")) {
				first_1_fx = Cut(i,firstx);
				first_1_fy = Cut(i,firsty);
				first_1_lx = Cut(i,lastx);
				first_1_ly = Cut(i,lasty);
				end  = true;
			}
			i++;
		}
	}
	public int First_1_fx() { return first_1_fx; }
	public int First_1_fy() { return first_1_fy; }
	public int First_1_lx() { return first_1_lx; }
	public int First_1_ly() { return first_1_ly; }
	private void First_2() {
		int i = 0;
		boolean end = false;
		while ((end == false) && (i < chain.length())) {
			if (chain.substring(i,i+1).equals("2")) {
				first_2_fx = Cut(i,firstx);
				first_2_fy = Cut(i,firsty);
				first_2_lx = Cut(i,lastx);
				first_2_ly = Cut(i,lasty);
				end  = true;
			}
			i++;
		}
	}
	public int First_2_fx() { return first_2_fx; }
	public int First_2_fy() { return first_2_fy; }
	public int First_2_lx() { return first_2_lx; }
	public int First_2_ly() { return first_2_ly; }
	private void First_3() {
		int i = 0;
		boolean end = false;
		while ((end == false) && (i < chain.length())) {
			if (chain.substring(i,i+1).equals("3")) {
				first_3_fx = Cut(i,firstx);
				first_3_fy = Cut(i,firsty);
				first_3_lx = Cut(i,lastx);
				first_3_ly = Cut(i,lasty);
				end  = true;
			}
			i++;
		}
	}
	public int First_3_fx() { return first_3_fx; }
	public int First_3_fy() { return first_3_fy; }
	public int First_3_lx() { return first_3_lx; }
	public int First_3_ly() { return first_3_ly; }
	private void First_4() {
		int i = 0;
		boolean end = false;
		while ((end == false) && (i < chain.length())) {
			if (chain.substring(i,i+1).equals("4")) {
				first_4_fx = Cut(i,firstx);
				first_4_fy = Cut(i,firsty);
				first_4_lx = Cut(i,lastx);
				first_4_ly = Cut(i,lasty);
				end  = true;
			}
			i++;
		}
	}
	public int First_4_fx() { return first_4_fx; }
	public int First_4_fy() { return first_4_fy; }
	public int First_4_lx() { return first_4_lx; }
	public int First_4_ly() { return first_4_ly; }
	private void Last() {
		int i1 = 0, i2 = 0, i3 = 0, i4 = 0, j = 0;
		boolean have1 = false, have2 = false, have3 = false, have4 = false;
		while (j < chain.length()) {
			if (chain.substring(j,j+1).equals("1")) {
				i1 = j;
				have1 = true;
			}
			if (chain.substring(j,j+1).equals("2")) {
				i2 = j;
				have2 = true;
			}
			if (chain.substring(j,j+1).equals("3")) {
				i3 = j;
				have3 = true;
			}
			if (chain.substring(j,j+1).equals("4")) {
				i4 = j;
				have4 = true;
			}
			j++;
		}
		if (have1) {
			last_1_fx = Cut(i1,firstx);
			last_1_fy = Cut(i1,firsty);
			last_1_lx = Cut(i1,lastx);
			last_1_ly = Cut(i1,lasty);
		}
		if (have2) {
			last_2_fx = Cut(i2,firstx);
			last_2_fy = Cut(i2,firsty);
			last_2_lx = Cut(i2,lastx);
			last_2_ly = Cut(i2,lasty);
		}
		if (have3) {
			last_3_fx = Cut(i3,firstx);
			last_3_fy = Cut(i3,firsty);
			last_3_lx = Cut(i3,lastx);
			last_3_ly = Cut(i3,lasty);
		}
		if (have4) {
			last_4_fx = Cut(i4,firstx);
			last_4_fy = Cut(i4,firsty);
			last_4_lx = Cut(i4,lastx);
			last_4_ly = Cut(i4,lasty);
		}
	}
	public int Last_1_fx() { return last_1_fx; }
	public int Last_1_fy() { return last_1_fy; }
	public int Last_1_lx() { return last_1_lx; }
	public int Last_1_ly() { return last_1_ly; }
	public int Last_2_fx() { return last_2_fx; }
	public int Last_2_fy() { return last_2_fy; }
	public int Last_2_lx() { return last_2_lx; }
	public int Last_2_ly() { return last_2_ly; }
	public int Last_3_fx() { return last_3_fx; }
	public int Last_3_fy() { return last_3_fy; }
	public int Last_3_lx() { return last_3_lx; }
	public int Last_3_ly() { return last_3_ly; }
	public int Last_4_fx() { return last_4_fx; }
	public int Last_4_fy() { return last_4_fy; }
	public int Last_4_lx() { return last_4_lx; }
	public int Last_4_ly() { return last_4_ly; }
	private void Line1() {
		if (chain.length() >= 2) { line = Cut(1,firsty) ; }
	}
	public int Line() { return line; }
	private void Write1() {
		String a = "";
		int a1 = 0;
		if (chain.length() >= 4) { 
			a = chain.substring(1);
			a1 = a.indexOf("s");
			writey = Cut(a1+2,firsty); writex = Cut(a1+2,firstx); 
		}
	}
	public int Write() { return writey; }
	public int Writex() { return writex; }
	private int Cut(int j, String all) {
		int i = 0, i1 = 0, i2 = 0;
		String position;
		boolean check = false;
		while (j != 0) {
			check = false;
			while (check == false) {
				if (all.substring(i,i+1).equals(",")) {
					check = true;
				}
				i++;
			}
			j = j - 1;
		}
		i1 = i;
		check = false;
		while (check == false) {
			if (all.substring(i,i+1).equals(",")) {
				check = true;
			}
			i++;
		}
		i2 = i - 1;
		position = all.substring(i1,i2);
		return Integer.parseInt(position);
	}
	public double Length(int x1, int x2, int y1, int y2) {
		return Math.sqrt(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)));
	}
}
