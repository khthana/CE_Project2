import java.math.BigInteger;
import java.util.Random;

class RSA
{	public int Private_index = 0;
	public int IP;
	public BigInteger E, N, D;
	public byte[] kDES;

	public int getIP()
	{
		return this.IP;
	}
	public BigInteger getD()
	{
		return this.D;
	}
	public BigInteger getE()
	{
		return this.E;
	}
	public BigInteger getN()
	{
		return this.N;
	}

	public void genKey()
	{	BigInteger one = new BigInteger("1");
		BigInteger p1 = new BigInteger(256,16, new Random());
		BigInteger q1 = new BigInteger(256,16, new Random());
		N = p1.multiply(q1);
		BigInteger phi1 = p1.subtract(one).multiply(q1.subtract(one));
		E = new BigInteger(256,1, new Random());
		BigInteger gcd1 = phi1.gcd(E);
		while (!gcd1.equals(one))
			{
				E = new BigInteger(256,1, new Random());		gcd1 = phi1.gcd(E);
			}
		D = E.modInverse(phi1);
	}

		public BigInteger Encrypt(BigInteger key_E, BigInteger key_N, BigInteger msg)
		{	return msg.modPow(key_E ,key_N);
		}

		public BigInteger Decrypt(BigInteger key_D, BigInteger key_N, BigInteger msg_en)
		{	return  msg_en.modPow(key_D ,key_N);
		}

}