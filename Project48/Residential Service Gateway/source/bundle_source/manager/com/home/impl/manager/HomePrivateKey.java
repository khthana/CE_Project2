package com.home.impl.manager;

import com.Ostermiller.util.Base64;
import java.security.spec.*;
import java.security.*;

public class HomePrivateKey {
	private final static String privKeyBase64="MIHGAgEAMIGoBgcqhkjOOAQBMIGcAkEA/KaCzo4Syrom78z3EQ5SbbB4sF7ey80etKII864WF64B81uRpH5t9jQTxeEu0ImbzRMqzVDZkVG9xD7nN1kuFwIVAJYu3cw2nLqOuyYO5rahJtk0bjjFAkBnhHGyepz0TukaScUUfbGpqvJE8FpDTWSGkx0tFCcbnjUDC3H9c9oXkGmzLik1Yw4cIGI1TQ2iCmxBblC+eUykBBYCFC7bm96cMunqrU2EUmFUXY7vXcr0";
	public static PrivateKey GetKey () {
		try {
			byte[] privKey = Base64.decode(privKeyBase64.getBytes("US-ASCII"));
			PKCS8EncodedKeySpec encodedKeySpec = new
			PKCS8EncodedKeySpec(privKey);
			KeyFactory keyFactory = KeyFactory.getInstance("DSA");
			return keyFactory.generatePrivate(encodedKeySpec);
		} catch (java.io.UnsupportedEncodingException uee) {
		// should never happen because ASCII must be supported on all Java platforms
			System.err.println(uee.toString());
			System.exit(1);
		} catch (NoSuchAlgorithmException nsae) {
		// should never happen as DSA must be supported on all Java platforms
			System.err.println(nsae.toString());
			System.exit(1);
		} catch (InvalidKeySpecException ikse) {
		// should never happen because we are using a DSA key
			System.err.println(ikse.toString());
			System.exit(1);
		}
		// This will never be executed...
		return null;
	}
}