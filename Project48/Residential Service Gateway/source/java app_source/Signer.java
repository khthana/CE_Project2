import com.home.impl.manager.HomePrivateKey;
import java.io.*;
import java.security.*;

public class Signer {
	public static void main(String[] args) {
		if (args.length != 2) {
			System.out.println("signer [filetosign][outputfile]");
			System.exit(1);
		}
		try {
			FileInputStream fis = new FileInputStream(args[0]);
			FileOutputStream fos = new FileOutputStream(args[1]);
			Signature sig = Signature.getInstance("DSA");
			sig.initSign(HomePrivateKey.GetKey());
			byte[] buf = new byte[1024];
			int numRead;
			do {
				numRead = fis.read(buf);
				if (numRead != -1) {
					sig.update(buf, 0, numRead);
				}
			} while (numRead != -1);
			fos.write(sig.sign());
			fos.close();
			fis.close();
		} catch (Exception e) {
				System.err.println(e.toString());
		}
	}
}