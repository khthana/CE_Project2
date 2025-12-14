
//Title:        Your Product Name
//Version:      
//Copyright:    Copyright (c) 1999
//Author:       bank
//Company:      KMIT'L
//Description:  Your description

package Spider2;

import java.awt.*;

public class ControlServerInterface extends Frame {
  TextArea status = new TextArea();
  List TimeList = new List();
  Label label1 = new Label();
  TextField hour = new TextField(2);
  TextField miniutes = new TextField(2);
  Label label2 = new Label();
  Button apply = new Button();
  TextField sec = new TextField(2);
  Label minLabel = new Label();
  Label secLabel = new Label();
  Label hourLabel = new Label();
  TextField crawler = new TextField();
  TextField formattor = new TextField();
  Label CrawlerLabel = new Label();
  Label FormattorLabel = new Label();
  Button addSpider = new Button();
  Button addSearch = new Button();
  Button removeTime = new Button();
  Label label3 = new Label();
  TextField every = new TextField();
  Label label4 = new Label();
  Button removeall = new Button();

  public ControlServerInterface() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    this.setTitle("Control Server");
    status.setBounds(new Rectangle(4, 158, 392, 138));
    this.setLayout(null);
    TimeList.setBounds(new Rectangle(5, 48, 143, 107));
    label1.setBounds(new Rectangle(21, 27, 109, 17));
    label1.setAlignment(1);
    label1.setText("Time List");
    hour.setBounds(new Rectangle(157, 39, 24, 22));
    miniutes.setBounds(new Rectangle(185, 39, 24, 22));
    label2.setBounds(new Rectangle(163, 21, 42, 16));
    label2.setAlignment(1);
    label2.setText("Time");
    apply.setBounds(new Rectangle(245, 35, 94, 24));
    apply.setLabel("Apply Time");
    sec.setBounds(new Rectangle(214, 39, 24, 22));
    minLabel.setBounds(new Rectangle(357, 23, 19, 21));
    secLabel.setBounds(new Rectangle(375, 23, 19, 21));
    hourLabel.setBounds(new Rectangle(338, 23, 19, 21));
    crawler.setBounds(new Rectangle(355, 60, 30, 21));
    formattor.setBounds(new Rectangle(355, 93, 30, 20));
    CrawlerLabel.setBounds(new Rectangle(300, 60, 56, 20));
    CrawlerLabel.setAlignment(2);
    CrawlerLabel.setText("Crawler No.");
    FormattorLabel.setText("Formattor No.");
    FormattorLabel.setAlignment(2);
    FormattorLabel.setBounds(new Rectangle(289, 93, 66, 20));
    addSpider.setBounds(new Rectangle(156, 72, 84, 22));
    addSpider.setLabel("Add Spider Task");
    addSearch.setLabel("Add Search Task");
    addSearch.setBounds(new Rectangle(156, 100, 84, 22));
    removeTime.setBounds(new Rectangle(246, 72, 44, 21));
    removeTime.setLabel("Remove");
    label3.setBounds(new Rectangle(232, 130, 39, 20));
    label3.setName("Every :");
    label3.setAlignment(2);
    label3.setText("Every :");
    every.setBounds(new Rectangle(275, 132, 58, 20));
    every.setText("0");
    label4.setBounds(new Rectangle(341, 134, 46, 16));
    label4.setText("minutes");
    removeall.setBounds(new Rectangle(156, 127, 76, 24));
    removeall.setLabel("remove all");
    this.add(status, null);
    this.add(TimeList, null);
    this.add(label1, null);
    this.add(label2, null);
    this.add(hour, null);
    this.add(miniutes, null);
    this.add(sec, null);
    this.add(secLabel, null);
    this.add(minLabel, null);
    this.add(hourLabel, null);
    this.add(crawler, null);
    this.add(formattor, null);
    this.add(apply, null);
    this.add(addSearch, null);
    this.add(addSpider, null);
    this.add(removeTime, null);
    this.add(FormattorLabel, null);
    this.add(CrawlerLabel, null);
    this.add(every, null);
    this.add(label3, null);
    this.add(label4, null);
    this.add(removeall, null);
  }
}                                   
