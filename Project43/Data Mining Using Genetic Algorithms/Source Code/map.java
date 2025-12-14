import java.applet.*;
import java.awt.*;
import java.awt.List;
import java.util.*;
import javax.swing.*;

class Area
{
	Polygon poly;
	int number;
	String nameProvince;
	Point centerProvince;
	public int npoints;
	public int[] xpoints,ypoints;
	
	public Area(Polygon poly)
	{
		this.poly = poly;	
		this.npoints = poly.npoints;
		this.xpoints = new int[this.npoints];
		this.ypoints = new int[this.npoints];
		this.xpoints = poly.xpoints;
		this.ypoints = poly.ypoints;
	}
	
	public boolean within(int x,int y)
	{
		if( this.poly.contains(x,y))
			return true;
		
		return(false);
	}

	public void setNumber(int city)
	{
		this.number = city;
	}
	
	public int getNumber( )
	{
		return this.number;
	}

	public void setNameProvince(String name)
	{
		nameProvince = name;
	}

	public String getNameProvince( )
	{
		return nameProvince;
	}

	public void setCenterProvince(Point center)
	{
		centerProvince = center;
	}

	public Point getCenterProvince( )
	{
		return centerProvince;
	}

}

public class map extends Applet 
{
	Polygon poly,path;
	public Area area;
	static final  int CITY = 76;
	public Vector areas = new Vector(CITY);
	boolean []selectedCity = new boolean[CITY];
	public static int city[];	//number of all city that is selected
	Point pathDisplay[];			//it's point of center city path that want display on applet
	Point centerPoint,startPoint;
	boolean firstCity = true;
	public static int startCity;						//No. of city that start
	public Image map,startPic,otherPic;
	double cost;

	public TSP tspThread;
	public Nearleast nearLeast;
	public random randomCity;

	Checkbox PMX,Order,CSEX,M1,M2;
	Button stopButton,startButton,allButton;
	TextField CprobField,MprobField,popField,GField,genField;	
	TextField gaCostField,nearleastCostField,randomCostField;
	
	Panel	pEast,pSouth,pSouthUp,pSouthDn;
	
	//public static TextArea gaResult,nearleastResult,randomResult;			//show result from tsp class
	public List gaResult,nearleastResult,randomResult;			//show result from tsp class
	Choice provinceChoice;
	boolean tspAlive=false;							//check Thread of tsp 
	public static boolean tspFinish;			//check tsp class finish if finish is true set by tsp
	public boolean paintMap = true,paintPoint = false,paintPath = false;  // not first paint
	
