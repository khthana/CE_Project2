package com.home.impl.manager;

import com.Ostermiller.util.Base64;
import java.security.spec.*;
import java.security.*;

public class HomePublicKey {
	private final static String pubKeyBase64="MIHwMIGoBgcqhkjOOAQBMIGcAkEA/KaCzo4Syrom78z3EQ5SbbB4sF7ey80etKII864WF64B81uRpH5t9jQTxeEu0ImbzRMqzVDZkVG9xD7nN1kuFwIVAJYu3cw2nLqOuyYO5rahJtk0bjjFAkBnhHGyepz0TukaScUUfbGpqvJE8FpDTWSGkx0tFCcbnjUDC3H9c9oXkGmzLik1Yw4cIGI1TQ2iCmxBblC+eUykA0MAAkAu916qZuSSHv079cHfY6heU2ztkkJFdTt9W+pWGwO2tYRYBOgPGaOODGxSDiZ6Jvf7HIYX8/pUiiDRmeLuGOHJ";
	public static PublicKey GetKey () {
		try {
			byte[] pubKey = Base64.decode(pubKeyBase64.getBytes("US-ASCII"));
			X509EncodedKeySpec encodedKeySpec = new X509EncodedKeySpec(pubKey);
			KeyFactory keyFactory = KeyFactory.getInstance("DSA");
			return keyFactory.generatePublic(encodedKeySpec);
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