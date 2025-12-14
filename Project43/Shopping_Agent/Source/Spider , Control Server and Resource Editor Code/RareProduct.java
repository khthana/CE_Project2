package Spider2;
public class RareProduct {
  int tagCount;
  int ProductNo;
  Resource resource;
  String attribute[];
  public RareProduct(int tagCount,Resource resource){
    this.tagCount = tagCount;
    this.resource = resource;
    attribute = new String[tagCount];
    for(int i=0;i<tagCount;i++)
    {
      attribute[i] = "Not Available";
    }
  }
} 