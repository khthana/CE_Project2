public class EleError {

 private final String name;

 private EleError(String name) {this.name=name;}

 public String toString() { return name;}

public static final EleError ERROR = new EleError("error");

public static final EleError TIMEOUTERROR = new EleError("timeout, no response from server");

public static final EleError NOERROR = new EleError("no error");

}
