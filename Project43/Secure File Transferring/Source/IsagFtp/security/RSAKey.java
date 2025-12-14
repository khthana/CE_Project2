package IsagFtp.security;

import java.math.BigInteger;

public class RSAKey implements Key {

  private BigInteger e;
  private BigInteger n;

  protected RSAKey(BigInteger e, BigInteger n) {
    this.e    = e;
    this.n    = n;
  }

  public String getAlgorithm() {
    return "RSA";
  }

  public byte[] getEncoded() {
    return null;
  }

  public String getFormat() {
    return null;
  }

  public int bitLength() {
    return n.bitLength();
  }

  public BigInteger getE() {
    return e;
  }

  public BigInteger getN() {
    return n;
  }

}
