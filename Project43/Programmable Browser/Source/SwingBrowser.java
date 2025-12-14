import java.awt.event.*;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*; 
import javax.swing.text.*;
import javax.swing.text.html.*; 
import java.net.*;
import java.net.URL;
import java.io.IOException;


public class SwingBrowser  extends JFrame
{
	JEditorPane area;
	JTextField tf;
	JTextField statusbar;
	JPanel progresspanel;

	static int browserNo=0;

	public SwingBrowser (String tmpUrl) {
		browserNo++;
		setSize (800,500);
		setTitle("P R O G R A M M A B L E  B R O W S E R  3.0 ");
		area = createEditorPane();
		JScrollPane scroll = new JScrollPane (area);
		scroll.setVerticalScrollBarPolicy( JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED );
		scroll.setHorizontalScrollBarPolicy( JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED );
        scroll.setPreferredSize(new Dimension(400, 250));
        scroll.setBorder(
            BorderFactory.createCompoundBorder(
                BorderFactory.createCompoundBorder(
                                BorderFactory.createTitledBorder("Browser"),
                                BorderFactory.createEmptyBorder(5,5,5,5)),
                scroll.getBorder()));
		
		area.addHyperlinkListener(createHyperLinkListener());
		
		//-----+++++-----//
		getContentPane().setLayout(new BorderLayout() );
		tf = new JTextField();
		tf.setToolTipText("Type URL in here!");
		MyTextFieldActionListener myaction = new MyTextFieldActionListener();
		tf.addActionListener(myaction);

		getContentPane().add(tf,BorderLayout.NORTH);
		getContentPane().add(scroll);

		progresspanel = new JPanel();
		progresspanel.setLayout( new BorderLayout() );
		getContentPane().add(progresspanel,BorderLayout.SOUTH);

		statusbar = new JTextField();
		statusbar.setToolTipText("Status Bar");
		statusbar.setEditable(false);
		statusbar.setText("  Welcome to Programmable Browser ");
		statusbar.setBorder( BorderFactory.createEmptyBorder() );

		progresspanel.add(statusbar);
	
		if (!(tmpUrl.equals("")))
		{
			try
			{				
				tmpUrl = "http://" + tmpUrl;
				tf.setText(tmpUrl);
				URL helpURL = new URL(tmpUrl);
				displayURL(helpURL, area);
			}
			catch (Exception e)	{ 
				System.out.println(e); 
				statusbar.setText( "Exceptoin occurs!!!" );
			}			
		}//end if

		addWindowListener ( new WindowAdapter() 
			{
				public void windowClosing ( WindowEvent e ){
					browserNo--;
					TimerAgent ta = new TimerAgent();			
					ta.getIndex(browserNo);					
					dispose();
				}
			} 			
		);

	}//end constructor

    private JEditorPane createEditorPane() {
	    JEditorPane editorPane = new JEditorPane();
        editorPane.setEditable(false);
		editorPane.setToolTipText("Programmable Browser");
        String s = null;
        try {            
			s ="file:///d://project//browser//welcome.html";			
            URL helpURL = new URL(s);
            displayURL(helpURL, editorPane);

        } catch (Exception e) {
            System.err.println("Couldn't create help URL: " + s);
			System.out.println(e);
        }
	
        return editorPane;
    }

	private void displayURL(URL url, JEditorPane editorPane) {

        try {			
            editorPane.setPage(url);

        } catch (IOException e) {
            System.err.println("Attempted to read a bad URL: " + url);
			statusbar.setText( "  Cannot get response from this URL: "+url.toString() );
			try	{
				editorPane.setPage("file:///d://project//browser//error.html");			
			}
			catch (IOException ee)
			{	 }

        }
    }

	public HyperlinkListener createHyperLinkListener() {
	return new HyperlinkListener() {
	    public void hyperlinkUpdate(final HyperlinkEvent e) {
			if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {
				if (e instanceof HTMLFrameHyperlinkEvent) {
				((HTMLDocument)area.getDocument()).processHTMLFrameHyperlinkEvent(
					(HTMLFrameHyperlinkEvent)e);
				} else {
					try { area.setPage(e.getURL());	} 
					catch (IOException ioe) { 
						System.out.println("IOE: " + ioe); 
						statusbar.setText( "  IOException occurs!!!" );
					}
				}
				//-----//
				SwingUtilities.invokeLater( new Runnable() {
					public void run() {
					// Save original
						Document doc = area.getDocument();
						try {
							URL url = e.getURL();
							area.setPage(url);
							tf.setText (url.toString());
							statusbar.setText("  Connecting to "+url.toString() );
						} catch (IOException io) {
							JOptionPane.showMessageDialog ( new JFrame(), "Can't follow link", "Invalid Input", JOptionPane.ERROR_MESSAGE);
							area.setDocument (doc);
							statusbar.setText( "Invalid Input!!!" );
						}//end catch
					}//end run
				});
				//-----//
			}
	    }
	};
    }

	public 	class MyTextFieldActionListener implements ActionListener {
		public void actionPerformed( ActionEvent ae ){
			try
			{
				URL currentURL = new URL( tf.getText() );
				statusbar.setText("  Connecting to "+currentURL.toString() );
				displayURL(currentURL, area);				
			}
			catch (MalformedURLException m)
			{ statusbar.setText( "MalformedURLException occurs!!!" ); }

			
		}//end actionPerformed
	}//end MyTextFieldActionListener

	public static void main(String[] args) 
	{
		SwingBrowser frame = new SwingBrowser ("");
		frame.addWindowListener(new WindowAdapter(){public void windowClosing(WindowEvent e){System.exit(0);}});
		frame.show ();
	}//end main
}
