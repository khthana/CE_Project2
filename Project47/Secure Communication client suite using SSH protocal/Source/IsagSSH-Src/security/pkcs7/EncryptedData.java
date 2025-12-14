
package security.pkcs7;

import asn1.ASN1Integer;
import asn1.ASN1Sequence;


public final class EncryptedData extends ASN1Sequence {

    public ASN1Integer          version;
    public EncryptedContentInfo encryptedContentInfo;

    public EncryptedData() {
	version              = new ASN1Integer();
	encryptedContentInfo = new EncryptedContentInfo();
	addComponent(version);
	addComponent(encryptedContentInfo);
    }

}

