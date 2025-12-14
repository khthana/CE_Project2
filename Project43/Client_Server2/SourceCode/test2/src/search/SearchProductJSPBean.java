package search;

public class SearchProductJSPBean {
  private String category = "Anything";
  boolean firstAccess = true;
  public SearchProductJSPBean() {
    System.out.println("in Constructot SearchProductJSPBean");
  }
  public void init() {
    this.category = "Anything";
  }

  public void setCategory(String category) {
    this.category = category;
  }
  public String getCategory() {
    return this.category;
  }
  public void setFirstAccess (boolean firstAccess) {this.firstAccess = firstAccess;}
  public boolean getFirstAccess() {return firstAccess;}
}