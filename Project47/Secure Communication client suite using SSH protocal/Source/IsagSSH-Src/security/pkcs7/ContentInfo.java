
package security.pkcs7;

import asn1.ASN1Sequence;
import asn1.ASN1OID;
import asn1.ASN1AnyDefinedBy;
import asn1.ASN1Explicit;


public class ContentInfo extends ASN1Sequence {

    public ASN1OID          contentType;
    public ASN1AnyDefinedBy content;

    public ContentInfo() {
	contentType = new ASN1OID();
	content     = new ASN1AnyDefinedBy(contentType);
	addComponent(contentType);
	addOptional(new ASN1Explicit(0, content));
    }

}

