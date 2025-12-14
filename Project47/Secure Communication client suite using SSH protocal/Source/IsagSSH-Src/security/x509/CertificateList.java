
package security.x509;

import asn1.ASN1Sequence;
import asn1.ASN1BitString;

public class CertificateList extends ASN1Sequence {

    public TBSCertificateList  tbsCertificateList;
    public AlgorithmIdentifier signatureAlgorithm;
    public ASN1BitString       signatureValue;

    public CertificateList() {
	tbsCertificateList = new TBSCertificateList();
	signatureAlgorithm = new AlgorithmIdentifier();
	signatureValue     = new ASN1BitString();
	addComponent(tbsCertificateList);
	addComponent(signatureAlgorithm);
	addComponent(signatureValue);
    }

//     public String toString() {
//         return 
//             "Algorithm= " + signatureAlgorithm.algorithmName() + NL +
//             "TBSCertificateList= " + tbsCertificateList;
//     }
}
