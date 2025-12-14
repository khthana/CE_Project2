
package ssh;

import jca.security.InvalidKeyException;

import security.cipher.DES;

public final class SSHDES extends SSHCipher {
    DES    des;
    byte[] IV;
    byte[] enc;
    byte[] dec;

    public SSHDES() {
	des = new DES();
	IV  = new byte[8];
	enc = new byte[8];
	dec = new byte[8];
    }

    public void setKey(byte[] key) {
	try {
	    des.initializeKey(key);
	} catch (InvalidKeyException e) {
	    throw new Error("Internal error, invalid key in SSHDES");
	}
    }

    public synchronized void encrypt(byte[] src, int srcOff, byte[] dest, int destOff, int len) {
	int end = srcOff + len;
	int i;

	for(int si = srcOff, di = destOff; si < end; si += 8, di += 8) {
	    for(i = 0; i < 8; i++) {
		IV[i] ^= src[si + i];
	    }
	    des.blockEncrypt(IV, 0, IV, 0);
	    for(i = 0; i < 8; i++) {
		dest[di + i] = IV[i];
	    }
	}
    }

    public synchronized void decrypt(byte[] src, int srcOff, byte[] dest, int destOff, int len) {
	int    end = srcOff + len;
	int    i;

	for(int si = srcOff, di = destOff; si < end; si += 8, di += 8) {
	    for(i = 0; i < 8; i++) {
		enc[i] = src[si + i];
	    }
	    des.blockDecrypt(enc, 0, dec, 0);
	    for(i = 0; i < 8; i++) {
		dest[di + i] = (byte)((IV[i] ^ dec[i]) & 0xff);
		IV[i] = enc[i];
	    }
	}
    }

}

