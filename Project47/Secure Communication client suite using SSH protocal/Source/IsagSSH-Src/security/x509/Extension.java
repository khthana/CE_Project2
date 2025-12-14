
package security.x509;

import asn1.ASN1Sequence;
import asn1.ASN1OctetString;
import asn1.ASN1Boolean;
import asn1.ASN1OID;

public class Extension extends ASN1Sequence {

    public ASN1OID         extnID;
    public ASN1Boolean     critical;
    public ASN1OctetString extnValue;

    public Extension() {
	extnID    = new ASN1OID();
	critical  = new ASN1Boolean();
	extnValue = new ASN1OctetString();
	addComponent(extnID);
	addOptional(critical, false);
	addComponent(extnValue);
    }

}
