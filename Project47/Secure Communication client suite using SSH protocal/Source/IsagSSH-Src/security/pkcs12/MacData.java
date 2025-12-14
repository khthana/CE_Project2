
package security.pkcs12;

import asn1.ASN1Sequence;
import asn1.ASN1OctetString;
import asn1.ASN1Integer;

import security.pkcs7.DigestInfo;

public final class MacData extends ASN1Sequence {

    public DigestInfo      mac;
    public ASN1OctetString macSalt;
    public ASN1Integer     iterations;

    public MacData() {
	mac        = new DigestInfo();
	macSalt    = new ASN1OctetString();
	iterations = new ASN1Integer();
	addComponent(mac);
	addComponent(macSalt);
	addOptional(iterations, 1);
    }

    public int getIterations() {
	ASN1Integer iter = (iterations.isSet() ?
			    iterations : (ASN1Integer)getDefault(2));
	return iter.getValue().intValue();
    }

}

