import java.io.*;
import java.util.*;

public interface SetPdfPanel {
	public void setPanel(String panel,ByteArrayOutputStream b);
	public void setPanel(String panel);
	public void setPageCurrent(int page);
	public void restorePanel();
	public void setMem(String mem);
	public int getPageCurrent();
	
	public void setGraphPanel( String panel,Vector sug , Vector pri , Vector pos , Vector cos , String aYAxisName ,
													 String aRAxisName,int aYMax,int aYMin , int aRMax , int aRMin);	
	public void setNumberOfSuggetion(String panel ,Vector aSuggestion);
	public void setNumberOfSelectedSuggestion(String panel, Vector aSuggestion);
	public void setEvaluatePanel(String panel , Vector aSuggestion,String yLable,int yMax,int yMin,String rLabel,
													int rMax, int rMin);
	public void setSummarySessionPanel(String panel , Vector aSuggestion,Vector aPriority , Vector aPosibility , 
															Vector aCost ,String yLable,int yMax,int yMin,String rLable,int rMax,int rMin);
	public void setMenuSwotPanel();
	
	public void setSummary4SessionPanel(String panel,Vector SuggestionS,Vector PriorityValueS,Vector PosibilityValueS,Vector CostValueS,String yLabelS,int yMaxS,int yMinS,String rLabelS,int rMaxS,int rMinS,
 									                               Vector SuggestionW,Vector PriorityValueW,Vector PosibilityValueW,Vector CostValueW,String yLabelW, int yMaxW,int yMinW,String rLabelW,int rMaxW,int rMinW,
 									                               Vector SuggestionO,Vector PriorityValueO,Vector PosibilityValueO,Vector CostValueO,String yLabelO,int yMaxO,int yMinO,String rLabelO,int rMaxO,int rMinO,					
																Vector SuggestionT,Vector PriorityValueT,Vector PosibilityValueT,Vector CostValueT,String yLabelT,int yMaxT,int yMinT,String rLabelT,int rMaxT,int rMinT);
  	//*******************************
}