package Spider2;
import java.net.URL;
import java.io.*;
import java.net.MalformedURLException;
import javax.swing.text.*;
import javax.swing.text.html.*;
import javax.swing.text.html.parser.*;
import Sagent.MTThai;
public class MyParserTest extends HTMLEditorKit.ParserCallback
{
  String place;
  Resource resource;
  RulesEditor control;
	MyParserTest(RulesEditor control,Resource resource,String place)
	{
    this.control = control;
    this.resource = resource;
    this.place = place;
	}
	public void handleStartTag(HTML.Tag tag,MutableAttributeSet attribute_set, int pos)
	{
    boolean end = false;
    int i=0;
    while((i<control.TagCount)/*&&(!end)*/)
    {
      if((resource.available[resource.order[i]].compareTo("Yes")==0)&&(resource.place[resource.order[i]].compareTo(place)==0))
      {
        if(control.STATE[resource.order[i]].compareTo("before")==0)
        {
          if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i])!=null)
          {
            if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              //if(attribute_set.toString().toUpperCase().compareTo(control.getTag("before",control.BeforeIndex).attribute_set.toUpperCase())==0)
              //if(attribute_set.isEqual(control.getTag("before",control.BeforeIndex).attribute_set))
              /*if(control.getTag(control.resource,"before",control.BeforeIndex[i],i).attribute_set.containsAttributes(attribute_set))
              {        */
                  control.BeforeIndex[resource.order[i]]++;
                  if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i])==null)
                  {
                    if((control.tagString[resource.order[i]].compareTo("more_info_url")==0)||(control.tagString[resource.order[i]].compareTo("start_property")==0)) control.STATE[resource.order[i]] = "after";
                    else control.STATE[resource.order[i]] = "data";
                  }
              //}else control.BeforeIndex[i] = 0;
            }else control.BeforeIndex[resource.order[i]] = 0;
          }else control.STATE[resource.order[i]] = "data";
        }else
        if(control.STATE[resource.order[i]].compareTo("after")==0)
        {
          if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i])!=null)
          {
            if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              //if(attribute_set.toString().toUpperCase().compareTo(control.getTag("after",control.AfterIndex).attribute_set.toUpperCase())==0)
              //if(attribute_set.isEqual(control.getTag("after",control.AfterIndex).attribute_set))

              /*if(control.getTag(control.resource,"after",control.AfterIndex[i],i).attribute_set.containsAttributes(attribute_set))
              {    */
                control.AfterIndex[resource.order[i]]++;
                if((control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i])==null))
                {
                  if(resource.skip_table_head==0)
                  {
                    if((control.SKIP[resource.order[i]]==0))
                    {
                      end = true;
                      if(i<control.TagCount)
                      {
                        for(int h=i+1;h<control.TagCount;h++)
                        {
                          control.STATE[resource.order[h]] = "before";
                        }
                      }
                      //control.found++;
                      //control.display("Found : "+control.found+"\n");
                      if(control.tagString[resource.order[i]].compareTo("more_info_url")==0)
                      {
                          //Do something with attribute set
                          control.DATA[resource.order[i]] = (String)attribute_set.getAttribute(new HTML().getAttributeKey("href"));
                          //product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                          if(!control.DATA[resource.order[i]].startsWith("http://"))
                          {
                            control.DATA[resource.order[i]] = resource.local_site + control.DATA[resource.order[i]];
                          }
                          control.display(control.tagString[resource.order[i]]+" :\t"+control.DATA[resource.order[i]]+"\n");//control.STATE = "data";
                          try{
                            control.getURL(new URL(control.DATA[resource.order[i]]),"C:\\tomcat\\webapps\\ROOT\\crawlerTest_Extend.html");
                            MyParserTest myParserExtend = null;
		                        ParserDelegator pdExtend;
		                        pdExtend = new ParserDelegator();
                            myParserExtend = new MyParserTest(control,resource,"extend");
                          	pdExtend.parse(new InputStreamReader(new URL("http://161.246.5.185:8080/crawlerTest_Extend.html").openStream()),myParserExtend,true);
                          }catch(MalformedURLException e){
                            //control.output.Display.append("Malform Exception\n");
                          }catch(Exception e){
                            //control.output.Display.append("Exception");
                          }
                          //control.linkCount++;
                      }else
                      if(control.tagString[resource.order[i]].compareTo("start_property")==0)
                      {
                        //product = new RareProduct(control.TagCount,control.resource);
                        control.display(control.tagString[resource.order[i]]+" :\t"+control.propertyCount+"\n");
                        control.propertyCount++;
                      }else
                      {
                        control.display(control.tagString[resource.order[i]]+" :\t"+control.DATA[resource.order[i]]+"\n");//control.STATE = "data";
                        //product.attribute[resource.order[i]] = control.DATA[resource.order[i]];
                      }
                      control.STATE[resource.order[i]] = "end";
                      control.AfterIndex[resource.order[i]] = 0;
                      control.BeforeIndex[resource.order[i]] = 0;
                      if(resource.end_property==resource.order[i])
                      {
                          for(int c = 0;c<resource.tagCount;c++)
                          {
                            control.SKIP[c] = resource.skip[c];
                          }
                          if(place.compareTo("result")==0)
                          {
                            control.STATE[0] = "before";
                            for(int g=0;g<control.TagCount;g++)
                            {
                              if(resource.value[g].length()!=0)
                              {
                                control.display(control.tagString[g]+" :\t"+resource.value[g]+"\n");
                                //product.attribute[g] = resource.value[g];
                              }
                            }
                          }
                          //control.control.addProduct(product);
                      }
                      if(resource.order[i]==0)
                      {
                        for(int h=0;h<control.TagCount;h++)
                        {
                          control.STATE[h] = "before";
                        }
                      }
                    }else
                    {
                        control.SKIP[resource.order[i]]--;
                        control.STATE[resource.order[i]] = "before";
                        control.BeforeIndex[resource.order[i]] = 0;
                        control.AfterIndex[resource.order[i]] = 0;
                        if(i<control.TagCount)
                        {
                          for(int h=i+1;h<control.TagCount;h++)
                          {
                            control.STATE[resource.order[h]] = "before";
                            control.BeforeIndex[resource.order[h]] = 0;
                            control.AfterIndex[resource.order[h]] = 0;
                          }
                        }
                    }
                  }else
                  {
                    resource.skip_table_head--;
                    control.STATE[resource.order[i]] = "before";
                  }
                }
              //}else control.AfterIndex[i] = 0;
            }else
            {
              control.AfterIndex[resource.order[i]] = 0;
              control.BeforeIndex[resource.order[i]] = 0;
              control.STATE[resource.order[i]] = "before";
            }
          }else control.STATE[resource.order[i]] = "end";
        }else
        {
          control.AfterIndex[resource.order[i]] = 0;
          control.BeforeIndex[resource.order[i]] = 0;
        }
      }i++;
    }
	}
	public void handleEndTag(HTML.Tag tag, int pos)
	{
    boolean end = false;
    int i=0;
    while((i<control.TagCount)/*&&(!end)*/)
    {
      if((resource.available[resource.order[i]].compareTo("Yes")==0)&&(resource.place[resource.order[i]].compareTo(place)==0))
      {
        if(control.STATE[resource.order[i]].compareTo("before")==0)
        {
          if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i])!=null)
          {
            if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i]).type.compareTo("close")==0)
              {
                control.BeforeIndex[resource.order[i]]++;
                if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i])==null)
                {
                  if((control.tagString[resource.order[i]].compareTo("more_info_url")==0)||(control.tagString[resource.order[i]].compareTo("start_property")==0)) control.STATE[resource.order[i]] = "after";
                  else control.STATE[resource.order[i]] = "data";
                }
              }else control.BeforeIndex[resource.order[i]] = 0;
            }else control.BeforeIndex[resource.order[i]] = 0;
          }else control.STATE[resource.order[i]] = "data";
        }else
        if(control.STATE[resource.order[i]].compareTo("after")==0)
        {
          if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i])!=null)
          {
            if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i]).type.compareTo("close")==0)
              {
                control.AfterIndex[resource.order[i]]++;
                if((control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i])==null))
                {
                  if(resource.skip_table_head==0)
                  {
                    if((control.SKIP[resource.order[i]]==0))
                    {
                      end = true;
                      if(i<control.TagCount)
                      {
                        for(int h=i+1;h<control.TagCount;h++)
                        {
                          control.STATE[resource.order[h]] = "before";
                        }
                      }
                      //control.found++;
                      //control.display("Found : "+control.found+"\n");
                      if(control.tagString[resource.order[i]].compareTo("start_property")==0)
                      {
                        //product = new RareProduct(control.TagCount,control.resource);
                        control.display(control.tagString[resource.order[i]]+" :\t"+control.propertyCount+"\n");
                        control.propertyCount++;
                      }else
                      {
                        control.display(control.tagString[resource.order[i]]+" :\t"+control.DATA[resource.order[i]]+"\n");//control.STATE = "data";
                        //product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                      }
                      control.STATE[resource.order[i]] = "end";
                      control.AfterIndex[resource.order[i]] = 0;
                      control.BeforeIndex[resource.order[i]] = 0;
                      if(resource.end_property==resource.order[i])
                      {
                         for(int c = 0;c<resource.tagCount;c++)
                         {
                            control.SKIP[c] = resource.skip[c];
                         }
                         if(place.compareTo("result")==0)
                         {
                            control.STATE[0] = "before";
                            for(int g=0;g<control.TagCount;g++)
                            {
                              if(resource.value[g].length()!=0)
                              {
                                control.display(control.tagString[g]+" :\t"+resource.value[g]+"\n");
                                //product.attribute[g] = resource.value[g];
                              }
                            }
                         }
                         //control.control.addProduct(product);
                      }
                      if(resource.order[i]==0)
                      {
                        for(int h=0;h<control.TagCount;h++)
                        {
                          control.STATE[h] = "before";
                        }
                      }
                    }else
                    {
                        control.SKIP[resource.order[i]]--;
                        control.STATE[resource.order[i]] = "before";
                        control.BeforeIndex[resource.order[i]] = 0;
                        control.AfterIndex[resource.order[i]] = 0;
                        if(i<control.TagCount)
                        {
                          for(int h=i+1;h<control.TagCount;h++)
                          {
                            control.STATE[resource.order[h]] = "before";
                            control.BeforeIndex[resource.order[h]] = 0;
                            control.AfterIndex[resource.order[h]] = 0;
                          }
                        }
                    }
                  }else
                  {
                    resource.skip_table_head--;
                    control.STATE[resource.order[i]] = "before";
                  }
                }
              }else control.AfterIndex[resource.order[i]] = 0;
            }else
            {
              control.AfterIndex[resource.order[i]] = 0;
              control.BeforeIndex[resource.order[i]] = 0;
              control.STATE[resource.order[i]] = "before";
            }
          }else control.STATE[resource.order[i]] = "end";
        }else
        {
          control.AfterIndex[resource.order[i]] = 0;
          control.BeforeIndex[resource.order[i]] = 0;
        }
      }i++;
    }
