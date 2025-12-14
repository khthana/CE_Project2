package security;

import jca.security.Provider;

public class Mindbright extends Provider {

    public Mindbright() {
	super("Mindbright", 1.1, "Mindbright JCA/JCE provider v1.1");

	put("Cipher.DES",          "security.cipher.DES");
	put("Cipher.DES/ECB",      "security.cipher.DES");
	put("Cipher.DES/CBC",      "security.cipher.DES");
	put("Cipher.DES/CFB",      "security.cipher.DES");
	put("Cipher.DES/OFB",      "security.cipher.DES");
	put("Cipher.DES/CBC/PKCS5Padding", "security.cipher.DES");
	put("Cipher.3DES",         "security.cipher.DES3");
	put("Cipher.3DES/ECB",     "security.cipher.DES3");
	put("Cipher.3DES/CBC",     "security.cipher.DES3");
	put("Cipher.3DES/CFB",     "security.cipher.DES3");
	put("Cipher.3DES/OFB",     "security.cipher.DES3");
	put("Cipher.3DES/CTR",     "security.cipher.DES3");
	put("Cipher.3DES/CBC/PKCS5Padding", "security.cipher.DES3");
	put("Cipher.Blowfish",     "security.cipher.Blowfish");
	put("Cipher.Blowfish/ECB", "security.cipher.Blowfish");
	put("Cipher.Blowfish/CBC", "security.cipher.Blowfish");
	put("Cipher.Blowfish/CFB", "security.cipher.Blowfish");
	put("Cipher.Blowfish/OFB", "security.cipher.Blowfish");
	put("Cipher.Blowfish/CTR", "security.cipher.Blowfish");
	put("Cipher.Twofish",      "security.cipher.Twofish");
	put("Cipher.Twofish/ECB",  "security.cipher.Twofish");
	put("Cipher.Twofish/CBC",  "security.cipher.Twofish");
	put("Cipher.Twofish/CFB",  "security.cipher.Twofish");
	put("Cipher.Twofish/OFB",  "security.cipher.Twofish");
	put("Cipher.Twofish/CTR",  "security.cipher.Twofish");
	put("Cipher.Rijndael",     "security.cipher.Rijndael");
	put("Cipher.Rijndael/ECB", "security.cipher.Rijndael");
	put("Cipher.Rijndael/CBC", "security.cipher.Rijndael");
	put("Cipher.Rijndael/CFB", "security.cipher.Rijndael");
	put("Cipher.Rijndael/OFB", "security.cipher.Rijndael");
	put("Cipher.Rijndael/CTR", "security.cipher.Rijndael");
	put("Cipher.IDEA",         "security.cipher.IDEA");
	put("Cipher.IDEA/ECB",     "security.cipher.IDEA");
	put("Cipher.IDEA/CBC",     "security.cipher.IDEA");
	put("Cipher.IDEA/CFB",     "security.cipher.IDEA");
	put("Cipher.IDEA/OFB",     "security.cipher.IDEA");
	put("Cipher.CAST128",      "security.cipher.CAST128");
	put("Cipher.CAST128/ECB",  "security.cipher.CAST128");
	put("Cipher.CAST128/CBC",  "security.cipher.CAST128");
	put("Cipher.CAST128/CFB",  "security.cipher.CAST128");
	put("Cipher.CAST128/OFB",  "security.cipher.CAST128");
	put("Cipher.RC2",          "security.cipher.RC2");
	put("Cipher.RC2/ECB",      "security.cipher.RC2");
	put("Cipher.RC2/CBC",      "security.cipher.RC2");
	put("Cipher.RC2/CFB",      "security.cipher.RC2");
	put("Cipher.RC2/OFB",      "security.cipher.RC2");
	put("Cipher.RC2/CBC/PKCS5Padding", "security.cipher.RC2");
	put("Cipher.RC4/OFB",      "security.cipher.ArcFour");
	put("Cipher.RC4/OFB/PKCS5Padding", "security.cipher.ArcFour");
	put("Alg.Alias.Cipher.AES",     "Rijndael/ECB");
	put("Alg.Alias.Cipher.AES/ECB", "Rijndael/ECB");
	put("Alg.Alias.Cipher.AES/CBC", "Rijndael/CBC");
	put("Alg.Alias.Cipher.AES/CFB", "Rijndael/CFB");
	put("Alg.Alias.Cipher.AES/OFB", "Rijndael/OFB");
	put("Alg.Alias.Cipher.AES/CTR", "Rijndael/CTR");
	put("Alg.Alias.Cipher.DESede",     "3DES/ECB");
	put("Alg.Alias.Cipher.DESede/ECB", "3DES/ECB");
	put("Alg.Alias.Cipher.DESede/CBC", "3DES/CBC");
	put("Alg.Alias.Cipher.DESede/CFB", "3DES/CFB");
	put("Alg.Alias.Cipher.DESede/OFB", "3DES/OFB");
	put("Alg.Alias.Cipher.DESede/CBC/PKCS5Padding", "3DES/CBC/PKCS5Padding");
	put("Alg.Alias.Cipher.RC4",     "RC4/OFB");
	put("Alg.Alias.Cipher.ArcFour", "RC4/OFB");
	put("Alg.Alias.Cipher.CAST5",   "CAST128");
	put("Alg.Alias.Cipher.CAST5/ECB", "CAST128/ECB");
	put("Alg.Alias.Cipher.CAST5/CBC", "CAST128/CBC");
	put("Alg.Alias.Cipher.CAST5/CFB", "CAST128/CFB");
	put("Alg.Alias.Cipher.CAST5/OFB", "CAST128/OFB");

	put("MessageDigest.MD2",       "security.digest.MD2");
	put("MessageDigest.MD5",       "security.digest.MD5");
	put("MessageDigest.SHA",       "security.digest.SHA1");
	put("MessageDigest.RIPEMD160", "security.digest.RIPEMD160");
	put("Alg.Alias.MessageDigest.SHA-1",              "SHA");
	put("Alg.Alias.MessageDigest.SHA1",               "SHA");
	put("Alg.Alias.MessageDigest.1.3.14.3.2.26",      "SHA");
	put("Alg.Alias.MessageDigest.1.2.840.113549.2.5", "MD5");
	put("Alg.Alias.MessageDigest.1.2.840.113549.2.2", "MD2");
	put("Alg.Alias.MessageDigest.1.3.36.3.2.1",       "RIPEMD160");

	put("Mac.HmacSHA1",      "security.mac.HMACSHA1");
	put("Mac.HmacMD5",       "security.mac.HMACMD5");
	put("Mac.HmacRIPEMD160", "security.mac.HMACRIPEMD160");
	put("Mac.HmacSHA1-96",   "security.mac.HMACSHA1_96");
	put("Mac.HmacMD5-96",    "security.mac.HMACMD5_96");
	put("Mac.HmacRIPEMD160-96", "security.mac.HMACRIPEMD160_96");
	/* Convenience, not id of MAC itself but of the used HASH */
	put("Alg.Alias.Mac.1.2.840.113549.2.5", "HmacMD5");
	put("Alg.Alias.Mac.1.3.14.3.2.26",      "HmacSHA1");
	/* From IANA numbers for ipsec */
	put("Alg.Alias.Mac.1.3.6.1.5.5.8.1.1",  "HmacMD5");
	put("Alg.Alias.Mac.1.3.6.1.5.5.8.1.2",  "HmacSHA1");
	put("Alg.Alias.Mac.1.3.6.1.5.5.8.1.4",  "HmacRIPEMD160");

	put("SecureRandom.BlumBlumShub", "security.prng.BlumBlumShub");

	put("Signature.SHA1withRawDSA", "security.publickey.RawDSAWithSHA1");
	put("Signature.SHA1withDSA", "security.publickey.DSAWithSHA1");
	put("Signature.SHA1withRSA", "security.publickey.RSAWithSHA1");
	put("Signature.MD5withRSA", "security.publickey.RSAWithMD5");
	put("Signature.MD2withRSA", "security.publickey.RSAWithMD2");
	put("Signature.RIPEMD160withRSA", "security.publickey.RSAWithRIPEMD160");
	put("Alg.Alias.Signature.1.3.14.3.2.13", "SHA1withDSA");
	put("Alg.Alias.Signature.1.3.14.3.2.27", "SHA1withDSA");
	put("Alg.Alias.Signature.1.2.840.10040.4.3", "SHA1withDSA");
	put("Alg.Alias.Signature.1.3.14.3.2.29",  "SHA1withRSA");
	put("Alg.Alias.Signature.1.2.840.113549.1.1.5", "SHA1withRSA");
	put("Alg.Alias.Signature.1.3.14.3.2.3", "MD5withRSA");
	put("Alg.Alias.Signature.1.3.14.3.2.25", "MD5withRSA");
	put("Alg.Alias.Signature.1.2.840.113549.1.1.4", "MD5withRSA");
	put("Alg.Alias.Signature.1.3.14.3.2.24", "MD2withRSA");
	put("Alg.Alias.Signature.1.2.840.113549.1.1.2", "MD2withRSA");
	put("Alg.Alias.Signature.1.3.36.3.3.1.2", "RIPEMD160withRSA");

	put("KeyFactory.RSA", "security.publickey.RSAKeyFactory");
	put("KeyFactory.DSA", "security.publickey.DSAKeyFactory");
	put("KeyFactory.DH",  "security.publickey.DHKeyFactory");

	put("KeyPairGenerator.DH", "security.publickey.DHKeyPairGenerator");
	put("KeyPairGenerator.RSA", "security.publickey.RSAKeyPairGenerator");
	put("KeyPairGenerator.DSA", "security.publickey.DSAKeyPairGenerator");

	put("KeyAgreement.DH", "security.publickey.DHKeyAgreement");

	put("KeyStore.PKCS12", "security.keystore.PKCS12KeyStore");
	put("KeyStore.Netscape", "security.keystore.NetscapeKeyStore");
    }

}
