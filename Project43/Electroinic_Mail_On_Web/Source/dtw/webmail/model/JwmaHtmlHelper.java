package dtw.webmail.model;

public interface JwmaHtmlHelper {

	 public String getControllerUrl();

	 public String getPathHierarchyNavigator(String path);
	 
	 public String getFolderDisplayAction(String path);

	 public String getMailboxDisplayAction(String path);

	 public String getDestinationsSelect(String[] paths);

	 public String getFrequentSelect(JwmaAddressBook book,String eventhandler);

	 //public String getPartDescription(JwmaMessagePart part);
         
         public String getPartDescription(JwmaMessagePart part,int no);

	 public String getSizeString(int size);

	 public String displayPartsInlined(JwmaMessagePart[] parts);
	
	
}//interface JwmaHtmlHelper