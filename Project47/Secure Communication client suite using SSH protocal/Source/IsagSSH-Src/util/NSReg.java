
package util;

import java.io.RandomAccessFile;
import java.io.IOException;

import java.util.StringTokenizer;
import java.util.Vector;
import java.util.Enumeration;

public class NSReg {

    public final static int MAGIC_NUMBER  = 0x76644441;
    public final static int MAJOR_VERSION = 1;
    public final static int MINOR_VERSION = 2;
    public final static int HDR_SIZE      = 128;

    // javac 1.1, does not like these in inner class
    public final static int REGTYPE_KEY               = 1;
    public final static int REGTYPE_DELETED           = 0x0080;
    public final static int REGTYPE_ENTRY             = 0x0010;
    public final static int REGTYPE_ENTRY_STRING_UTF  = (REGTYPE_ENTRY + 1);
    public final static int REGTYPE_ENTRY_INT32_ARRAY = (REGTYPE_ENTRY + 2);
    public final static int REGTYPE_ENTRY_BYTES       = (REGTYPE_ENTRY + 3);
    public final static int REGTYPE_ENTRY_FILE        = (REGTYPE_ENTRY + 4);

    public class Entry {

	public int location; /* this object's offset (for verification) */
	public int name;     /* name string */
	public int namelen;  /* length of name string (including terminator) */
	public int type;     /* node type (key, or entry style) */
	public int left;     /* next object at this level (0 if none) */
	public int down;     /* KEY: first subkey        VALUE: 0 */
	public int value;    /* KEY: first entry object  VALUE: value string */
	public int valuelen; /* KEY: 0  VALUE: length of value data */
	public int valuebuf; /* KEY: 0  VALUE: length available */
	public int parent;   /* the node on the immediate level above */

	private Vector subKeys;
	private Vector values;

	public Entry(int offset) throws IOException {
	    this(offset, true);
	}

	private Entry(int offset, boolean doScan) throws IOException {
	    file.seek(offset);
	    location = readInt();
	    name     = readInt();
	    namelen  = readShort();
	    type     = readShort();
	    left     = readInt();
	    down     = readInt();
	    value    = readInt();
	    valuelen = readInt();
	    valuebuf = readInt();
	    parent   = readInt();
	    if(doScan && type == REGTYPE_KEY) {
		scanElements();
	    }
	}

	private void scanElements() throws IOException {
	    subKeys = new Vector();
	    Entry k = down(false);
	    while(k != null) {
		subKeys.addElement(k.name());
		k = k.left(false);
	    }
	    values = new Vector();
	    Entry v = value();
	    while(v != null) {
		values.addElement(v.name());
		v = v.left(false);
	    }
	}

	public Enumeration subKeys() {
	    return subKeys.elements();
	}

	public Enumeration values() {
	    return values.elements();
	}

	public String name() throws IOException {
	    byte[] buf = new byte[namelen - 1]; // strip trailing zero
	    file.seek(name);
	    file.readFully(buf);
	    return new String(buf);
	}

	public String valueAsString() throws IOException {
	    if(type != REGTYPE_ENTRY_STRING_UTF) {
		throw new IOException("Not a UTF8 value: " + name());
	    }
	    byte[] buf = new byte[valuelen - 1]; // strip trailing zero
	    file.seek(value);
	    file.readFully(buf);
	    return new String(buf, "UTF8");
	}

	public Entry left() throws IOException {
	    return left(true);
	}

	private Entry left(boolean doScan) throws IOException {
	    Entry le = null;
	    if(left > 0) {
		le = new Entry(left, doScan);
	    }
	    return le;
	}

	public Entry down() throws IOException {
	    return down(true);
	}

	public Entry down(boolean doScan) throws IOException {
	    Entry de = null;
	    if(down > 0) {
		de = new Entry(down, doScan);
	    }
	    return de;
	}

	public Entry value() throws IOException {
	    Entry ve = null;
	    if(value > 0) {
		ve = new Entry(value);
	    }
	    return ve;
	}

	public Entry getKey(String key) throws IOException {
	    Entry e = down();
	    if(e != null) {
		e = e.getObject(key);
	    }
	    return e;
	}

	public Entry getValue(String key) throws IOException {
	    Entry e = value();
	    if(e != null) {
		e = e.getObject(key);
	    }
	    return e;
	}

	public Entry getObject(String key) throws IOException {
	    Entry node = this;
	    do {
		if(node.name().equals(key)) {
		    break;
		}
	    } while((node = node.left()) != null);
	    return node;
	}

    }

    private RandomAccessFile file;
    private int              root;
    private int              avail;

    public final int readShort() throws IOException {
	int b1 = file.read();
	int b2 = file.read();
	return ((b2 << 8) + (b1 << 0));
    }

    public final int readInt() throws IOException {
	int b1 = file.read();
	int b2 = file.read();
	int b3 = file.read();
	int b4 = file.read();
	return ((b4 << 24) + (b3 << 16) + (b2 << 8) + (b1 << 0));
    }

    public void load(String fileName) throws IOException {
	this.file    = new RandomAccessFile(fileName, "r");
	int magic    = readInt();
	int verMajor = readShort();
	int verMinor = readShort();
	if(magic != MAGIC_NUMBER || verMajor != 1) {
	    throw new IOException("Invalid nsreg file");
	}
	this.avail   = readInt();
	this.root    = readInt();
    }

    public Entry root() throws IOException {
	return new Entry(root);
    }

    public Entry get(String key) throws IOException {
	if(key.startsWith("/")) {
	    key = key.substring(1);
	}
	if(key.length() == 0) {
	    return root();
	}
	StringTokenizer st   = new StringTokenizer(key, "/");
	Entry           node = root();
	while(st.hasMoreTokens() && node != null) {
	    String subKey = st.nextToken();
	    node = node.getKey(subKey);
	}
	return node;
    }

    public void printTree() throws IOException {
	printSubTree(root(), "");
    }

    public static void printSubTree(Entry node) throws IOException {
	printSubTree(node, "/");
    }

    private static void printSubTree(Entry node, String prefix)
	throws IOException
    {
	prefix = prefix + "/" + node.name();
	if(prefix.startsWith("//")) {
	    prefix = prefix.substring(1);
	}
	Enumeration values = node.values();
	while(values.hasMoreElements()) {
	    String v         = (String)values.nextElement();
	    Entry  valEntry  = node.getValue(v);
	    String valString = (valEntry.type ==
				REGTYPE_ENTRY_STRING_UTF ?
				valEntry.valueAsString() :
				("REGTYPE-" + valEntry.type));
	    System.out.println(prefix + ":" + v + " = " + valString);
	}
	Enumeration keys = node.subKeys();
	while(keys.hasMoreElements()) {
	    String k = (String)keys.nextElement();
	    printSubTree(node.getKey(k), prefix);
	}
    }

    public static void main(String[] argv) {
	try {
	    NSReg  reg  = new NSReg();
	    String file = argv[0];
	    reg.load(file);
	    String key = "/";
	    if(argv.length > 1) {
		key = argv[1];
	    }
	    Entry node = reg.get(key);
	    printSubTree(node);
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

}
