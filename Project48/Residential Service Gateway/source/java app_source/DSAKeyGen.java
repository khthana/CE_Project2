import java.security.*;
import java.io.*;
import com.Ostermiller.util.Base64;

public class DSAKeyGen {
	public static void main(String[] args) {
		try {
			SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
			KeyPairGenerator kpg = KeyPairGenerator.getInstance("DSA");
			kpg.initialize(512, sr);
			KeyPair kp = kpg.generateKeyPair();
			PublicKey pubKey = kp.getPublic();
			PrivateKey privKey = kp.getPrivate();
			FileOutputStream pubFOS = new FileOutputStream("pubkey");
			pubFOS.write(Base64.encode(pubKey.getEncoded()));
			pubFOS.close();
			System.out.println("Public Key Format: " +pubKey.getFormat() + " written to file.");
			FileOutputStream privFOS = new FileOutputStream("privkey");
			privFOS.write(Base64.encode(privKey.getEncoded()));
			privFOS.close();
			System.out.println("Private Key Format: " +privKey.getFormat() + " written to file.");
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
}