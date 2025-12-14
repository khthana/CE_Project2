
package security.x509;

import asn1.ASN1Choice;
import asn1.ASN1GeneralizedTime;
import asn1.ASN1UTCTime;

public class Time extends ASN1Choice {

    public Time() {
	super();
	setMember(new ASN1UTCTime());
	setMember(new ASN1GeneralizedTime());
    }

}
