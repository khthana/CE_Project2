
package security.x509;

import asn1.ASN1Boolean;
import asn1.ASN1Integer;
import asn1.ASN1Sequence;

/**
 * <pre>
 * BasicConstraintsSyntax ::= SEQUENCE {
 *      cA	BOOLEAN DEFAULT FALSE,
 *      pathLenConstraint INTEGER (0..MAX) OPTIONAL
 * }
 * </pre>
 */

public class BasicConstraints extends ASN1Sequence {

    public ASN1Boolean ca;
    public ASN1Integer pathlenconstraint;
    
    public BasicConstraints() {
        ca = new ASN1Boolean();
        pathlenconstraint = new ASN1Integer();
        addOptional(ca, false);
        addOptional(pathlenconstraint, -1);
    }

    public String toString() {
        String len = null;
        try {
            if (pathlenconstraint.getValue().intValue() >= 0)
                len = pathlenconstraint.getValue().toString();
        } catch (Throwable t) {
        }
        
        return "basicConstraints: ca=" + ca.getValue() + 
            ((len == null)?"": (", pathlenconstraint=" + len));
    }
}
