package util;

public final class Util {
    
    private static boolean isNetscapeJava = false;
    private static boolean isInitiated = false;
    
    public static boolean isNetscapeJava() {
        if (isInitiated == false) {
            isInitiated = true;
            try {
                String v = System.getProperty("java.vendor");
                isNetscapeJava = ( v != null && v.startsWith("Netscape") );
            } catch (Throwable t) {
            }
        }        
        return isNetscapeJava;
    }
}

