package Spider2;
import java.util.*;
public class Resource {
  String name;
  String url;
  String local_site;
  int order[];
  int tagCount;
  int end_property;
  int skip[];
  int prefix[];
  int suffix[];
  int skip_table_head;
  String available[];
  String place[];
  String value[];
  String accept_charactor[];
  String cut_off_charactor[];
  String end_charactor[];
  Vector before[];
  Vector after[];
  public Resource(int tagCount){
    this.tagCount = tagCount;
    skip = new int[tagCount];
    place = new String[tagCount];
    value = new String[tagCount];
    cut_off_charactor = new String[tagCount];
    accept_charactor = new String[tagCount];
    end_charactor = new String[tagCount];
    available = new String[tagCount];
    order = new int[tagCount];
    before = new Vector[tagCount];
    after = new Vector[tagCount];
    prefix = new int[tagCount];
    suffix= new int[tagCount];
  }
}
