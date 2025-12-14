
package security.pkcs12;

import asn1.ASN1Sequence;
import asn1.ASN1OID;
import asn1.ASN1AnyDefinedBy;
import asn1.ASN1Explicit;

public final class CertBag extends ASN1Sequence {

    public ASN1OID          certId;
    public ASN1AnyDefinedBy certValue;
	
    public CertBag() {
	certId    = new ASN1OID();
	certValue = new ASN1AnyDefinedBy(certId);

	addComponent(certId);
	addComponent(new ASN1Explicit(0, certValue));
    }

}

