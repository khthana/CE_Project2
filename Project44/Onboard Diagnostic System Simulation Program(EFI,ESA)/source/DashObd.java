
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.lang.*;
import java.text.*;

public class DashObd extends JFrame {

    Container c = getContentPane();

	public JPanel DashPanel;
	public Component AllMeter ;
	public DrawMeter all_meter = new DrawMeter();

	private JPanel mapPanel;
	private JPanel thottlePanel;
	private JPanel rpmPanel;
	private JPanel water_tempPanel;
	private JPanel air_tempPanel;
	private JPanel o2Panel;
	private JPanel speedPanel;
	private JPanel batt_ecuPanel;
	private JPanel tt_ecuPanel;
	private JPanel inputPanel;
	private JPanel advance_basicPanel;
	private JPanel duration_basicPanel;
	private JPanel advancePanel;
	private JPanel durationPanel;

	private JLabel inputLabel;
  /**************************name elements************************************/
   private JLabel map;
   private JLabel thottle;
   private JLabel rpm;
   private JLabel water_temp;
   private JLabel air_temp;
   private JLabel o2;
   private JLabel speed;
   private JLabel batt_ecu;
   private JLabel tt_ecu;
   private JLabel advance_basic;
   private JLabel duration_basic;
   private JLabel advance;
   private JLabel duration;

/*********************************input show element**************************/
   private JTextField idl_status;
   private JTextField knk_status;
   private JTextField sta_status;
   private JTextField nsw_status;
   private JTextField ac_status;
   private JTextField igf_status;
   private JTextField bk_status;
   private JTextField mil_status;
/************************************icon elements****************************/
   private JLabel i_rpm;
   private JLabel i_thottle;
   private JLabel i_air_temp;
   private JLabel i_water_temp;


/************************************value elements***************************/
   private JTextField v_map;
   private JTextField v_thottle;
   private JTextField v_rpm;
   private JTextField v_water_temp;
   private JTextField v_air_temp;
   private JTextField v_o2;
   private JTextField v_speed;
   private JTextField v_batt_ecu;
   private JTextField v_tt_ecu;
   private JTextField v_advance_basic;
   private JTextField v_duration_basic;
   private JTextField v_advance;
   private JTextField v_duration;
/**********************************unit element*******************************/
   private JLabel u_map;
   private JLabel u_thottle;
   private JLabel u_rpm;
   private JLabel u_water_temp;
   private JLabel u_air_temp;
   private JLabel u_o2;
   private JLabel u_speed;
   private JLabel u_batt_ecu;
   private JLabel u_tt_ecu;
   private JLabel u_advance_basic;
   private JLabel u_duration_basic;
   private JLabel u_advance;
   private JLabel u_duration;

/***********************************constructor*******************************/
   public DashObd()
   {
     // super( "Testing Dash" );

		
		all_meter.draw(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
						false,false,false,false,false,false,false,false,0.0);
		AllMeter = all_meter;

		DashPanel = new JPanel();
		DashPanel.setLayout( new FlowLayout(FlowLayout.LEFT) );
/*******************crate name label for dash display***************/

	/*************thottle************/
    thottle = new JLabel("throttle");
	setlabel(thottle, 7, "Display thottle", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_thottle = new JTextField( "0",5 );

	setTextField(v_thottle, JTextField.RIGHT, false, Color.green, Color.black, 
				"verdana", Font.PLAIN, 12);

	Icon pic_thottle = new ImageIcon("hper.gif");
	i_thottle = new JLabel(pic_thottle);

	u_thottle = new JLabel("%");
	setlabel(u_thottle, 9, "Display thottle", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	thottlePanel = new JPanel();
	create(thottlePanel, thottle, v_thottle, u_thottle,i_thottle);
	   
   /*************water temp************/
	water_temp = new JLabel("water temp");
	setlabel(water_temp, 9, "Display water temp", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_water_temp = new JTextField( "0",5 );
	setTextField(v_water_temp, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	Icon pic_water = new ImageIcon("thermo.gif");
	i_water_temp = new JLabel(pic_water);

	u_water_temp = new JLabel("Degree C");
	setlabel(u_water_temp, 8, "Display water temp", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	water_tempPanel = new JPanel();
	create(water_tempPanel, water_temp, v_water_temp, u_water_temp,i_water_temp);

   /*************air temp************/
	air_temp = new JLabel("air temp");
	setlabel(air_temp, 8, "Display air temp", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_air_temp = new JTextField( "0",5 );
	setTextField(v_air_temp, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	Icon pic_air = new ImageIcon("thermo.gif");
	i_air_temp = new JLabel(pic_air);

	u_air_temp = new JLabel("Degree C");
	setlabel(u_air_temp, 8, "Display air temp", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	air_tempPanel = new JPanel();
	create(air_tempPanel, air_temp, v_air_temp, u_air_temp,i_air_temp);

	/*************rpm************/
    rpm= new JLabel("rpm");
	setlabel(rpm, 3, "Display rpm", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_rpm = new JTextField( "0", 5 );
	setTextField(v_rpm, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);
	 
	Icon pic = new ImageIcon("rpm.gif");
	i_rpm = new JLabel(pic);

	u_rpm= new JLabel("rpm");
	setlabel(u_rpm, 5, "Display rpm", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	rpmPanel = new JPanel();
	create(rpmPanel, rpm, v_rpm, u_rpm, i_rpm);

/*************************************************/
	inputPanel = new JPanel();
	inputLabel = new JLabel("STATUS");
	setlabel(inputLabel, 10, "This path show all status", Color.black, Color.gray, 
			"verdana", Font.PLAIN, 10);

/*************************************************/

   /*************idl status************/
	idl_status = new JTextField("IDLE SPEED",10);
	idl_status.setToolTipText( "This show idle speed signal status" );
	setTextField(idl_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

   /*************knk status************/
	knk_status = new JTextField("KNOCK",10);
    knk_status.setToolTipText( "This show knock signal status" );
	setTextField(knk_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

   /*************sta status************/
	sta_status = new JTextField("START",10);   
	sta_status.setToolTipText( "This show starting signal status" );
	setTextField(sta_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

   /*************nsw status************/
	nsw_status = new JTextField("NEURAL",10);
    nsw_status.setToolTipText( "This show idle gear status" );
	setTextField(nsw_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

   /*************ac status************/
	ac_status = new JTextField("A/C",10);
    ac_status.setToolTipText( "This show air condition open status" );
	setTextField(ac_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

   /*************igf status************/
	igf_status = new JTextField("IGF",10);
    igf_status.setToolTipText( "This show ignition confirm status" );
	setTextField(igf_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

   /*************bk status************/
	bk_status = new JTextField(" BRAKE",10);
    bk_status.setToolTipText( "This show brake status" );
	setTextField(bk_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

	/*************MIL********************/
	mil_status = new JTextField("MIL",10);
	mil_status.setToolTipText( "This show MIL status" );
	setTextField(mil_status, JTextField.CENTER, false, Color.black, Color.white, "verdana", Font.PLAIN, 10);

	/******************************************************************/
	create(inputPanel, inputLabel, idl_status, knk_status, sta_status, nsw_status, 
					   ac_status, igf_status, bk_status, mil_status);
	/******************************************************************/

   /*************map************/
	map = new JLabel("map");
	setlabel(map, 3, "Display advance map", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);
	
	v_map = new JTextField( "0",5 );
	setTextField(v_map, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_map = new JLabel("mBar");
	setlabel(u_map, 4, "Display map", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	mapPanel = new JPanel();
	create(mapPanel, map, v_map, u_map);

   /*************o2************/
	o2 = new JLabel("O2");
	setlabel(o2, 2, "Display O2", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_o2 = new JTextField( "0",5 );
	setTextField(v_o2, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_o2 = new JLabel("Volt");
	setlabel(u_o2, 4, "Display O2", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	o2Panel = new JPanel();
	create(o2Panel, o2, v_o2, u_o2);

   /*************speed************/
	speed = new JLabel("speed");
	setlabel(speed, 5, "Display speed", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_speed = new JTextField( "0",5 );
	setTextField(v_speed, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_speed = new JLabel("Kph");
	setlabel(u_speed, 4, "Display speed", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	speedPanel = new JPanel();
	create(speedPanel, speed, v_speed, u_speed);


   /*************batt ecu************/
	batt_ecu = new JLabel("batt ecu");
	setlabel(batt_ecu, 8, "Display batt ecu", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_batt_ecu = new JTextField( "0",5 );
	setTextField(v_batt_ecu, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_batt_ecu = new JLabel("Volt");
	setlabel(u_batt_ecu, 4, "Display batt ecu", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	batt_ecuPanel = new JPanel();
	create(batt_ecuPanel, batt_ecu, v_batt_ecu, u_batt_ecu);
	
   /*************tt ecu************/
	tt_ecu = new JLabel("tt ecu");
	setlabel(tt_ecu, 6, "Display tt ecu", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);
	
	v_tt_ecu = new JTextField( "0",5 );
	setTextField(v_tt_ecu, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_tt_ecu = new JLabel("Volt");
	setlabel(u_tt_ecu, 4, "Display tt ecu", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	tt_ecuPanel = new JPanel();
	create(tt_ecuPanel, tt_ecu, v_tt_ecu, u_tt_ecu);

 /*************advance basic************/
	advance_basic = new JLabel("advance basic");
	setlabel(advance_basic, 13, "Display advance basic", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_advance_basic = new JTextField( "0",5 );
	setTextField(v_advance_basic, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_advance_basic = new JLabel("Degree");
	setlabel(u_advance_basic, 6, "Display advance basic", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	advance_basicPanel = new JPanel();
	create(advance_basicPanel, advance_basic, v_advance_basic, u_advance_basic);

   /*************duration basic************/
	duration_basic = new JLabel("duration basic");
	setlabel(duration_basic, 14, "Display duration basic", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_duration_basic = new JTextField( "0",5 );
	setTextField(v_duration_basic, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_duration_basic = new JLabel("ms");
	setlabel(u_duration_basic, 2, "Display duration basic", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	duration_basicPanel = new JPanel();
	create(duration_basicPanel, duration_basic, v_duration_basic, u_duration_basic);

   /*************advance************/
	advance = new JLabel("advance");
	setlabel(advance, 7, "Display advance", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	v_advance = new JTextField( "0",5 );
	setTextField(v_advance, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);

	u_advance = new JLabel("Degree");
	setlabel(u_advance, 6, "Display advance", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	advancePanel = new JPanel();
	create(advancePanel, advance, v_advance, u_advance);

   /*************duration************/
	duration = new JLabel("duration");
	setlabel(duration, 8, "Display dutation", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);  
	
	v_duration = new JTextField( "0",5 );
	
	setTextField(v_duration, JTextField.RIGHT, false, Color.green, Color.black, "verdana", Font.PLAIN, 12);
	
	u_duration = new JLabel("ms");
	setlabel(u_duration, 2, "Display dutation", Color.blue, Color.lightGray, 
			"verdana", Font.PLAIN, 12);

	durationPanel = new JPanel();
	create(durationPanel, duration, v_duration, u_duration);
	
   }

	public void create(JPanel p, JLabel n, JTextField v, JLabel u){
	
	v.setHorizontalAlignment(JTextField.RIGHT);
	
	p.setLayout( new GridLayout(3,1));
	p.add(n);
	p.add(v);
	p.add(u);
	DashPanel.add(p);
	}

	public void create(JPanel p, JLabel n, JTextField v, JLabel u, JLabel i){

	v.setHorizontalAlignment(JTextField.RIGHT);
	
	GridBagLayout gbLayout;
	GridBagConstraints gbConstraints;

	gbLayout = new GridBagLayout();
	gbConstraints = new GridBagConstraints();
	p.setLayout(gbLayout);
	gbConstraints.fill = GridBagConstraints.BOTH;
	gbConstraints.anchor = GridBagConstraints.CENTER;
	
	addComp(n, gbLayout, gbConstraints, 0, 0, 1, 1, 0, 0);
	p.add(n);
	addComp(v, gbLayout, gbConstraints, 0, 1, 1, 1, 0, 0);
	p.add(v);
	addComp(u, gbLayout, gbConstraints, 0, 2, 1, 1, 0, 0);
	p.add(u);
	addComp(i, gbLayout, gbConstraints, 0, 3, 1, 1, 0, 0);
	p.add(i);

	DashPanel.add(p);
	}

	public void create(JPanel p,JLabel i, JTextField s1, JTextField s2, 
				JTextField s3, JTextField s4, JTextField s5, JTextField s6, 
				JTextField s7, JTextField s8){
	
	JPanel temp = new JPanel();
	p.setLayout( new GridLayout(9,1,5,5));
	p.add(i);
	p.add(s1);
	p.add(s2);
	p.add(s3);
	p.add(s4);
	p.add(s5);
	p.add(s6);
	p.add(s7);
	p.add(s8);
	p.setBackground(Color.lightGray);
	DashPanel.add(p);
	}

	
	public void setlabel(JLabel l, int n, String t, Color fc, Color bc, 
						String f, int st, int si){
	
	l.setHorizontalAlignment(JLabel.CENTER);
	l.setAlignmentX(n);
	l.setToolTipText( t );
	l.setForeground(fc);
	l.setBackground(bc);

	l.setFont( 
         new Font( f, st, si ) );

	}

	public void setTextField(JTextField t,int d,boolean e, Color fc, Color bc,
								String f, int st, int si){

	t.setHorizontalAlignment(d);

	t.setEditable( e );
	t.setForeground( fc );
	t.setBackground( bc );
	t.setFont( 
         new Font(  f, st, si  ) );
	}

	public void update( double d [] , boolean b [] )
		
	{
			DecimalFormat df = new DecimalFormat("#,##0");
			DecimalFormat df2 = new DecimalFormat("#,##0.00");
			
			v_map.setText(df2.format(d[0]));
			v_thottle.setText(df2.format(d[1]));
			v_rpm.setText(df.format(d[2]));
			v_water_temp.setText(df2.format(d[3]));
			v_air_temp.setText(df2.format(d[4]));
			v_o2.setText(df2.format(d[5]));
			v_speed.setText(df2.format(d[6]));
			v_batt_ecu.setText(df2.format(d[7]));
			v_tt_ecu.setText(df2.format(d[8]));
			v_duration.setText(df2.format(d[9]));
			v_duration_basic.setText(df2.format(d[10]));
			v_advance_basic.setText(df2.format(d[12]));
			v_advance.setText(df2.format(d[13]));

			all_meter.draw(d[0], d[1], d[3], d[4], d[5], d[6], d[7], d[8], d[12],
							d[10], d[13], d[9], b[0], b[1], b[2], b[3], b[4], 
							b[5], b[6], b[7], d[2]);
			if (b[0])
				idl_status.setBackground(Color.red);
			else 
				idl_status.setBackground(Color.white);

			if (b[1])
				knk_status.setBackground(Color.red);
			else 
				knk_status.setBackground(Color.white);

			if (b[2])
				sta_status.setBackground(Color.red);
			else 
				sta_status.setBackground(Color.white);

			if (b[3])
				nsw_status.setBackground(Color.red);
			else 
				nsw_status.setBackground(Color.white);

			if (b[4])
				ac_status.setBackground(Color.red);
			else 
				ac_status.setBackground(Color.white);

			if (b[5])
				igf_status.setBackground(Color.red);
			else 
				igf_status.setBackground(Color.white);

			if (b[6])
				bk_status.setBackground(Color.red);
			else 
				bk_status.setBackground(Color.white);
	
	}
	
	private void addComp(	Component c, 
						GridBagLayout gbLayout,
						GridBagConstraints gbConstraints,
						int row,
						int column,
						int numRows,
						int numColumns,
						int weightx,
						int weighty)
	{
	gbConstraints.gridx = row;
	gbConstraints.gridy = column;
	gbConstraints.gridwidth = numRows;
	gbConstraints.gridheight = numColumns;
	gbConstraints.weightx = weightx;
	gbConstraints.weighty = weighty;
	gbLayout.setConstraints(c,gbConstraints);
	}
}
