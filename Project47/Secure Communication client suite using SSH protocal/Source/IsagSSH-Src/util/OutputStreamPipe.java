package util;

import java.io.OutputStream;
import java.io.IOException;

public final class OutputStreamPipe extends OutputStream {

    private InputStreamPipe sink;

    public OutputStreamPipe(InputStreamPipe sink)  throws IOException {
	connect(sink);
    }

    public OutputStreamPipe() {
    }

    public void connect(InputStreamPipe sink) throws IOException {
	if(this.sink == sink) {
	    return;
	}
	if(this.sink != null) {
	    throw new IOException("Already connected");
	}
	this.sink = sink;
    }

    public void write(int b) throws IOException {
	sink.put(b);
    }

    public void write(byte b[], int off, int len) throws IOException {
	sink.put(b, off, len);
    }

    public void flush() {
	if(sink != null) {
	    sink.flush();
	}
    }

    public void close() throws IOException {
	sink.eof();
    }

}
