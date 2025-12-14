
package security.pkcs12;

import asn1.ASN1SequenceOf;

import security.pkcs7.ContentInfo;

public final class AuthenticatedSafe extends ASN1SequenceOf {

    public AuthenticatedSafe() {
	super(ContentInfo.class);
    }

    public ContentInfo getContentInfo(int index) {
	return (ContentInfo)getComponent(index);
    }

}