	public void init()
	{
		
		// set panel Layout
		//-----------
		this.setLayout(new BorderLayout());
		pEast=new Panel();
		pSouth=new Panel();
		pSouthUp = new Panel();
		pSouthDn = new  Panel();

		GridBagLayout gl  = new GridBagLayout();   
		GridBagConstraints gbc  = new GridBagConstraints(); 
		pEast.setLayout(gl);

		GridBagLayout gl1  = new GridBagLayout();   
		GridBagConstraints gbc1  = new GridBagConstraints(); 
		pSouth.setLayout(gl1);

		GridBagLayout gl2  = new GridBagLayout();   
		GridBagConstraints gbc2  = new GridBagConstraints(); 
		pSouthUp.setLayout(gl2);

		GridBagLayout gl3  = new GridBagLayout();   
		GridBagConstraints gbc3  = new GridBagConstraints(); 
		pSouthDn.setLayout(gl3);

		//-----------
		map = getImage(getCodeBase( ),"tourthai_map.gif");
		startPic = getImage(getCodeBase( ),"startPoint.gif");
		otherPic = getImage(getCodeBase( ),"otherPoint.gif");
		
		MediaTracker  mt = new MediaTracker(this);
		mt.addImage(map,0);
		mt.addImage(startPic,1);
		mt.addImage(otherPic,2);
		try
			{ 
			    mt.waitForID(0);
				mt.waitForID(1);
				mt.waitForID(2);
			}
		catch (Exception e) { }

		CheckboxGroup CrossGroup = new CheckboxGroup();
		PMX = new Checkbox("PMX   Crossover",CrossGroup,true);
		Order = new Checkbox("Order  Crossover",CrossGroup,false);
		CSEX = new Checkbox("CSEX  Crossover",CrossGroup,false);

		CheckboxGroup MutateGroup = new CheckboxGroup();
		M1 = new Checkbox("MPIM",MutateGroup,true);
		M2 = new Checkbox("SIM",MutateGroup,false);

		Label  blankLabel = new Label(" ");
		Label  blankLabel2 = new Label(" ");	
		Label  blankLabel3 = new Label("                   ");
		Label  blankLabel4 = new Label("                   ");
		Label  blankLabel5 = new Label("                   ");
		
		Label  crossLabel  = new Label("Crossover method");
		Label  mutateLabel = new Label("Mutate method");
		Label  CprobLabel = new Label("Prob. of Crossover less than 1"); 
		Label  MprobLabel = new Label("Prob. of Mutatation less than 1");
		Label  popLabel = new Label("Number of  Population");
		Label genLabel = new Label("Number of Generation");
		Label GLabel = new Label("G Value");
		
		Label randomCost = new Label   ("Random Cost    ");
		Label nearleastCost = new Label("       Nearlest Cost ");
        Label gaCost = new Label	   ("         GA Cost     ");
		
		CprobField = new TextField("0.8",5);
		MprobField = new TextField("0.15",5);
		popField = new TextField("30",5);
		GField = new TextField("0.5",5);
		genField = new TextField("100",5);

		gaCostField = new TextField("",10);
		nearleastCostField = new TextField("",10);
		randomCostField = new TextField("",10);

		startButton = new Button("   START   ");	
		stopButton = new Button("   STOP   ");
		allButton = new Button("   ALL    "); 

		provinceChoice = new Choice();
		provinceChoice.addItem("Bangkok");
        provinceChoice.addItem("Phra Nakhon si Ayutthaya");
		provinceChoice.addItem("Ang Thong");
        provinceChoice.addItem("Sing Buri");
        provinceChoice.addItem("ChaiNat");
		provinceChoice.addItem("Uthai Thani");
        provinceChoice.addItem("Nakhon Sawan");
		provinceChoice.addItem("Kamphaeng Phet");
        provinceChoice.addItem("Tak");
        provinceChoice.addItem("Lampang");
        provinceChoice.addItem("Lamphun");
        provinceChoice.addItem("Chiang Mai");
        provinceChoice.addItem("Mae Hong Son");
        provinceChoice.addItem("Phayao");
        provinceChoice.addItem("Chiang Rai");
        provinceChoice.addItem("Nan");
        provinceChoice.addItem("Phrae");
        provinceChoice.addItem("Uttaradit");
        provinceChoice.addItem("Sukhothai");
        provinceChoice.addItem("Phichit");
        provinceChoice.addItem("Phitsanulok");
        provinceChoice.addItem("Lop Buri");
        provinceChoice.addItem("Sara Buri");
        provinceChoice.addItem("Chaiyaphum");
        provinceChoice.addItem("Phetchabun");
        provinceChoice.addItem("Loei");
        provinceChoice.addItem("Nakhon Ratchsima");
        provinceChoice.addItem("Khon kaen");
        provinceChoice.addItem("Udon Thani");
        provinceChoice.addItem("Nong Khai");
        provinceChoice.addItem("Sakon Nakhon");
        provinceChoice.addItem("Nakhon Phanom");
        provinceChoice.addItem("Maha Sarakham");
        provinceChoice.addItem("Roi Et");
        provinceChoice.addItem("Buri Ram");
        provinceChoice.addItem("Surin");
        provinceChoice.addItem("Si Sa Ket");
        provinceChoice.addItem("Kalasin");
        provinceChoice.addItem("Yasothon");
        provinceChoice.addItem("Ubon Ratchathani");
        provinceChoice.addItem("Mukdahan");
        provinceChoice.addItem("Amnat Charoen");
        provinceChoice.addItem("Nong Bua Lam Phu");
        provinceChoice.addItem("Sa kaew");
        provinceChoice.addItem("Nakhon Nayok");
        provinceChoice.addItem("Prachin Buri");
        provinceChoice.addItem("Trat");
        provinceChoice.addItem("Chanthaburi");
        provinceChoice.addItem("Rayong");
        provinceChoice.addItem("Chonburi");
        provinceChoice.addItem("Chachoengsao");
        provinceChoice.addItem("Samut Prakan");
        provinceChoice.addItem("Suphan Buri");
        provinceChoice.addItem("Pathum Thani");
        provinceChoice.addItem("Nonthaburi");
        provinceChoice.addItem("Samut Sakhon");
        provinceChoice.addItem("Samut Songkhram");
        provinceChoice.addItem("Nakhon Pathom");
        provinceChoice.addItem("Kanchanaburi");
        provinceChoice.addItem("Ratchaburi");
        provinceChoice.addItem("Phetchaburi");
        provinceChoice.addItem("Prachuap Khiri Khun");
        provinceChoice.addItem("Chumphon");
        provinceChoice.addItem("Ranong");
        provinceChoice.addItem("Surat Thani");
        provinceChoice.addItem("Phang Nga");
        provinceChoice.addItem("Phuket");
        provinceChoice.addItem("Krabi");
        provinceChoice.addItem("Nakhon Si Thammarat");
        provinceChoice.addItem("Trang");
        provinceChoice.addItem("Phatthalung");
        provinceChoice.addItem("Songkhla");
        provinceChoice.addItem("Satun");
        provinceChoice.addItem("Pattani");
        provinceChoice.addItem("Yala");
        provinceChoice.addItem("Narathiwat");
//****
		gaResult = new List(5,true);
		nearleastResult = new List(5,true);
		randomResult = new List(5,true);
		gaResult.addItem("                  ");
		nearleastResult.addItem("                  ");
		randomResult.addItem("                  ");

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 0 ;
		gl.setConstraints(CprobLabel,gbc);
		pEast.add(CprobLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1 ;
		gbc.gridy      = 0 ;
		gl.setConstraints(CprobField,gbc); 
		pEast.add(CprobField) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 2 ;
		gbc.gridy      = 0 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(blankLabel,gbc);
		pEast.add(blankLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 1 ;
		gl.setConstraints(MprobLabel,gbc);
		pEast.add(MprobLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1 ;
		gbc.gridy      = 1 ;
		gl.setConstraints(MprobField,gbc); 
		pEast.add(MprobField) ;
		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 2 ;
		gl.setConstraints(popLabel,gbc);
		pEast.add(popLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1 ;
		gbc.gridy      = 2 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(popField,gbc); 
		pEast.add(popField) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0;
		gbc.gridy      = 3 ;
		gl.setConstraints(genLabel,gbc); 
		pEast.add(genLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1;
		gbc.gridy      = 3 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(genField,gbc); 
		pEast.add(genField) ;
		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0;
		gbc.gridy      = 4 ;
		gl.setConstraints(GLabel,gbc); 
		pEast.add(GLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1;
		gbc.gridy      = 4 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(GField,gbc); 
		pEast.add(GField) ;
		

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0;
		gbc.gridy      = 5 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(crossLabel,gbc); 
		pEast.add(crossLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 6 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(PMX,gbc); 
		pEast.add(PMX) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 7 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(Order,gbc); 
		pEast.add(Order) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 8 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(CSEX,gbc); 
		pEast.add(CSEX) ; 
		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 9 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(mutateLabel,gbc); 
		pEast.add(mutateLabel) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 10 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(M1,gbc); 
		pEast.add(M1) ; 
		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 11 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(M2,gbc); 
		pEast.add(M2) ; 
		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 12 ;
		gl.setConstraints(startButton,gbc); 
		pEast.add(startButton);

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1 ;
		gbc.gridy      = 12 ;
		//gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(stopButton,gbc); 
		pEast.add(stopButton);

		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0 ;
		gbc.gridy      = 13 ;
		//gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(blankLabel2,gbc);
		pEast.add(blankLabel2) ; 

		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 0;
		gbc.gridy      = 14;
		gl.setConstraints(provinceChoice,gbc); 
		pEast.add(provinceChoice);
		
		gbc.anchor = GridBagConstraints.NORTHWEST;
		gbc.gridx      = 1;
		gbc.gridy      = 14 ;
		gbc.gridwidth = GridBagConstraints.REMAINDER;
		gl.setConstraints(allButton,gbc); 
		pEast.add(allButton);

//------- south -------

		gbc1.anchor = GridBagConstraints.CENTER;
		gbc1.gridx      = 0;
		gbc1.gridy      = 0 ;
		gl1.setConstraints(pSouthUp,gbc1); 
		pSouth.add(pSouthUp);

		gbc1.anchor = GridBagConstraints.CENTER;
		gbc1.gridx      = 0;
		gbc1.gridy      = 1 ;
		gl1.setConstraints(pSouthDn,gbc1); 
		pSouth.add(pSouthDn);
//--------
		
//-------- southUP		
		gbc2.anchor = GridBagConstraints.WEST;
		gbc2.gridx      = 0;
		gbc2.gridy      = 0 ;
		gl2.setConstraints(randomCost,gbc2); 
		pSouthUp.add(randomCost);

		gbc2.anchor = GridBagConstraints.WEST;
		gbc2.gridx      = 1;
		gbc2.gridy      = 0 ;
		gl2.setConstraints(randomCostField,gbc2); 
		pSouthUp.add(randomCostField);

		gbc2.anchor = GridBagConstraints.WEST;
		gbc2.gridx      = 2;
		gbc2.gridy      = 0;
		gl2.setConstraints(nearleastCost,gbc2); 
		pSouthUp.add(nearleastCost);

		gbc2.anchor = GridBagConstraints.WEST;
		gbc2.gridx      = 3;
		gbc2.gridy      = 0;
		gl2.setConstraints(nearleastCostField,gbc2); 
		pSouthUp.add(nearleastCostField);

		gbc2.anchor = GridBagConstraints.WEST;
		gbc2.gridx      = 4;
		gbc2.gridy      = 0 ;
		gl2.setConstraints(gaCost,gbc2); 
		pSouthUp.add(gaCost);

		gbc2.anchor = GridBagConstraints.WEST;
		gbc2.gridx      = 5;
		gbc2.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.REMAINDER;
		gl2.setConstraints(gaCostField,gbc2); 
		pSouthUp.add(gaCostField);
//------------------------

//--------pSouthDN

		gbc3.anchor = GridBagConstraints.NORTHWEST;
		gbc3.gridx      = 0;
		gbc3.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.RELATIVE;
		gl3.setConstraints(blankLabel3,gbc3); 		
		pSouthDn.add(blankLabel3);

		gbc3.anchor = GridBagConstraints.NORTHWEST;
		gbc3.gridx      = 1;
		gbc3.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.RELATIVE;
		gl3.setConstraints(randomResult,gbc3); 		
		pSouthDn.add(randomResult);

		gbc3.anchor = GridBagConstraints.NORTHWEST;
		gbc3.gridx      = 2;
		gbc3.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.RELATIVE;
		gl3.setConstraints(blankLabel4,gbc3); 		
		pSouthDn.add(blankLabel4);

		gbc3.anchor = GridBagConstraints.NORTHWEST;
		gbc3.gridx      = 3;
		gbc3.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.RELATIVE;
		gl3.setConstraints(nearleastResult,gbc3); 
		pSouthDn.add(nearleastResult);

		gbc3.anchor = GridBagConstraints.NORTHWEST;
		gbc3.gridx      = 4;
		gbc3.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.RELATIVE;
		gl3.setConstraints(blankLabel5,gbc3); 		
		pSouthDn.add(blankLabel5);

		gbc3.anchor = GridBagConstraints.NORTHWEST;
		gbc3.gridx      = 5;
		gbc3.gridy      = 0 ;
		//gbc1.gridwidth = GridBagConstraints.REMAINDER;
		gl3.setConstraints(gaResult,gbc3); 
		pSouthDn.add(gaResult);

		//-----------
		add("East",pEast);
		add("South",pSouth);
		//-----------
		String s,name,center;
		int i;
		s = null;
		i = 0;
		do			//get  province area  from html 
		{		
			try {
					s = getParameter("Province-" + i);
					if (s != null) 
					{
						keepShape(s);				// kept each point of polygon
						area.setNumber(i);		// set number of city
					}

					name = getParameter("Name-" + i);
					if (name != null)
						area.setNameProvince(name);

					center = getParameter("Center-" + i);
					area.setCenterProvince(keepCenterPoint(center));
				  
				  } catch (Exception e) {}
				areas.addElement(area);
				i++;

		}while (s != null);

		
	}

	public void stop()
	{
		tspThread.stop();
	} 
	
	public Point keepCenterPoint(String s)
	{
		StringTokenizer st;
		int x, y;
		Point center;

		st = new StringTokenizer(s, ",");
		x = Integer.parseInt(st.nextToken());
		y = Integer.parseInt(st.nextToken());
	   center = new Point(x,y);
		return center;
	}

	public  void keepShape(String s )
	{
		
		StringTokenizer st;
		int x, y;
		Polygon poly;
		
		st = new StringTokenizer(s, ",");
		
		poly = new Polygon();
		while (st.hasMoreTokens()) {
			x = Integer.parseInt(st.nextToken());
			y = Integer.parseInt(st.nextToken());
			poly.addPoint(x, y);
		}
		area = new  Area(poly);
	}

	
	public void changeCityToCenterPoint() throws Exception
	{
		path = new Polygon();
		for( int i = 0; i < city.length ; i++)
		{
			area = (Area) areas.elementAt(city[i]);			//get area from city that is selected
			pathDisplay[i] = area.getCenterProvince();		//keep center point in pathDisplay
			path.addPoint(pathDisplay[i].x , pathDisplay[i].y);	
		}
	}

	public boolean mouseMove(Event evt, int x, int y)
	{
		boolean inside=false;		
		for (int i = 0;i < areas.size( ) - 1  ; i++) 
		{
			area = (Area) areas.elementAt(i);
			if (area.within(x,y))
			{
				showStatus(area.getNameProvince());	
				inside = true;		
			}
			else if  ( (area.within(x,y) == false )&&( inside == false) ) //if inside = true mean  it have inside once
				//showStatus("");
				showStatus("Mouse at: "+String.valueOf(x)+", "+String.valueOf(y));
		}
		
		return true;
	}

	public boolean mouseDown(Event evt, int x , int y)
	{
			if (tspFinish == true)  //clearmap  //not complete
			{
					clearmap();
					tspFinish = false;
			}
			
			else
			{
				for (int i = 0;i < areas.size( ) - 1  ; i++) 
				{
					area = (Area) areas.elementAt(i);
					if (area.within(x,y))
					{
						if (selectedCity[area.getNumber()] == true)
						{
							selectedCity[area.getNumber()] = false;		//if already choosing  that city it will  remove this point
			
							paintMap = true;
							paintPoint = false;
							paintPath = false;
							Graphics g = getGraphics(); // or someComponent.getGraphics(); 
							if(g != null) // will be null, if the component is invisible 
								paint(g);
							

							//System.out.println("-----");
							//for(int k=0; k<2; k++)
							for (int j = 0;j<selectedCity.length ;j++ )	// check city which exist selected city
							{
								if (selectedCity[j] == true)
								{
										area = (Area) areas.elementAt(j);
										centerPoint = area.getCenterProvince();
										paintMap = false;
										paintPoint = true;
										paintPath = false;
										g = getGraphics(); // or someComponent.getGraphics(); 
										if(g != null) // will be null, if the component is invisible 
										update(g);
								}
							}
						}
						else 
						{
								if (firstCity)
								{
									startPoint = area.getCenterProvince();
									startCity = area.getNumber();
									firstCity = false;
								}
								selectedCity[area.getNumber()] = true;	
								centerPoint = area.getCenterProvince();
								paintMap = false;
								paintPoint = true;
								paintPath = false;
								repaint();	
						}				
					}
				}
				
			}
			

		return true;
	}

	public boolean mouseExit(Event e, int x, int y) 
	{
		getAppletContext().showStatus("");
		return true;
    }

	public boolean action(Event evt,Object arg)
	{
		if (evt.target instanceof Button)
			HandleButtons(arg);
		
		return true;
	}

	public void HandleButtons(Object label)
	{
		char Cross='P',Mutate='1';	

		if (label == "   START   " )
		{
			paintPath = true;	
			paintMap = true;

			startButton.setLabel("   PAUSE   ");
			try{
					tspAlive = tspThread.isAlive();
				}
			catch(Exception e) 
				{ tspAlive = false; }

			if(tspAlive == false)
			{
				int count=0,num = 0;
				for (int i = 0; i <= selectedCity.length-1 ;i++)				//find number of city that is selected
					if (selectedCity[i] == true)
						count++;						
		
				//System.out.println(count);
				city = new int[count];														//new array input city
				pathDisplay = new Point[count];

				for (int i = 0; i <= selectedCity.length-1 ;i++)			//keep name of city that is selected in city[]
					if (selectedCity[i] == true)
					{
						city[num] = i;
						num++;
					}

			
				//for(int i = 0;i<=city.length-1;i++)	//show input to TSP
					//System.out.print(city[i] +" ");

				if (PMX.getState() )
					Cross = 'P';
				else if (Order.getState() )
					Cross = 'O';
				else if (CSEX.getState() )						//Check all Checkbox
					Cross = 'C';
		
				if (M1.getState() )
					Mutate = '1';
				else if (M2.getState() )
					Mutate = '2';

				double Cprob = (Double.valueOf(CprobField.getText()) ).doubleValue();
				
				double Mprob = (Double.valueOf(MprobField.getText()) ).doubleValue();			//send other config

				int popSize = Integer.parseInt(popField.getText());

				int genSize = Integer.parseInt(genField.getText());

				double Gval = (Double.valueOf(GField.getText()) ).doubleValue();

				//System.out.print("Cross" + Cross +" Mutate " + Mutate);
				//System.out.print("C prob = "+Cprob+" M prob = "+Mprob+" Pop size = "+popSize);
	//-------------------------- create instane of random,nearleast,ga---------------------.//			
				randomCity = new random(this,city);
				randomCity.solv();
				
				nearLeast = new Nearleast(this,city);
				nearLeast.solv();
					
				tspThread = new TSP(this,city,Cross,Mutate,Cprob,Mprob,popSize,genSize,Gval);		// new TSP
				tspThread.start( );
				tspAlive = true;
				
		//--------------------------------------------------------------------------------------------------.//
			}
			
			else
				tspThread.resume();
			
		}
		
		else if(label == "   PAUSE   ")
		{
			paintPath = true;	
			startButton.setLabel("   START   ");
			try{
					if (tspThread.isAlive())
							tspThread.suspend();
				}
				catch(Exception e){}
		}


		else if(label == "   STOP   ")
		{
			
				clearmap();

				try
				{
				 if(tspThread.isAlive())	
						tspThread.stop( );
				}
				catch(Exception e)
				{
					//System.out.print(e);
				}
			
				
		}

		else if (label == "   ALL    ")
		{
			if(startButton.getLabel() == "   PAUSE   ")
				startButton.setLabel("   START   ");

			startCity = provinceChoice.getSelectedIndex();
			area = (Area) areas.elementAt(provinceChoice.getSelectedIndex());
			startPoint = area.getCenterProvince();	
			firstCity = false;

			for(int j = 0; j <2; j++)	//if do it once not work then paint twice
				for (int i = 0;i < areas.size( ) - 1  ; i++) 
				{
					
					if (firstCity)
					{
							startPoint = area.getCenterProvince();
							//System.out.print("X = "+startPoint.x+ " Y = "+startPoint.y);
							firstCity = false;
 					}
				
					selectedCity[i] = true;
					area = (Area) areas.elementAt(i);
					centerPoint = area.getCenterProvince();
					paintMap = false;
					paintPoint = true;
					paintPath = false;
				
					Graphics g = getGraphics(); // or someComponent.getGraphics(); 
					if(g != null) // will be null, if the component is invisible 
						update(g);
				}
		}
	}
	
	public void clearmap()
	{
			
			paintMap = true;
			paintPoint = false;
			paintPath = false;
			firstCity = true;
			repaint();
			
			
			startButton.setLabel("   START   ");
			for(int i = 0;i<=selectedCity.length-1;i++)			//Clear city array
				selectedCity[i] = false;
			
	}

	public void paint(Graphics g)
	{
		if (paintMap == true)
		{
			//System.out.print(" Map");
			g.drawImage(map,0,0,this);
		}

		if (paintPoint == true)
		{
			
					if ( (startPoint.x == centerPoint.x)&&(startPoint.y == centerPoint.y) )
						g.drawImage(startPic,centerPoint.x-3,centerPoint.y-2,this);
					else 
						g.drawImage(otherPic,centerPoint.x-3,centerPoint.y-2,this);	
		}

		if (paintPath == true)	// in the first time display only map
			{
			try
				{
					changeCityToCenterPoint();
					g.drawPolygon(path);
				}
				catch(Exception e){
					
				}
			}
		
	}

	public void update(Graphics g) 
	{		
			paint(g);
	}
}
