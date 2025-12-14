import java.io.*;

public class Check {
	boolean found = false;
	String t = "";
	String s3 = "";
	String s2 = "";
	String s1 = "";
	String s ;
	FileInputStream fin;
	BufferedInputStream bin;
	DataInputStream din;
	Check(String chain) {
		s2 = chain;
		int pointer = 0;
		try { fin = new FileInputStream("T.txt"); } catch ( IOException e ) {}
		bin = new BufferedInputStream(fin);
		din = new DataInputStream(bin);
		try { s = din.readLine(); } catch ( IOException e ) {}
		while (s != null) {
			s3 = s.substring(0,s.indexOf(":")-1);
			if (s3.equals(s2)) {
				s1 = s1 + s.substring(s.lastIndexOf(":")+1,s.length()-1);
				found = true;
			}
			try { s = din.readLine(); } catch ( IOException e ) {}
		}
		try { din.close(); } catch ( IOException e ) {}
	}
	public void Feture(String firstx, String firsty, String lastx, String lasty) {
		String tmp = "";
		String stmp = "";
		int i = 1;
		boolean yes = false;
//		Feture F = new Feture(firstx,firsty,lastx,lasty,s2);
		Code code = new Code(firstx,firsty,lastx,lasty,s2);
//		if (s2.substring(0,1).equals("s")) {
//		} else {
			while (i <= s1.length()-5) {
				yes = false;
				tmp = s1.substring(i,i+6);
//////////////////////////////////////////////
// ñ
				if (tmp.equals("Char01")) {
					if ( code.f03() && code.f12() && code.f60() ) { yes = false; } else { yes = true; }
				}
// ò
				if (tmp.equals("Char02")) {
					if ( code.f40() && code.f05() ) { yes = false; } else { yes = true; }
				}
// ó
				if (tmp.equals("Char03")) {
					if ( /*code.f18() &&*/ code.f01() && code.f39() && code.f12() && code.f72() ) { yes = false; } else { yes = true; }
				}
// ô
				if (tmp.equals("Char04")) {
					if ( code.f53() ) { yes = false; } else { yes = true; }
				}
// õ
				if (tmp.equals("Char05")) {
				}
// ö
				if (tmp.equals("Char06")) {
					if ( code.f05() && code.f51() && code.f09() && code.f15() ) { yes = false; } else { yes = true; }
				}
// ÷
				if (tmp.equals("Char07")) {
					if ( code.f05() && code.f23() && code.f33() && code.f39() && code.f41() && code.f42() ) { yes = false; } else { yes = true; }
				}
// ø
				if (tmp.equals("Char08")) {
					if ( code.f24() ) { yes = false; } else { yes = true; }
				}
// ù
				if (tmp.equals("Char09")) {
					if ( code.f05() && code.f39() && code.f43() ) { yes = false; } else { yes = true; }
				}
// ð
				if (tmp.equals("Char10")) {
					if ( code.f04() ) { yes = false; } else { yes = true; }
				}
// ¡
				if (tmp.equals("Char11")) {
					if ( code.f01() && code.f04() && code.f07() ) { yes = false; } else { yes = true; }
				}
// ¢
				if (tmp.equals("Char12")) {
					if ( code.f11() && code.f38() && code.f36() && code.f21() ) { yes = false; } else { yes = true; }
				}
// £
				if (tmp.equals("Char13")) {
					if ( code.f34() && code.f31() && code.f21() && code.f36() && code.f38()) { yes = false; } else { yes = true; }
				}
// ¤
				if (tmp.equals("Char14")) {
					if ( code.f06() && code.f20() && code.f01() && code.f12() ) { yes = false; } else { yes = true; }
				}
// ¥
				if (tmp.equals("Char15")) {
					if ( code.f20() ) { yes = false; } else { yes = true; }
				}
// ¦
				if (tmp.equals("Char16")) {
					if ( code.f38() && code.f14() && code.f11() && code.f48() ) { yes = false; } else { yes = true; }
				}
// §
				if (tmp.equals("Char17")) {
					if ( code.f09() && code.f06() && code.f59() && code.f13() ) { yes = false; } else { yes = true; }
				}
// ¨
				if (tmp.equals("Char18")) {
					if ( code.f40() && code.f73() && code.f14() ) { yes = false; } else { yes = true; }
				}
// ©
				if (tmp.equals("Char19")) {
				}
// ª
				if (tmp.equals("Char20")) {
					if ( code.f11() && code.f23() && code.f38() && code.f36() && code.f41() ) { yes = false; } else { yes = true; }
				}
// «
				if (tmp.equals("Char21")) {
					if ( code.f11() && code.f23() && code.f31() && code.f36() && code.f38() ) { yes = false; } else { yes = true; }
				}
// ¬
				if (tmp.equals("Char22")) {
				}
// ­
				if (tmp.equals("Char23")) {
				}
// ®
				if (tmp.equals("Char24")) {
				}
// ¯
				if (tmp.equals("Char25")) {
				}
// °
				if (tmp.equals("Char26")) {
				}
// ±
				if (tmp.equals("Char27")) {
					if ( code.f14() && code.f45() && code.f12() && code.f38() ) { yes = false; } else { yes = true; }
				}
// ²
				if (tmp.equals("Char28")) {
					if ( code.f47() ) { yes = false; } else { yes = true; }
				}
// ³
				if (tmp.equals("Char29")) {
				}
// ´
				if (tmp.equals("Char30")) {
					if ( code.f13() && code.f01() && code.f06() && code.f20() && code.f16() && code.f12() && code.f10() ) { yes = false; } else { yes = true; }
				}
// µ
				if (tmp.equals("Char31")) {
					if ( code.f13() && code.f01() && code.f16() ) { yes = false; } else { yes = true; }
				}
// ¶
				if (tmp.equals("Char32")) {
					if ( code.f08() && code.f15() && code.f50() && code.f01() && code.f71() ) { yes = false; } else { yes = true; }
				}
// ·
				if (tmp.equals("Char33")) {
					if ( code.f14() && code.f12() && code.f45() && code.f38() ) { yes = false; } else { yes = true; }
				}
// ¸
				if (tmp.equals("Char34")) {
					if ( code.f53() ) { yes = false; } else { yes = true; }
				}
// ¹
				if (tmp.equals("Char35")) {
					if ( code.f11() && code.f26() && code.f21() && code.f49() && code.f68() ) { yes = false; } else { yes = true; }
				}
// º
				if (tmp.equals("Char36")) {
					if ( code.f21() && code.f37() && code.f31() ) { yes = false; } else { yes = true; }
				}
// »
				if (tmp.equals("Char37")) {
					if ( code.f23() && code.f37() && code.f38() ) { yes = false; } else { yes = true; }
				}
// ¼
				if (tmp.equals("Char38")) {
					if ( code.f11() && code.f21() && code.f10() ) { yes = false; } else { yes = true; }
				}
// ½
				if (tmp.equals("Char39")) {
					if ( code.f11() && code.f23() && code.f10() ) { yes = false; } else { yes = true; }
				}
// ¾
				if (tmp.equals("Char40")) {
					if ( code.f21() && code.f30() && code.f38() && code.f14() && code.f67() && code.f70() ) { yes = false; } else { yes = true; }
				}
// ¿
				if (tmp.equals("Char41")) {
					if ( code.f05() && code.f23() && code.f30() && code.f32() ) { yes = false; } else { yes = true; }
				}
// À
				if (tmp.equals("Char42")) {
					if ( code.f01() ) { yes = false; } else { yes = true; }
				}
// Á
				if (tmp.equals("Char43")) {
					if ( code.f11() && code.f21() && code.f25() && code.f27() && code.f28() && code.f69() ) { yes = false; } else { yes = true; }
				}
// Â
				if (tmp.equals("Char44")) {
				}
// Ã
				if (tmp.equals("Char45")) {
					if ( code.f29() && code.f51() && code.f54() && code.f15() && code.f10() ) { yes = false; } else { yes =true; }
				}
// Å 
				if (tmp.equals("Char46")) {
					if ( code.f74() && code.f30() && code.f58() ) { yes = false; } else { yes = true; }
				}
// Ç
				if (tmp.equals("Char47")) {
					if ( code.f05() && code.f52() && code.f15() ) { yes = false; } else { yes = true; }
				}
// È
				if (tmp.equals("Char48")) {
				}
// É
				if (tmp.equals("Char49")) {
				}
// Ê
				if (tmp.equals("Char50")) {
					if ( code.f39() && code.f57() ) { yes = false; } else { yes = true; }
				}
// Ë
				if (tmp.equals("Char51")) {
					if ( code.f12() ) { yes = false; } else { yes = true; }
				}
// Ì
				if (tmp.equals("Char52")) {
					if ( code.f30() ) { yes = false; } else { yes = true; }
				}
// Í
				if (tmp.equals("Char53")) {
					if ( code.f05() && code.f09() && code.f55() && code.f16() ) { yes = false; } else { yes = true; }
				}
// Î
				if (tmp.equals("Char54")) {
					if ( code.f56() && code.f10() && code.f16() ) { yes = false; } else { yes = true; }
				}
// Ð
				if (tmp.equals("Char55")) {
				}
// Ò
				if (tmp.equals("Char56")) {
					if ( code.f06() && code.f10() && code.f12() ) { yes = false; } else { yes = true; }
				}
// Ô
				if (tmp.equals("Char57")) {
					if ( code.f61() && code.f63() && code.f66() ) { yes = false; } else { yes = true; }
				}
// Õ
				if (tmp.equals("Char58")) {
					if ( code.f61() && code.f65() && code.f63() ) { yes = false; } else { yes = true; }
				}
// Ö
				if (tmp.equals("Char59")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// ×
				if (tmp.equals("Char60")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// Ø
				if (tmp.equals("Char61")) {
					if ( code.f62() ) { yes = false; } else { yes = true; }
				}
// Ù
				if (tmp.equals("Char62")) {
					if ( code.f62() ) { yes = false; } else { yes = true; }
				}
// ì
				if (tmp.equals("Char63")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// è
				if (tmp.equals("Char64")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// é
				if (tmp.equals("Char65")) {
					if ( code.f61() && code.f64() ) { yes = false; } else { yes = true; }
				}
// ê
				if (tmp.equals("Char66")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// ë
				if (tmp.equals("Char67")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// ç
				if (tmp.equals("Char68")) {
					if ( code.f61() ) { yes = false; } else { yes = true; }
				}
// Ñ
				if (tmp.equals("Char69")) {
					if ( code.f61() && code.f64() ) { yes = false; } else { yes = true; }
				}
// Ó
				if (tmp.equals("Char70")) {
				}
// Ä
				if (tmp.equals("Char71")) {
					if ( code.f03() ) { yes = false; } else { yes = true; }
				}
// Æ
				if (tmp.equals("Char72")) {
					if ( code.f03() ) { yes = false; } else { yes = true; }
				}
// ã
				if (tmp.equals("Char73")) {
				}
// ä
				if (tmp.equals("Char74")) {
					if ( code.f31() ) { yes = false; } else { yes = true; }
				}
// â
				if (tmp.equals("Char75")) {
					if ( code.f49() ) { yes = false; } else { yes = true; }
				}
// à
				if (tmp.equals("Char76")) {
					if ( code.f05() ) { yes = false; } else { yes = true; }
				}
// á
				if (tmp.equals("Char77")) {
				}
// æ
				if (tmp.equals("Char78")) {
					if ( code.f03() && code.f38() && code.f12() ) { yes = false; } else { yes = true; }
				}
// Ï
				if (tmp.equals("Char79")) {
					if ( code.f06() && code.f10() && code.f50() ) { yes = false; } else { yes = true; }
				}
//////////////////////////////////////////////
				if (yes == false) {
					stmp = stmp + " " + tmp;
				}
				i = i + 7;
			}
//		}
		s1 = stmp;
	}
	public String Send_Char() {
		String data = "";
		String tmp = "";
		int i = 1;
		while (i <= s1.length()-5) {
			tmp = s1.substring(i,i+6);
			change(tmp);
			data = data + t;
			i = i + 7;
		}
		return data;
	}
//	private void check(String tm, String firstx, String firsty, String lastx, String lasty) {
//		String fx = "", fy = "", lx = "", ly = "";
//		fx = firstx.substring(0,firstx.indexOf(","));
//		fy = firsty.substring(0,firsty.indexOf(","));
//		lx = lastx.substring(lastx.lastIndexOf(",")+1,lastx.length());
//		ly = lasty.substring(lasty.lastIndexOf(",")+1,lasty.length());
//		if (tm.equals("Char11")) { 
//			if (Math.abs(Integer.parseInt(fy)-Integer.parseInt(ly)) <= 50) { yes = true; }
//		}
//		if (tm.equals("Char56")) { 
//			if (Math.abs(Integer.parseInt(fy)-Integer.parseInt(ly)) > 50) { yes = true; }
//		}
//	}
	private void change(String tm) {
		if (tm.equals("Char01")) { t = "ñ"; }
		if (tm.equals("Char02")) { t = "ò"; }
		if (tm.equals("Char03")) { t = "ó"; }
		if (tm.equals("Char04")) { t = "ô"; }
		if (tm.equals("Char05")) { t = "õ"; }
		if (tm.equals("Char06")) { t = "ö"; }
		if (tm.equals("Char07")) { t = "÷"; }
		if (tm.equals("Char08")) { t = "ø"; }
		if (tm.equals("Char09")) { t = "ù"; }
		if (tm.equals("Char10")) { t = "ð"; }
		if (tm.equals("Char11")) { t = "¡"; }
		if (tm.equals("Char12")) { t = "¢"; }
		if (tm.equals("Char13")) { t = "£"; }
		if (tm.equals("Char14")) { t = "¤"; }
		if (tm.equals("Char15")) { t = "¥"; }
		if (tm.equals("Char16")) { t = "¦"; }
		if (tm.equals("Char17")) { t = "§"; }
		if (tm.equals("Char18")) { t = "¨"; }
		if (tm.equals("Char19")) { t = "©"; }
		if (tm.equals("Char20")) { t = "ª"; }
		if (tm.equals("Char21")) { t = "«"; }
		if (tm.equals("Char22")) { t = "¬"; }
		if (tm.equals("Char23")) { t = "­"; }
		if (tm.equals("Char24")) { t = "®"; }
		if (tm.equals("Char25")) { t = "¯"; }
		if (tm.equals("Char26")) { t = "°"; }
		if (tm.equals("Char27")) { t = "±"; }
		if (tm.equals("Char28")) { t = "²"; }
		if (tm.equals("Char29")) { t = "³"; }
		if (tm.equals("Char30")) { t = "´"; }
		if (tm.equals("Char31")) { t = "µ"; }
		if (tm.equals("Char32")) { t = "¶"; }
		if (tm.equals("Char33")) { t = "·"; }
		if (tm.equals("Char34")) { t = "¸"; }
		if (tm.equals("Char35")) { t = "¹"; }
		if (tm.equals("Char36")) { t = "º"; }
		if (tm.equals("Char37")) { t = "»"; }
		if (tm.equals("Char38")) { t = "¼"; }
		if (tm.equals("Char39")) { t = "½"; }
		if (tm.equals("Char40")) { t = "¾"; }
		if (tm.equals("Char41")) { t = "¿"; }
		if (tm.equals("Char42")) { t = "À"; }
		if (tm.equals("Char43")) { t = "Á"; }
		if (tm.equals("Char44")) { t = "Â"; }
		if (tm.equals("Char45")) { t = "Ã"; }
		if (tm.equals("Char46")) { t = "Å"; }
		if (tm.equals("Char47")) { t = "Ç"; }
		if (tm.equals("Char48")) { t = "È"; }
		if (tm.equals("Char49")) { t = "É"; }
		if (tm.equals("Char50")) { t = "Ê"; }
		if (tm.equals("Char51")) { t = "Ë"; }
		if (tm.equals("Char52")) { t = "Ì"; }
		if (tm.equals("Char53")) { t = "Í"; }
		if (tm.equals("Char54")) { t = "Î"; }
		if (tm.equals("Char55")) { t = "Ð"; }
		if (tm.equals("Char56")) { t = "Ò"; }
		if (tm.equals("Char57")) { t = "Ô"; }
		if (tm.equals("Char58")) { t = "Õ"; }
		if (tm.equals("Char59")) { t = "Ö"; }
		if (tm.equals("Char60")) { t = "×"; }
		if (tm.equals("Char61")) { t = "Ø"; }
		if (tm.equals("Char62")) { t = "Ù"; }
		if (tm.equals("Char63")) { t = "ì"; }
		if (tm.equals("Char64")) { t = "è"; }
		if (tm.equals("Char65")) { t = "é"; }
		if (tm.equals("Char66")) { t = "ê"; }
		if (tm.equals("Char67")) { t = "ë"; }
		if (tm.equals("Char68")) { t = "ç"; }
		if (tm.equals("Char69")) { t = "Ñ"; }
		if (tm.equals("Char70")) { t = "Ó"; }
		if (tm.equals("Char71")) { t = "Ä"; }
		if (tm.equals("Char72")) { t = "Æ"; }
		if (tm.equals("Char73")) { t = "ã"; }
		if (tm.equals("Char74")) { t = "ä"; }
		if (tm.equals("Char75")) { t = "â"; }
		if (tm.equals("Char76")) { t = "à"; }
		if (tm.equals("Char77")) { t = "á"; }
		if (tm.equals("Char78")) { t = "æ"; }
		if (tm.equals("Char79")) { t = "Ï"; }
		t = t + " ";
	}
}
