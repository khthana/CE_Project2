
package util;

import java.io.IOException;
import java.io.BufferedInputStream;

import java.util.zip.ZipFile;
import java.util.zip.ZipEntry;
import java.util.StringTokenizer;

public class JarLoader extends ClassLoader {
    String jarName;
    String jarPath;
    ZipFile jarFile;

    public JarLoader(String path, String name) throws IOException {
	jarName = name;
	if (path == null) {
	    path = "";
	}
	StringTokenizer st = new StringTokenizer(path, ":;");
	while (st.hasMoreTokens()) {
	    try {
		jarFile = new ZipFile(st.nextToken() + "/" + name);
		return;
	    } catch (IOException e) {
		// Ignore errors here
	    }
	}
	throw new IOException("Failed to locate '" + name +
			      "' with jar-path: " + path);
    }

    public Class findClass(String name) throws ClassNotFoundException {
	byte[] b = loadClassData(name.replace('.', '/') + ".class");
	return defineClass(name, b, 0, b.length);
    }

    public synchronized Class loadClass(String name, boolean resolve) 
	throws ClassNotFoundException {
        Class c = null;

        c = findLoadedClass(name);
        if (c != null) {
            return c;
        }

        try {
            c = findSystemClass(name);
            if (c != null) {
                return c;
            }
        }
        catch (ClassNotFoundException e) {
            // noop
        }

        if (c == null) {
            byte[] data = loadClassData(name.replace('.', '/') + ".class");
            if (data != null) {
                c = defineClass(name, data, 0, data.length);
            }
        }

        if ((c != null) && resolve) {
            resolveClass(c);
        }

        return c;
    }

    private byte[] loadClassData(String name) throws ClassNotFoundException {
	ZipEntry je = jarFile.getEntry(name);
        BufferedInputStream is = null;
	try {
            int sz = (int)je.getSize();
	    byte[] buffer = new byte[sz];
	    is = new BufferedInputStream(jarFile.getInputStream(je));
            int pos = 0;
            while (sz > 0) {
                int l = is.read(buffer, pos, sz);
                if (l < 0)
                    break;
                sz -= l;
                pos += l;
            }                            
	    return buffer;
	} catch (IOException e) {
	    throw new ClassNotFoundException("Can't find " + name + " in " +
					     jarName);
	} finally {
            try { is.close(); } catch (Throwable t) {}
        }
    }
}
