public class Item
{
 private String code;
 private int prNo;
 private int prLineNo;
 private int poNo;
 private int poLineNo;

public Item(String code,int prNo,int prLineNo, int poNo, int poLineNo){
	this.code=code;
	this.prNo=prNo;
	this.prLineNo=prLineNo;
	this.poNo=poNo;
	this.poLineNo=poLineNo;
}

public void setPrNo(int prNo){
	this.prNo=prNo;
}


public void setPrLineNo(int prLineNo){
	this.prLineNo=prLineNo;
}


public void setPoNo(int poNo){
	this.poNo=poNo;
}


public void setPoLineNo(int poLineNo){
	this.poLineNo=poLineNo;
}

public String getCode(){
	return(code);
}

public int getPrNo(){
	return(prNo);
}


public int getPrLineNo(){
	return(prLineNo);
}


public int getPoNo(){
	return(poNo);
}


public int getPoLineNo(){
	return(poLineNo);
}
}//Item