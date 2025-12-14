
package security.x509;

import asn1.ASN1OctetString;

import java.math.BigInteger;

/**
 * <pre>
 *  SubjectKeyIdentifier ::= KeyIdentifier
 *  KeyIdentifier ::= OCTET STRING
 * </pre>
 */

public class SubjectKeyIdentifier extends ASN1OctetString {

    public SubjectKeyIdentifier() {
        super();
    }

    public String toString() {
        byte[] b = getRaw();
        return "subjectKeyIdentifier: 0x" + util.HexDump.toString(b, 0, b.length);
    }
}
