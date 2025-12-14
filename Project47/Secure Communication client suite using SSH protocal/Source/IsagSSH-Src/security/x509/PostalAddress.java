
package security.x509;

import asn1.ASN1SequenceOf;

/**
 * <pre>
 * PostalAddress ::= SEQUENCE SIZE (1..6) OF DirectoryString
 * </pre>
 */
public class PostalAddress extends ASN1SequenceOf {

    public PostalAddress() {
	super(DirectoryString.class);
    }

}
