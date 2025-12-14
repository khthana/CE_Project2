
package security.pkcs12;

import asn1.ASN1Sequence;
import asn1.ASN1OctetString;
import asn1.ASN1Integer;

public final class PKCS12PbeParams extends ASN1Sequence {

    public ASN1OctetString salt;
    public ASN1Integer     iterations;

    public PKCS12PbeParams() {
	salt       = new ASN1OctetString();
	iterations = new ASN1Integer();
	addComponent(salt);
	addComponent(iterations);
    }

}

