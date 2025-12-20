import java.io.*;

import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.BaseFont;

public class StringToPDF {
	
	public StringToPDF() {}
	
   private static String UnicodeFromChar(char val) {
			byte[] tmp = new byte[1];
			tmp[0] = (byte)val;
			if(val == 10) return "\n";
			else if(val == 13 ) return "\r";
			else if(val == 92 ) return "\\\\";
			else if(val == 34 ) return "\\\"";
			else if(val < 32 || val > 126) return new String(tmp,14);
			else return String.valueOf(val);
	}

	private static String UnicodeFromString(String s) {
		String result = "";
		char v;
		for (int i = 0;i<s.length();i++ )
		{
			v = s.charAt(i);
			result += UnicodeFromChar(v);
		}
		return result;
	}
	
	public static void createPDF(String filename,String data) {
		Document document = new Document();
		try { 
      	PdfWriter.getInstance(document, new FileOutputStream(filename));
         document.open();
			BaseFont tohoma = BaseFont.createFont("tahoma.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			Font font = new Font(tohoma, 14, Font.NORMAL);
			Font fonts = new Font();
			fonts = FontFactory.getFont(FontFactory.COURIER, Font.DEFAULTSIZE, Font.NORMAL);
         document.add(new Paragraph(UnicodeFromString(data),font));
        } catch(DocumentException de) {
            System.err.println(de.getMessage());
        } catch(IOException ioe) {
            System.err.println(ioe.getMessage());
        }
        document.close();
	}
	 
} // End of class