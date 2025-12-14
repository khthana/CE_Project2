
package jca.security;

import java.io.IOException;

import jca.security.spec.AlgorithmParameterSpec;
import jca.security.spec.InvalidParameterSpecException;

// !!! TODO

public abstract class AlgorithmParametersSpi {

    public AlgorithmParametersSpi() {
    }

    protected abstract byte[] engineGetEncoded() throws IOException;

    protected abstract byte[] engineGetEncoded(String format)
	throws IOException;

    protected abstract AlgorithmParameterSpec
	engineGetParameterSpec(Class paramSpec)
	throws InvalidParameterSpecException;

    protected abstract void engineInit(AlgorithmParameterSpec paramSpec)
	throws InvalidParameterSpecException;

    protected abstract void engineInit(byte[] params) throws IOException;

    protected abstract void engineInit(byte[] params, String format)
	throws IOException;

    protected abstract String engineToString();

}
