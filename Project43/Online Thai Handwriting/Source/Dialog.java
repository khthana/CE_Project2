import java.awt.*;
import java.awt.event.*;

public class Dialog extends Windows implements ItemListener, ActionListener {
	TextField tf;
	Button button;
	Choice choice = new Choice();
	String name = "";
	String c = "";
	Dialog(int x, int y, int w, int h, String title, String chain) {
		setLayout(null);
		c = chain;
		tf = new TextField(chain,50);
		tf.setBounds(40,25,125,20);
		tf.setEditable(false);
		add(tf);
		choice.addItem("");
		choice.addItem("¡");
		choice.addItem("¢");
		choice.addItem("£");
		choice.addItem("¤");
		choice.addItem("¥");
		choice.addItem("¦");
		choice.addItem("§");
		choice.addItem("¨");
		choice.addItem("©");
		choice.addItem("ª");
		choice.addItem("«");
		choice.addItem("¬");
		choice.addItem("­");
		choice.addItem("®");
		choice.addItem("¯");
		choice.addItem("°");
		choice.addItem("±");
		choice.addItem("²");
		choice.addItem("³");
		choice.addItem("´");
		choice.addItem("µ");
		choice.addItem("¶");
		choice.addItem("·");
		choice.addItem("¸");
		choice.addItem("¹");
		choice.addItem("º");
		choice.addItem("»");
		choice.addItem("¼");
		choice.addItem("½");
		choice.addItem("¾");
		choice.addItem("¿");
		choice.addItem("À");
		choice.addItem("Á");
		choice.addItem("Â");
		choice.addItem("Ã");
		choice.addItem("Å");
		choice.addItem("Ç");
		choice.addItem("È");
		choice.addItem("É");
		choice.addItem("Ê");
		choice.addItem("Ë");
		choice.addItem("Ì");
		choice.addItem("Í");
		choice.addItem("Î");
		choice.addItem("ð");
		choice.addItem("ñ");
		choice.addItem("ò");
		choice.addItem("ó");
		choice.addItem("ô");
		choice.addItem("õ");
		choice.addItem("ö");
		choice.addItem("÷");
		choice.addItem("ø");
		choice.addItem("ù");
		choice.addItem("æ");
		choice.addItem("Ï");
		choice.addItem("à");
		choice.addItem("á");
		choice.addItem("â");
		choice.addItem("ä");
		choice.addItem("ã");
		choice.addItem("Ä");
		choice.addItem("Æ");
		choice.addItem("Ð");
		choice.addItem("Ò");
		choice.addItem("ÍØ");
		choice.addItem("ÍÙ");
		choice.addItem("ÍÔ");
		choice.addItem("ÍÕ");
		choice.addItem("ÍÖ");
		choice.addItem("Í×");
		choice.addItem("ÍÓ");
		choice.addItem("ÍÑ");
		choice.addItem("Íè");
		choice.addItem("Íé");
		choice.addItem("Íê");
		choice.addItem("Íë");
		choice.addItem("Íç");
		choice.addItem("Íì");
		choice.setBounds( 40, 45, 125, 20 );
		choice.addItemListener(this);
		add(choice);
		button = new Button( "OK" );
		button.setBounds( 80, 70, 40, 20 );
		add(button);
		button.addActionListener(this);
		Windows(300,250,200,100,"Add");
	}	
	public void windowClosed(WindowEvent e) {}
	public void windowClosing(WindowEvent e) { dispose(); }
	public void windowOpened(WindowEvent e) {}
	public void windowIconified(WindowEvent e) {}
	public void windowDeiconified(WindowEvent e) {}
	public void windowActivated(WindowEvent e) {}
	public void windowDeactivated(WindowEvent e) {}
	public void itemStateChanged(ItemEvent e) {
		if (e.getItem().equals("ñ")) { name = "Char01"; }
		if (e.getItem().equals("ò")) { name = "Char02"; }
		if (e.getItem().equals("ó")) { name = "Char03"; }
		if (e.getItem().equals("ô")) { name = "Char04"; }
		if (e.getItem().equals("õ")) { name = "Char05"; }
		if (e.getItem().equals("ö")) { name = "Char06"; }
		if (e.getItem().equals("÷")) { name = "Char07"; }
		if (e.getItem().equals("ø")) { name = "Char08"; }
		if (e.getItem().equals("ù")) { name = "Char09"; }
		if (e.getItem().equals("ð")) { name = "Char10"; }
		if (e.getItem().equals("¡")) { name = "Char11"; }
		if (e.getItem().equals("¢")) { name = "Char12"; }
		if (e.getItem().equals("£")) { name = "Char13"; }
		if (e.getItem().equals("¤")) { name = "Char14"; }
		if (e.getItem().equals("¥")) { name = "Char15"; }
		if (e.getItem().equals("¦")) { name = "Char16"; }
		if (e.getItem().equals("§")) { name = "Char17"; }
		if (e.getItem().equals("¨")) { name = "Char18"; }
		if (e.getItem().equals("©")) { name = "Char19"; }
		if (e.getItem().equals("ª")) { name = "Char20"; }
		if (e.getItem().equals("«")) { name = "Char21"; }
		if (e.getItem().equals("¬")) { name = "Char22"; }
		if (e.getItem().equals("­")) { name = "Char23"; }
		if (e.getItem().equals("®")) { name = "Char24"; }
		if (e.getItem().equals("¯")) { name = "Char25"; }
		if (e.getItem().equals("°")) { name = "Char26"; }
		if (e.getItem().equals("±")) { name = "Char27"; }
		if (e.getItem().equals("²")) { name = "Char28"; }
		if (e.getItem().equals("³")) { name = "Char29"; }
		if (e.getItem().equals("´")) { name = "Char30"; }
		if (e.getItem().equals("µ")) { name = "Char31"; }
		if (e.getItem().equals("¶")) { name = "Char32"; }
		if (e.getItem().equals("·")) { name = "Char33"; }
		if (e.getItem().equals("¸")) { name = "Char34"; }
		if (e.getItem().equals("¹")) { name = "Char35"; }
		if (e.getItem().equals("º")) { name = "Char36"; }
		if (e.getItem().equals("»")) { name = "Char37"; }
		if (e.getItem().equals("¼")) { name = "Char38"; }
		if (e.getItem().equals("½")) { name = "Char39"; }
		if (e.getItem().equals("¾")) { name = "Char40"; }
		if (e.getItem().equals("¿")) { name = "Char41"; }
		if (e.getItem().equals("À")) { name = "Char42"; }
		if (e.getItem().equals("Á")) { name = "Char43"; }
		if (e.getItem().equals("Â")) { name = "Char44"; }
		if (e.getItem().equals("Ã")) { name = "Char45"; }
		if (e.getItem().equals("Å")) { name = "Char46"; }
		if (e.getItem().equals("Ç")) { name = "Char47"; }
		if (e.getItem().equals("È")) { name = "Char48"; }
		if (e.getItem().equals("É")) { name = "Char49"; }
		if (e.getItem().equals("Ê")) { name = "Char50"; }
		if (e.getItem().equals("Ë")) { name = "Char51"; }
		if (e.getItem().equals("Ì")) { name = "Char52"; }
		if (e.getItem().equals("Í")) { name = "Char53"; }
		if (e.getItem().equals("Î")) { name = "Char54"; }
		if (e.getItem().equals("Ð")) { name = "Char55"; }
		if (e.getItem().equals("Ò")) { name = "Char56"; }
		if (e.getItem().equals("ÍÔ")) { name = "Char57"; }
		if (e.getItem().equals("ÍÕ")) { name = "Char58"; }
		if (e.getItem().equals("ÍÖ")) { name = "Char59"; }
		if (e.getItem().equals("Í×")) { name = "Char60"; }
		if (e.getItem().equals("ÍØ")) { name = "Char61"; }
		if (e.getItem().equals("ÍÙ")) { name = "Char62"; }
		if (e.getItem().equals("Íì")) { name = "Char63"; }
		if (e.getItem().equals("Íè")) { name = "Char64"; }
		if (e.getItem().equals("Íé")) { name = "Char65"; }
		if (e.getItem().equals("Íê")) { name = "Char66"; }
		if (e.getItem().equals("Íë")) { name = "Char67"; }
		if (e.getItem().equals("Íç")) { name = "Char68"; }
		if (e.getItem().equals("ÍÑ")) { name = "Char69"; }
		if (e.getItem().equals("ÍÓ")) { name = "Char70"; }
		if (e.getItem().equals("Ä")) { name = "Char71"; }
		if (e.getItem().equals("Æ")) { name = "Char72"; }
		if (e.getItem().equals("ã")) { name = "Char73"; }
		if (e.getItem().equals("ä")) { name = "Char74"; }
		if (e.getItem().equals("â")) { name = "Char75"; }
		if (e.getItem().equals("à")) { name = "Char76"; }
		if (e.getItem().equals("á")) { name = "Char77"; }
		if (e.getItem().equals("æ")) { name = "Char78"; }
		if (e.getItem().equals("Ï")) { name = "Char79"; }
	}
	public void actionPerformed(ActionEvent e) {
		File_Manage fm = new File_Manage("T.txt");
		fm.InputData(c + " : " + name + " ");
		fm.CloseFile();
		dispose();
	}
}
