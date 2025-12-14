
package security.pkcs7;

import asn1.ASN1Sequence;
import asn1.ASN1Integer;


public class EnvelopedData extends ASN1Sequence {

    public ASN1Integer          version;
    public RecipientInfos       recipientInfos;
    public EncryptedContentInfo encryptedContentInfo;

    public EnvelopedData() {
	version              = new ASN1Integer();
	recipientInfos       = new RecipientInfos();
	encryptedContentInfo = new EncryptedContentInfo();
	addComponent(version);
	addComponent(recipientInfos);
	addComponent(encryptedContentInfo);
    }

}

