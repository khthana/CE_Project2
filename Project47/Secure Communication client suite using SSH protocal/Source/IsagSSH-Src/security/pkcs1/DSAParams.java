
package security.pkcs1;

import java.math.BigInteger;

import asn1.ASN1Sequence;
import asn1.ASN1Integer;

/**
 * <pre>
 *  Dss-Parms ::= SEQUENCE {
 *    p INTEGER,
 *    q INTEGER,
 *    g INTEGER
 * }
 * </pre>
 */
public class DSAParams extends ASN1Sequence {
    
    public ASN1Integer p;
    public ASN1Integer q;
    public ASN1Integer g;
    
    public DSAParams() {
	p = new ASN1Integer();
 	q = new ASN1Integer();
        g = new ASN1Integer();
        addComponent(p);
 	addComponent(q);
        addComponent(g);
    }
    
    public DSAParams(BigInteger p, BigInteger q, BigInteger g) {
 	this();
 	this.p.setValue(p);
 	this.q.setValue(q);
 	this.g.setValue(g);
    }
}