//    if((tag.toString().compareToIgnoreCase("html")==0)&&(place.compareTo("result")==0)) control.control.CurrentResource++;
	}
  public void handleSimpleTag(HTML.Tag tag, MutableAttributeSet a, int pos)
  {
    boolean end = false;
    int i=0;
    while((i<control.TagCount)/*&&(!end)*/)
    {
      if((resource.available[resource.order[i]].compareTo("Yes")==0)&&(resource.place[resource.order[i]].compareTo(place)==0))
      {
        if(control.STATE[resource.order[i]].compareTo("before")==0)
        {
          if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i])!=null)
          {
            if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i]).type.compareTo("simple")==0)
              {
                control.BeforeIndex[resource.order[i]]++;
                if(control.getTag(resource,"before",control.BeforeIndex[resource.order[i]],resource.order[i])==null)
                {
                  if((control.tagString[resource.order[i]].compareTo("more_info_url")==0)||(control.tagString[resource.order[i]].compareTo("start_property")==0)) control.STATE[resource.order[i]] = "after";
                  else control.STATE[resource.order[i]] = "data";
                }
              }else control.BeforeIndex[resource.order[i]] = 0;
            }else control.BeforeIndex[resource.order[i]] = 0;
          }else control.STATE[resource.order[i]] = "data";
        }else
        if(control.STATE[resource.order[i]].compareTo("after")==0)
        {
          if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i])!=null)
          {
            if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i]).type.compareTo("simple")==0)
              {
                control.AfterIndex[resource.order[i]]++;
                if((control.getTag(resource,"after",control.AfterIndex[resource.order[i]],resource.order[i])==null))
                {
                  if(resource.skip_table_head==0)
                  {
                    if((control.SKIP[resource.order[i]]==0))
                    {
                      end = true;
                      if(i<control.TagCount)
                      {
                        for(int h=i+1;h<control.TagCount;h++)
                        {
                          control.STATE[resource.order[h]] = "before";
                        }
                      }
                      //ntrol.found++;
                      //control.display("Found : "+control.found+"\n");
                      if(control.tagString[resource.order[i]].compareTo("start_property")==0)
                      {
                        //product = new RareProduct(control.TagCount,control.resource);
                        control.display(control.tagString[resource.order[i]]+" :\t"+control.propertyCount+"\n");
                        control.propertyCount++;
                      }else
                      {
                        control.display(control.tagString[resource.order[i]]+" \t"+control.DATA[resource.order[i]]+"\n");//control.STATE = "data";
                        //product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                      }
                      control.STATE[resource.order[i]] = "end";
                      control.AfterIndex[resource.order[i]] = 0;
                      control.BeforeIndex[resource.order[i]] = 0;
                      if(resource.end_property==resource.order[i])
                      {
                         for(int c = 0;c<resource.tagCount;c++)
                         {
                            control.SKIP[c] = resource.skip[c];
                         }
                         if(place.compareTo("result")==0)
                         {
                            control.STATE[0] = "before";
                            for(int g=0;g<control.TagCount;g++)
                            {
                              if(resource.value[g].length()!=0)
                              {
                                control.display(control.tagString[g]+" :\t"+resource.value[g]+"\n");
                                //product.attribute[g] = control.resource.value[g];
                              }
                            }
                         }
                         //control.control.addProduct(product);
                      }
                      if(resource.order[i]==0)
                      {
                        for(int h=0;h<control.TagCount;h++)
                        {
                          control.STATE[h] = "before";
                        }
                      }
                    }else
                    {
                        control.SKIP[resource.order[i]]--;
                        control.STATE[resource.order[i]] = "before";
                        control.BeforeIndex[resource.order[i]] = 0;
                        control.AfterIndex[resource.order[i]] = 0;
                        if(i<control.TagCount)
                        {
                          for(int h=i+1;h<control.TagCount;h++)
                          {
                            control.STATE[resource.order[h]] = "before";
                            control.BeforeIndex[resource.order[h]] = 0;
                            control.AfterIndex[resource.order[h]] = 0;
                          }
                        }
                    }
                  }else
                  {
                    resource.skip_table_head--;
                    control.STATE[resource.order[i]] = "before";
                  }
                }
              }else control.AfterIndex[resource.order[i]] = 0;
            }else
            {
              control.AfterIndex[resource.order[i]] = 0;
              control.BeforeIndex[resource.order[i]] = 0;
              control.STATE[resource.order[i]] = "before";
            }
          }else control.STATE[resource.order[i]] = "end";
        }else
        {
          control.AfterIndex[resource.order[i]] = 0;
          control.BeforeIndex[resource.order[i]] = 0;
        }
      }i++;
    }
  }
  public void handleText(char[] data, int pos)
  {
    for(int i=0;i<control.TagCount;i++)
    {
      if(control.STATE[i].compareTo("data")==0)
      {
        control.DATA[i] = new String(data);
        control.STATE[i] = "after";
      }
    }
  }
}
