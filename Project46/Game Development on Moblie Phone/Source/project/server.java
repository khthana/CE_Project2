import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
* A simple example of a servlet that responds to an
* input stream sent to it by a MIDP client.
*/

public class SampleServer extends HttpServlet {
public void doPost( HttpServletRequest request,
HttpServletResponse response )
throws IOException, ServletException {

// Get the input stream and read the data...

ServletInputStream in =
request.getInputStream();
DataInputStream    din =
new DataInputStream( in );

String text = din.readUTF();
din.close();

// Do something with the data. In this case
// make the string upper case and split it
// into tokens.

text = text.toUpperCase();

StringTokenizer tok = new StringTokenizer(
text );
Vector v = new Vector();
while( tok.hasMoreTokens() ){
v.addElement( tok.nextToken() );
}

// Form a response: send back the # of strings
// followed by each string in turn.

ByteArrayOutputStream bout =
new ByteArrayOutputStream();
DataOutputStream dout =
new DataOutputStream( bout );

int size = v.size();
dout.writeInt( size );
for( int i = 0; i < size; ++i ){
dout.writeutf( (string) v.elementat( i ) );
}

byte[] data = bout.tobytearray();

// set the response headers and data...

response.setcontenttype(
"application/octet-stream" );
response.setcontentlength( data.length );
response.setstatus( response.sc_ok );

outputstream out = response.getoutputstream();
out.write( data );
out.close();
}
}
