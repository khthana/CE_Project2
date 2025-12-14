package myutil;
import java.io.*;

public class thaiLanguage 
{
	/** Creates a new instance of CharsetConverter */
    public thaiLanguage() {
    }
    public static String convertToUnicode(String ascii) 
	{
		String unicode = new String("");    
	
		for(int i=0;i<ascii.length();i++) 
		{
			unicode = unicode + "&#" + (int)ascii.charAt(i) + ";";
		}
		return unicode;
	}
    public static String MS874ToUnicode(String _in) {
        StringBuffer strTemp = new StringBuffer(_in);
        int code;
        for (int i = 0; i < _in.length(); i++) {
            code = (int) strTemp.charAt(i);
            if ((0xA1 <= code) && (code <= 0xFB)) {
                strTemp.setCharAt(i, (char) (code + 0xD60));
            }
        }
        
        return strTemp.toString();
    }
    public static String UnicodeToMS874(String _in) {
        StringBuffer strTemp = new StringBuffer(_in);
        int code;
        for (int i = 0; i < _in.length(); i++) {
            code = (int) strTemp.charAt(i);
            if ((0xE01 <= code) && (code <= 0xE5B)) {
                strTemp.setCharAt(i, (char) (code - 0xD60));
            }
        }
        
        return strTemp.toString();
    }
}
