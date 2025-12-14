
package terminal;

import java.awt.Component;

public class FocusKludge {
    public FocusKludge(Component c) {
	try {
	    java.lang.reflect.Method m =
		c.getClass().getMethod("setFocusTraversalKeysEnabled",
				       new Class[] { boolean.class });
	    m.invoke(c, new Object[] { new Boolean(false) });
	} catch (Throwable t) {
	    /* only needed/available in jdk1.4 */
	}
    }
}
