
package security.x509;

import asn1.ASN1SequenceOf;

public class Extensions extends ASN1SequenceOf {

    public Extensions() {
	super(Extension.class);
    }

}

