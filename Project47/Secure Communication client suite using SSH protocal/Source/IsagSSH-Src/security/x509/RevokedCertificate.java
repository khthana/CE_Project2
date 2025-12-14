
package security.x509;

import asn1.ASN1Integer;
import asn1.ASN1Sequence;

public class RevokedCertificate extends ASN1Sequence {
    public ASN1Integer  userCertificate;
    public Time         revocationDate;
    public Extensions   extensions;

    public RevokedCertificate() {
        userCertificate = new ASN1Integer();
        revocationDate  = new Time();
        extensions      = new Extensions();
        addComponent(userCertificate);
        addComponent(revocationDate);
        addOptional(extensions);
    }

//     public String toString() {
//         return 
//             "userCertificate= " + userCertificate.getValue().toString() + NL +
//             "revocationDate= " + revocationDate + NL +
//             "extensions= ...";
//     }
}
