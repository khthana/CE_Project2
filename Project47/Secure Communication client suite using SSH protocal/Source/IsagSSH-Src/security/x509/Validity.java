
package security.x509;

import asn1.ASN1Sequence;

public class Validity extends ASN1Sequence {

    public Time notBefore;
    public Time notAfter;

    public Validity() {
	notBefore = new Time();
	notAfter  = new Time();
	addComponent(notBefore);
	addComponent(notAfter);
    }

}
