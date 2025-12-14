
package security.x509;

import asn1.ASN1Choice;
import asn1.ASN1CharString;
import asn1.ASN1TeletexString;
import asn1.ASN1PrintableString;
import asn1.ASN1UniversalString;
import asn1.ASN1UTF8String;
import asn1.ASN1BMPString;

public class DirectoryString extends ASN1Choice {

    public DirectoryString() {
	setMember(new ASN1TeletexString());
	setMember(new ASN1PrintableString());
	setMember(new ASN1UniversalString());
	setMember(new ASN1UTF8String());
	setMember(new ASN1BMPString());
    }

    public String getString() {
	return ((ASN1CharString)getValue()).getValue();
    }

    public void setString(String s) {
	((ASN1CharString)getValue()).setValue(s);
    }

}
