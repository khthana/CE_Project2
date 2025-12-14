
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.io.*;

import java.lang.*;
import java.util.*;
import java.util.Date.*;

import javax.swing.JTable;
import javax.swing.JScrollPane;
import javax.swing.JPanel;
import javax.swing.JFrame;
import java.awt.*;
import java.awt.event.*;
import api.*;

class TestObd	 
{

	public TestObd() {

	MenuObd menu= new MenuObd();
			
	menu.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {System.exit(0);}
        });

	}


  public static void main(String[] args) 
  {
	TestObd t = new TestObd();

  }

}
