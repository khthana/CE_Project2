package switchsim;

import java.util.*;

public class ListCommand implements Enumeration{
  String s[];
  int i = 0;
  ListCommand(String s[]){
    this.s = s;
  }
  public boolean hasMoreElements(){
    return i < s.length;
  }
  public Object nextElement(){
    if (i < s.length)
      return s[i++];
    return null;
  }
  public void resetList(){
    i=0;
  }
}