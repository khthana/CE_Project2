
package util;

public final class StringUtil {

    static final String[] byteUnits = { "Bytes", "kB", "MB", "GB", "TB" };

    public static String trimLeft(String str) {
	char[] val = str.toCharArray();
	int st = 0;
	while ((st < val.length) && (val[st] <= ' ')) {
	    st++;
	}
	return str.substring(st);
    }

    public static String trimRight(String str) {
	char[] val = str.toCharArray();
	int    end = val.length;
	while ((end > 0) && (val[end - 1] <= ' ')) {
	    end--;
	}
	return str.substring(0, end);
    }

    public static String nBytesToString(long nBytes, int digits) {
	int ix = 0;
	int thresh = 10;
	while(--digits > 0) {
	    thresh *= 10;
	}
	while(nBytes >= thresh) {
	    ix++;
	    nBytes >>>= 10;
	}
	return nBytes + " " + byteUnits[ix];
    }

}

