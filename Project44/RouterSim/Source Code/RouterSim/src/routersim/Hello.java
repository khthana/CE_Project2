package routersim;

public class Hello {

  private Router startRouter;
  private Router desRouter;
  private int weight;

  public Router getStartRouter(){
    return startRouter;
  }
  public Router getDesRouter(){
    return desRouter;
  }
  public int getWeight(){
    return weight;
  }
  public void setWeight(int w){weight =w;}
  public Hello() {
    weight=10;
  }
  public Hello(Router r1,Router r2,int w){
    startRouter=r1;
    desRouter =r2;
    weight =w;
  }
}