
package ssh;


public final class SSHDES3 extends SSHCipher {
    SSHDES des1 = new SSHDES();
    SSHDES des2 = new SSHDES();
    SSHDES des3 = new SSHDES();

    public synchronized void encrypt(byte[] src, int srcOff, byte[] dest, int destOff, int len) {
	des1.encrypt(src, srcOff, dest, destOff, len);
	des2.decrypt(dest, destOff, dest, destOff, len);
	des3.encrypt(dest, destOff, dest, destOff, len);
    }

    public synchronized void decrypt(byte[] src, int srcOff, byte[] dest, int destOff, int len) {
	des3.decrypt(src, srcOff, dest, destOff, len);
	des2.encrypt(dest, destOff, dest, destOff, len);
	des1.decrypt(dest, destOff, dest, destOff, len);
    }

    public void setKey(byte[] key) {
	byte[] subKey = new byte[8];
	des1.setKey(key);
	System.arraycopy(key, 8, subKey, 0, 8);
	des2.setKey(subKey);
	System.arraycopy(key, 16, subKey, 0, 8);
	des3.setKey(subKey);
    }

}
