package Spider2;
import java.awt.event.*;
import java.awt.*;
import java.net.URL;
import java.io.*;
import java.net.MalformedURLException;
import javax.swing.text.*;
import javax.swing.text.html.*;
import javax.swing.text.html.parser.*;
import Sagent.MTThai;
public class MyParser extends HTMLEditorKit.ParserCallback
{
  String place;
  Crawler control;
  RareProduct product;
	MyParser(Crawler control,String place)
	{
    this.place = place;
    this.control = control;
	}
  MyParser(Crawler control,String place,RareProduct product){
    this.place = place;
    this.control = control;
    this.product =  product;
  }
	public void handleStartTag(HTML.Tag tag,MutableAttributeSet attribute_set, int pos)
	{
    boolean end = false;
    int i=0;
    while((i<control.TagCount)/*&&(!end)*/)
    {
      if((control.resource.available[control.resource.order[i]].compareTo("Yes")==0)&&(control.resource.place[control.resource.order[i]].compareTo(place)==0))
      {
        if(control.STATE[control.resource.order[i]].compareTo("before")==0)
        {
          if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i])!=null)
          {
            if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              //if(attribute_set.toString().toUpperCase().compareTo(control.getTag("before",control.BeforeIndex).attribute_set.toUpperCase())==0)
              //if(attribute_set.isEqual(control.getTag("before",control.BeforeIndex).attribute_set))
              /*if(control.getTag(control.resource,"before",control.BeforeIndex[i],i).attribute_set.containsAttributes(attribute_set))
              {        */
                  control.BeforeIndex[control.resource.order[i]]++;
                  if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i])==null)
                  {
                    if((control.control.tagString[control.resource.order[i]].compareTo("more_info_url")==0)||(control.control.tagString[control.resource.order[i]].compareTo("start_property")==0)) control.STATE[control.resource.order[i]] = "after";
                    else control.STATE[control.resource.order[i]] = "data";
                  }
              //}else control.BeforeIndex[i] = 0;
            }else control.BeforeIndex[control.resource.order[i]] = 0;
          }else control.STATE[control.resource.order[i]] = "data";
        }else
        if(control.STATE[control.resource.order[i]].compareTo("after")==0)
        {
          if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i])!=null)
          {
            if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              //if(attribute_set.toString().toUpperCase().compareTo(control.getTag("after",control.AfterIndex).attribute_set.toUpperCase())==0)
              //if(attribute_set.isEqual(control.getTag("after",control.AfterIndex).attribute_set))

              /*if(control.getTag(control.resource,"after",control.AfterIndex[i],i).attribute_set.containsAttributes(attribute_set))
              {    */
                control.AfterIndex[control.resource.order[i]]++;
                if((control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i])==null))
                {
                  if(control.resource.skip_table_head==0)
                  {
                    if((control.SKIP[control.resource.order[i]]==0))
                    {
                      end = true;
                      if(i<control.TagCount)
                      {
                        for(int h=i+1;h<control.TagCount;h++)
                        {
                          control.STATE[control.resource.order[h]] = "before";
                        }
                      }
                      control.found++;
                      //control.display("Found : "+control.found+"\n");
                      if(control.control.tagString[control.resource.order[i]].compareTo("more_info_url")==0)
                      {
                          //Do something with attribute set
                          control.DATA[control.resource.order[i]] = (String)attribute_set.getAttribute(new HTML().getAttributeKey("href"));
                          product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                          if(!control.DATA[control.resource.order[i]].startsWith("http://"))
                          {
                            control.DATA[control.resource.order[i]] = control.resource.local_site + control.DATA[control.resource.order[i]];
                          }
                          control.display(control.control.tagString[control.resource.order[i]]+" :\t"+control.DATA[control.resource.order[i]]+"\n");//control.STATE = "data";                        
                          try{
                            control.getURL(new URL(control.DATA[control.resource.order[i]]),"C:\\tomcat\\webapps\\ROOT\\crawler\\crawler"+control.CrawlerNo+"_"+control.linkCount+".html");
                            MyParser myParserExtend = null;
		                        ParserDelegator pdExtend;
		                        pdExtend = new ParserDelegator();
                            myParserExtend = new MyParser(control,"extend",product);
                          	pdExtend.parse(new InputStreamReader(new URL("http://161.246.5.185:8080/crawler/crawler"+control.CrawlerNo+"_"+control.linkCount+".html").openStream()),myParserExtend,true);
                          }catch(MalformedURLException e){
                            control.output.Display.append("Malform Exception\n");
                          }catch(Exception e){
                            control.output.Display.append("Exception");
                          }
                          control.linkCount++;
                      }else
                      if(control.control.tagString[control.resource.order[i]].compareTo("start_property")==0)
                      {
                        product = new RareProduct(control.TagCount,control.resource);
                        control.display(control.control.tagString[control.resource.order[i]]+" :\t"+control.propertyCount+"\n");
                        control.propertyCount++;
                      }else
                      {
                        control.display(control.control.tagString[control.resource.order[i]]+" :\t"+control.DATA[control.resource.order[i]]+"\n");//control.STATE = "data";
                        product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                      }
                      control.STATE[control.resource.order[i]] = "end";
                      control.AfterIndex[control.resource.order[i]] = 0;
                      control.BeforeIndex[control.resource.order[i]] = 0;
                      if(control.resource.end_property==control.resource.order[i])
                      {
                          for(int c = 0;c<control.resource.tagCount;c++)
                          {
                            control.SKIP[c] = control.resource.skip[c];
                          }
                          if(place.compareTo("result")==0)
                          {
                            control.STATE[0] = "before";
                            for(int g=0;g<control.TagCount;g++)
                            {
                              if(control.resource.value[g].length()!=0)
                              {
                                control.display(control.control.tagString[g]+" :\t"+control.resource.value[g]+"\n");
                                product.attribute[g] = control.resource.value[g];
                              }
                            }
                          }
                          control.control.addProduct(product);
                      }
                      if(control.resource.order[i]==0)
                      {
                        for(int h=0;h<control.TagCount;h++)
                        {
                          control.STATE[h] = "before";
                        }
                      }
                    }else
                    {
                        control.SKIP[control.resource.order[i]]--;
                        control.STATE[control.resource.order[i]] = "before";
                        control.BeforeIndex[control.resource.order[i]] = 0;
                        control.AfterIndex[control.resource.order[i]] = 0;
                        if(i<control.TagCount)
                        {
                          for(int h=i+1;h<control.TagCount;h++)
                          {
                            control.STATE[control.resource.order[h]] = "before";
                            control.BeforeIndex[control.resource.order[h]] = 0;
                            control.AfterIndex[control.resource.order[h]] = 0;
                          }
                        }
                    }
                  }else
                  {
                    control.resource.skip_table_head--;
                    control.STATE[control.resource.order[i]] = "before";
                  }
                }
              //}else control.AfterIndex[i] = 0;
            }else
            {
              control.AfterIndex[control.resource.order[i]] = 0;
              control.BeforeIndex[control.resource.order[i]] = 0;
              control.STATE[control.resource.order[i]] = "before";
            }
          }else control.STATE[control.resource.order[i]] = "end";
        }else
        {
          control.AfterIndex[control.resource.order[i]] = 0;
          control.BeforeIndex[control.resource.order[i]] = 0;
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
      if((control.resource.available[control.resource.order[i]].compareTo("Yes")==0)&&(control.resource.place[control.resource.order[i]].compareTo(place)==0))
      {
        if(control.STATE[control.resource.order[i]].compareTo("before")==0)
        {
          if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i])!=null)
          {
            if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i]).type.compareTo("close")==0)
              {
                control.BeforeIndex[control.resource.order[i]]++;
                if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i])==null)
                {
                  if((control.control.tagString[control.resource.order[i]].compareTo("more_info_url")==0)||(control.control.tagString[control.resource.order[i]].compareTo("start_property")==0)) control.STATE[control.resource.order[i]] = "after";
                  else control.STATE[control.resource.order[i]] = "data";
                }
              }else control.BeforeIndex[control.resource.order[i]] = 0;
            }else control.BeforeIndex[control.resource.order[i]] = 0;
          }else control.STATE[control.resource.order[i]] = "data";
        }else
        if(control.STATE[control.resource.order[i]].compareTo("after")==0)
        {
          if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i])!=null)
          {
            if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i]).type.compareTo("close")==0)
              {
                control.AfterIndex[control.resource.order[i]]++;
                if((control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i])==null))
                {
                  if(control.resource.skip_table_head==0)
                  {
                    if((control.SKIP[control.resource.order[i]]==0))
                    {
                      end = true;
                      if(i<control.TagCount)
                      {
                        for(int h=i+1;h<control.TagCount;h++)
                        {
                          control.STATE[control.resource.order[h]] = "before";
                        }
                      }
                      control.found++;
                      //control.display("Found : "+control.found+"\n");
                      if(control.control.tagString[control.resource.order[i]].compareTo("start_property")==0)
                      {
                        product = new RareProduct(control.TagCount,control.resource);
                        control.display(control.control.tagString[control.resource.order[i]]+" :\t"+control.propertyCount+"\n");
                        control.propertyCount++;
                      }else
                      {
                        control.display(control.control.tagString[control.resource.order[i]]+" :\t"+control.DATA[control.resource.order[i]]+"\n");//control.STATE = "data";
                        product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                      }
                      control.STATE[control.resource.order[i]] = "end";
                      control.AfterIndex[control.resource.order[i]] = 0;
                      control.BeforeIndex[control.resource.order[i]] = 0;
                      if(control.resource.end_property==control.resource.order[i])
                      {
                         for(int c = 0;c<control.resource.tagCount;c++)
                         {
                            control.SKIP[c] = control.resource.skip[c];
                         }
                         if(place.compareTo("result")==0)
                         {
                            control.STATE[0] = "before";
                            for(int g=0;g<control.TagCount;g++)
                            {
                              if(control.resource.value[g].length()!=0)
                              {
                                control.display(control.control.tagString[g]+" :\t"+control.resource.value[g]+"\n");
                                product.attribute[g] = control.resource.value[g];
                              }
                            }
                         }
                         control.control.addProduct(product);
                      }
                      if(control.resource.order[i]==0)
                      {
                        for(int h=0;h<control.TagCount;h++)
                        {
                          control.STATE[h] = "before";
                        }
                      }
                    }else
                    {
                        control.SKIP[control.resource.order[i]]--;
                        control.STATE[control.resource.order[i]] = "before";
                        control.BeforeIndex[control.resource.order[i]] = 0;
                        control.AfterIndex[control.resource.order[i]] = 0;
                        if(i<control.TagCount)
                        {
                          for(int h=i+1;h<control.TagCount;h++)
                          {
                            control.STATE[control.resource.order[h]] = "before";
                            control.BeforeIndex[control.resource.order[h]] = 0;
                            control.AfterIndex[control.resource.order[h]] = 0;
                          }
                        }
                    }
                  }else
                  {
                    control.resource.skip_table_head--;
                    control.STATE[control.resource.order[i]] = "before";
                  }
                }
              }else control.AfterIndex[control.resource.order[i]] = 0;
            }else
            {
              control.AfterIndex[control.resource.order[i]] = 0;
              control.BeforeIndex[control.resource.order[i]] = 0;
              control.STATE[control.resource.order[i]] = "before";
            }
          }else control.STATE[control.resource.order[i]] = "end";
        }else
        {
          control.AfterIndex[control.resource.order[i]] = 0;
          control.BeforeIndex[control.resource.order[i]] = 0;
        }
      }i++;
    }
    if((tag.toString().compareToIgnoreCase("html")==0)&&(place.compareTo("result")==0)) control.control.CurrentResource++;
	}
  public void handleSimpleTag(HTML.Tag tag, MutableAttributeSet a, int pos)
  {
    boolean end = false;
    int i=0;
    while((i<control.TagCount)/*&&(!end)*/)
    {
      if((control.resource.available[control.resource.order[i]].compareTo("Yes")==0)&&(control.resource.place[control.resource.order[i]].compareTo(place)==0))
      {
        if(control.STATE[control.resource.order[i]].compareTo("before")==0)
        {
          if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i])!=null)
          {
            if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i]).type.compareTo("simple")==0)
              {
                control.BeforeIndex[control.resource.order[i]]++;
                if(control.getTag(control.resource,"before",control.BeforeIndex[control.resource.order[i]],control.resource.order[i])==null)
                {
                  if((control.control.tagString[control.resource.order[i]].compareTo("more_info_url")==0)||(control.control.tagString[control.resource.order[i]].compareTo("start_property")==0)) control.STATE[control.resource.order[i]] = "after";
                  else control.STATE[control.resource.order[i]] = "data";
                }
              }else control.BeforeIndex[control.resource.order[i]] = 0;
            }else control.BeforeIndex[control.resource.order[i]] = 0;
          }else control.STATE[control.resource.order[i]] = "data";
        }else
        if(control.STATE[control.resource.order[i]].compareTo("after")==0)
        {
          if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i])!=null)
          {
            if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i]).name.compareToIgnoreCase(tag.toString())==0)
            {
              if(control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i]).type.compareTo("simple")==0)
              {
                control.AfterIndex[control.resource.order[i]]++;
                if((control.getTag(control.resource,"after",control.AfterIndex[control.resource.order[i]],control.resource.order[i])==null))
                {
                  if(control.resource.skip_table_head==0)
                  {
                    if((control.SKIP[control.resource.order[i]]==0))
                    {
                      end = true;
                      if(i<control.TagCount)
                      {
                        for(int h=i+1;h<control.TagCount;h++)
                        {
                          control.STATE[control.resource.order[h]] = "before";
                        }
                      }
                      control.found++;
                      //control.display("Found : "+control.found+"\n");
                      if(control.control.tagString[control.resource.order[i]].compareTo("start_property")==0)
                      {
                        product = new RareProduct(control.TagCount,control.resource);
                        control.display(control.control.tagString[control.resource.order[i]]+" :\t"+control.propertyCount+"\n");
                        control.propertyCount++;
                      }else
                      {
                        control.display(control.control.tagString[control.resource.order[i]]+" \t"+control.DATA[control.resource.order[i]]+"\n");//control.STATE = "data";
                        product.attribute[control.resource.order[i]] = control.DATA[control.resource.order[i]];
                      }
                      control.STATE[control.resource.order[i]] = "end";
                      control.AfterIndex[control.resource.order[i]] = 0;
                      control.BeforeIndex[control.resource.order[i]] = 0;
                      if(control.resource.end_property==control.resource.order[i])
                      {
                         for(int c = 0;c<control.resource.tagCount;c++)
                         {
                            control.SKIP[c] = control.resource.skip[c];
                         }
                         if(place.compareTo("result")==0)
                         {
                            control.STATE[0] = "before";
                            for(int g=0;g<control.TagCount;g++)
                            {
                              if(control.resource.value[g].length()!=0)
                              {
                                control.display(control.control.tagString[g]+" :\t"+control.resource.value[g]+"\n");
                                product.attribute[g] = control.resource.value[g];
                              }
                            }
                         }
                         control.control.addProduct(product);
                      }
                      if(control.resource.order[i]==0)
                      {
                        for(int h=0;h<control.TagCount;h++)
                        {
                          control.STATE[h] = "before";
                        }
                      }
                    }else
                    {
                        control.SKIP[control.resource.order[i]]--;
                        control.STATE[control.resource.order[i]] = "before";
                        control.BeforeIndex[control.resource.order[i]] = 0;
                        control.AfterIndex[control.resource.order[i]] = 0;
                        if(i<control.TagCount)
                        {
                          for(int h=i+1;h<control.TagCount;h++)
                          {
                            control.STATE[control.resource.order[h]] = "before";
                            control.BeforeIndex[control.resource.order[h]] = 0;
                            control.AfterIndex[control.resource.order[h]] = 0;
                          }
                        }
                    }
                  }else
                  {
                    control.resource.skip_table_head--;
                    control.STATE[control.resource.order[i]] = "before";
                  }
                }
              }else control.AfterIndex[control.resource.order[i]] = 0;
            }else
            {
              control.AfterIndex[control.resource.order[i]] = 0;
              control.BeforeIndex[control.resource.order[i]] = 0;
              control.STATE[control.resource.order[i]] = "before";
            }
          }else control.STATE[control.resource.order[i]] = "end";
        }else
        {
          control.AfterIndex[control.resource.order[i]] = 0;
          control.BeforeIndex[control.resource.order[i]] = 0;
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
