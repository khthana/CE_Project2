
package net;

import java.io.IOException;
import java.io.InputStream;
import java.io.ByteArrayInputStream;

import java.util.Hashtable;
import java.util.Enumeration;

public class RFC822Head {
    Hashtable fields;

    public RFC822Head() {
	fields = new Hashtable();
    }

    public RFC822Head(String head) throws IOException {
	this(new ByteArrayInputStream(head.getBytes()));
    }

    public RFC822Head(InputStream in) throws IOException {
	fields = new Hashtable();

        StringBuffer lineBuf        = new StringBuffer();
	String       lastHeaderName = null;
	int c;

        while(true) {
	    c = in.read();
	    if(c == -1)
		throw new IOException("RFC822Head: corrupt header, input stream closed");
	    if(c == '\n')
	       continue;
            if(c != '\r') {
                lineBuf.append((char)c); 
            } else {
                if(lineBuf.length() != 0) {
		    String line = lineBuf.toString();
		    lastHeaderName = processLine(line, lastHeaderName);
		    lineBuf.setLength(0);
                } else {
                    break;
		}
            }
	}
	/* Strip the last \n */
	c = in.read();
    }

    private final String processLine(String line, String lastHeaderName)
	throws IOException
    {
	String name, value;
	char c = line.charAt(0);
	if(c == ' ' || c == '\t') {
	    name  = lastHeaderName;
	    value = getHeaderField(lastHeaderName) + " " + line.trim();
	} else {
	    int n = line.indexOf(':');
	    if(n == -1)
		throw new IOException("RFC822Head: corrupt header-field: '" + line + "'");
	    name  = line.substring(0, n).toLowerCase();
	    value = line.substring(n + 1).trim();
	}

	setHeaderField(name, value);
	return name;
    }

    public Hashtable getHeaderFields() {
	return fields;
    }

    public Enumeration getHeaderFieldNames() {
	return fields.keys();
    }

    public String getHeaderField(String headerName) {
	return (String)fields.get(headerName.toLowerCase());
    }

    public void setHeaderField(String headerName, String value) {
	fields.put(headerName.toLowerCase(), value);
    }

    public String toString() {
	String fullHeader = "";
	Enumeration headerNames = fields.keys();
	while(headerNames.hasMoreElements()) {
	    String fieldName = (String)headerNames.nextElement();
	    fullHeader += fieldName + ": " + fields.get(fieldName) + "\r\n";
	}
	fullHeader += "\r\n";
	return fullHeader;
    }

    public static String extractParamValue(String line, String paramName) {
	int    index = line.indexOf(paramName);
	String value = null;
	if(index != -1) {
	    line  = line.substring(index + paramName.length());
	    index = line.indexOf('=');
	    if(index != -1) {
		line  = line.substring(index + 1);
		index = line.indexOf(';');
		if(index != -1) {
		    line = line.substring(0, index);
		}
		line = line.trim();
		if(line.startsWith("\"") && line.endsWith("\"")) {
		    line = line.substring(1, line.length() - 1);
		}
		value = line;
	    }
	}
	return value;
    }
}
