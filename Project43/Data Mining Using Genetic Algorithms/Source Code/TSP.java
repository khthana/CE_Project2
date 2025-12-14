import java.util.Vector;
import java.lang.*;
public class TSP  extends Thread
{
//<------variable new
	map mapApplet;
	static final int      MAXCITY = 76;
	private static int    MAXGENERATION=100;
	private static int    NCITY=0;
	static int            MAXCHROMOSOME = 20;
	private static double PROB_CROSS = 0.5;
	private static double PROB_MUTATE = 0.2;
	private static double TOTALFITNESS;
	private static double BEST_FITNESS = 0;
	private static double BEST_COST = 0;
	private static double G = 1;
	static Chromosome BEST_CHROMOSOME;
	static Population population,current,next;
	char Cross,Mutate;		
	static int selectedCity [];
	int showResult[];
	String result=" ";
//>--------variable new
//<--------get parameter new
	public TSP(map mapApplet,int selectedCity[],char Cross,char Mutate,double Cprob,double Mprob,int popSize,int genSize,double Gval)
	{
		NCITY=0;
		BEST_FITNESS = 0;
		BEST_COST = 0;
		this.mapApplet = mapApplet;
		this.selectedCity = new int[selectedCity.length];
		this.selectedCity = selectedCity;		
		this.Cross = Cross;
		this.Mutate = Mutate;
		this.PROB_CROSS = Cprob;
		this.PROB_MUTATE = Mprob; 
		this.MAXCHROMOSOME = popSize;
		this.MAXGENERATION = genSize;
		this.G = Gval;
		mapApplet.tspFinish = false;
		//System.out.print("C prob = "+PROB_CROSS+" M prob = "+PROB_MUTATE+" Pop size = "+MAXCHROMOSOME);
	}
//>--------get parameter new
//<-------get method new
	public Chromosome getBestChromosome()
	{
		return BEST_CHROMOSOME;
	}
	public double getBestFitness()
	{
		return BEST_FITNESS;
	}
	public double getBestCost()
	{
		return BEST_COST;
	}
//<-------get method new
    public void run()
	{
        mapApplet.gaResult.clear();
		int best;
		double bestFitness=0.0;
		double averageFitness=0.0;
		Chromosome bestChromosome;
		//------- variable for sorting----------------------------------------------
		double fitness_array[]=new double[MAXCHROMOSOME];
		int sorted_array[]=new int [MAXCHROMOSOME];
	    //------- variable for scaling and selection
        double scale_fitness_array[]=new double[MAXCHROMOSOME];
		double sumfitness;
		//--------------------------------------------------------------------------
		NCITY = selectedCity.length;
		population = new Population(MAXCHROMOSOME);
		next = new Population(MAXCHROMOSOME);
		initPopulation();
		current = population;
		//<-----current report 1 new
			best = current.getBestIndividual( );
			bestChromosome = current.getBestChromosome(best);
			bestFitness = current.getBestFitness(best);
			if (bestFitness > BEST_FITNESS){
				BEST_FITNESS = bestFitness;
			    BEST_CHROMOSOME=(Chromosome) bestChromosome.clone();
                Individual bestIndividual = new Individual(BEST_CHROMOSOME);
				BEST_COST = bestIndividual.getCost();
			}
			averageFitness=current.getAverageFitness();
			//System.out.println("Best current="+bestFitness+"   Average = "+Math.rint(averageFitness)+"   Best ="+BEST_FITNESS);
			//<--------show to applete new
			mapApplet.showStatus("Generation = "+ 0 + " Best current="+bestFitness+"   Average = "+Math.rint(averageFitness)+"   Best ="+BEST_FITNESS+"   Total Distance = "+Math.rint(BEST_COST));
			for(int i=0;i<BEST_CHROMOSOME.size();i++)
			 mapApplet.city[i] = ((Integer) BEST_CHROMOSOME.elementAt(i)).intValue();	
			 //mapApplet.gaResult.appendText(result);
			 mapApplet.gaCostField.setText(Integer.toString((int) BEST_COST ));
			 mapApplet.paintMap = true;
			 mapApplet.paintPoint = false;			
			 mapApplet.paintPath = true;
			 mapApplet.repaint();
			 //>--------show to applete new
		     //>-----current report 1 new
//--------- prepare run
int number_operate=(int) Math.ceil(G*MAXCHROMOSOME);
//<-------generation loop
		for(int generation=2;generation<=MAXGENERATION;generation++){//for 1
		//<------- sorting
			// prepare sorted_array
            for(int i=0; i<MAXCHROMOSOME; i++) 
			sorted_array[i]=i;
		    // copy fitness into fitness_array
            for(int i=0; i<MAXCHROMOSOME; i++) 
			fitness_array[i]=current.getIndividual(i).getFitness();
		    // bubble sorting
            int j,pass,holdindex;
		    double hold;
		    boolean switched=true;
		    for (pass=0;pass < fitness_array.length-1 && switched==true ;pass++ )
		    {
			  switched=false;
			  for (j=0;j < fitness_array.length-pass-1;j++ )
                if (fitness_array[j] < fitness_array[j+1])
                 {
                   switched=true;
			       hold=fitness_array[j];
			       holdindex=sorted_array[j];
			       fitness_array[j]=fitness_array[j+1];
			       sorted_array[j]=sorted_array[j+1];
			       fitness_array[j+1]=hold;
			       sorted_array[j+1]=holdindex;
                 }
		     } 
	     //>------- sorting
	 //<-------non scaling        
	    // insert raw fitness to scale_fitness_array
		for (int i=0;i <MAXCHROMOSOME ; i++)
		     scale_fitness_array[i]=current.getIndividual(i).getFitness();
		// find sumfitness
	    sumfitness=0.0;
		for (int i=0;i <MAXCHROMOSOME ; i++)
		     sumfitness=scale_fitness_array[i]+sumfitness;
      //>-------non scaling
//<-------- population loop  
		  for(int i=0;i < number_operate;i++){//for 2
            int dad = select(current,scale_fitness_array,sumfitness);
		    if( (Math.random()<PROB_CROSS)&&(i<=MAXCHROMOSOME-2)){ 
			   int mom =select(current,scale_fitness_array,sumfitness);
			   switch (Cross)
			   {
			    case 'P':PMXCrossOver(current,next,dad,mom,i);
                case 'O':ODERCrossOver(current,next,dad,mom,i);
				case 'C':CSEXCrossOver(current,next,dad,mom,i);
			   }
			     //--------
				 if( Math.random()<PROB_MUTATE)  
			        switch (Mutate)
			        {
			         case '1':mutate1(next,next,i,i);
			         case '2':mutate2(next,next,i,i);
					}
	    	     //--------
			 }
			else if ( Math.random()<PROB_MUTATE){ 
			   switch (Mutate)
			        {
			         case '1':mutate1(current,next,dad,i);
			         case '2':mutate2(current,next,dad,i);
					}
	    	 }
            // copy dad to new generation for dad that not past operation only
			else{ 
			   Chromosome chromosome = current.getIndividual(dad).getChromosome(); 
			   Individual individual = new Individual(chromosome);
			   next.addChromosome(i,individual);
		    }
		  }//for 2
//>-------- population loop 
//<------------ reproduction 	
		int index=0;
		for (int i=number_operate;i < MAXCHROMOSOME ;i++)
		{
         Chromosome chromosome = current.getIndividual(sorted_array[index]).getChromosome(); 
	     Individual individual = new Individual(chromosome);
	     next.addChromosome(i,individual);
		 index=index+1;
		}
//>------------ reproduction 
		current=next;
		current.calTotalFitness();
	   //<----------current report 2 new
			best = current.getBestIndividual( );
			bestChromosome = current.getBestChromosome(best);
			bestFitness = current.getBestFitness(best);			
			if (bestFitness > BEST_FITNESS){
				BEST_FITNESS = bestFitness;
			    BEST_CHROMOSOME=(Chromosome) bestChromosome.clone();
                Individual bestIndividual = new Individual(BEST_CHROMOSOME);
				BEST_COST = bestIndividual.getCost();
			}
		for(int i=0;i<BEST_CHROMOSOME.size();i++)
			 mapApplet.city[i] = ((Integer) BEST_CHROMOSOME.elementAt(i)).intValue();	
		mapApplet.gaCostField.setText(Integer.toString((int) BEST_COST ));
		mapApplet.paintMap = true;
	    mapApplet.paintPoint = false;			
	    mapApplet.paintPath = true;
	    mapApplet.repaint();
		averageFitness=current.getAverageFitness();
		//System.out.println("Best current="+bestFitness+"   Average = "+Math.rint(averageFitness)+"   Best ="+BEST_FITNESS);
		mapApplet.showStatus("Generation = "+generation+" Best current="+bestFitness+"   Average = "+Math.rint(averageFitness)+"   Best = "+BEST_FITNESS+"   Total Distance = "+Math.rint(BEST_COST));
       //<----------current report 2 new
		}//for 1
//>-----generation loop
//------------------	Final Report new
        //System.out.println("---------------------------------------------------------------");
		//System.out.print("Best Chromosome = " );
		//printChromosome(BEST_CHROMOSOME);
		Individual bestIndividual = new Individual(BEST_CHROMOSOME);
        //System.out.println("Best Cost = "+bestIndividual.getCost()+" Best Fitness = "+bestIndividual.getFitness());		
		mapApplet.showStatus("Generation = "+MAXGENERATION +" Best current="+bestFitness+"   Average = "+Math.rint(averageFitness)+"   Best = "+BEST_FITNESS+"   Total Distance = "+Math.rint(BEST_COST));
		int tmp,indexStartCity;
		String strtmp;
		Integer startCity;
		startCity = new  Integer(mapApplet.startCity);
		indexStartCity = BEST_CHROMOSOME.indexOf(startCity);
		showResult = new int[BEST_CHROMOSOME.size()];										
        //<-------------   sorting
		for(int i = 0; i < BEST_CHROMOSOME.size() - indexStartCity;i++) 
			showResult[i] = ((Integer) BEST_CHROMOSOME.elementAt(indexStartCity+i)).intValue();		
		for(int i = BEST_CHROMOSOME.size()-1 ; i> (BEST_CHROMOSOME.size() -1) - indexStartCity ;i--) 
			showResult[i] = ((Integer) BEST_CHROMOSOME.elementAt(indexStartCity -1-(BEST_CHROMOSOME.size()-1-i))).intValue();		
        //>-------------   sorting
	    //for(int i = 0;i< BEST_CHROMOSOME.size();i++)
		//   System.out.print(showResult[i]+" ");
		
		for(int i = 0;i< BEST_CHROMOSOME.size();i++)
		{		
			mapApplet.area = (Area) mapApplet.areas.elementAt(showResult[i]);
			strtmp = mapApplet.area.getNameProvince();
			result = Integer.toString(i+1)+". "+strtmp;
			mapApplet.gaResult.addItem(result);
		}	
		
		mapApplet.gaCostField.setText(Integer.toString((int) BEST_COST ));
	    mapApplet.paintMap = true;
	    mapApplet.paintPoint = false;			
	    mapApplet.paintPath = true;
		mapApplet.repaint();	  
		mapApplet.tspFinish = true;		
	//<------final report new
	} // run
//-------------------------------------------------------------------------------
	private void initPopulation()	//Create First Generation
	{
		for (int i=0;  i <= MAXCHROMOSOME-1 ;i++ )
		{
			Chromosome chromosome = new Chromosome(NCITY);
			chromosome = getRandomChromosome();
			Individual individual = new Individual(chromosome);
			population.addChromosome(i,individual);
		}
		population.calTotalFitness();
	}
//-----------------------------------------PMXCrossOver---------------------------------------------
private void PMXCrossOver(Population current,Population next,int dad,int mom,int son)
	{
		Chromosome dadChromosome = current.getIndividual(dad).getChromosome();
		Chromosome momChromosome = current.getIndividual(mom).getChromosome();
		int point1,point2;
		boolean [] visitedDau = new boolean[MAXCITY];
		boolean [] visitedSon = new boolean[MAXCITY];
		boolean findSon,findDau,finishSon,finishDau;	
		do{			
					point1 = (int) (Math.random() * dadChromosome.size() );
					point2 = (int) (Math.random() * momChromosome.size() );
			  }	 while  ((point1 >= point2) || ((point1 == 0 )|| (point2 == dadChromosome.size()  - 1))) ;
		Chromosome sonChromosome = new Chromosome(dadChromosome.size() );
		Chromosome dauChromosome = new Chromosome(momChromosome.size() );
		for (int i=0; i< dadChromosome.size(); i++)
		{
			sonChromosome.addElement(new Integer(Integer.MAX_VALUE));
			dauChromosome.addElement(new Integer(Integer.MAX_VALUE));
		}
		for(int i=point1; i<=point2; i++)	//exchange value of dad and mom to dau and son respectively then mark it true
		{
			sonChromosome.setElementAt(momChromosome.elementAt(i), i);
			dauChromosome.setElementAt(dadChromosome.elementAt(i), i);
			visitedSon[((Integer) sonChromosome.elementAt(i)).intValue()] = true;
			visitedDau[((Integer) dauChromosome.elementAt(i)).intValue()] = true;
		}	
		for (int i = 0; i < point1; i++)	// before random region
		{	
			findDau = false;				
			findSon = false;
			finishSon = false;
			finishDau = false;
			for (int j = point1; j <= point2; j++)
			{
					if (( ((Integer) dadChromosome.elementAt(i)).intValue() == ((Integer) momChromosome.elementAt(j)).intValue() ) && (finishSon == false) )
					{	
						Integer Value;
						int Pos = j;
						Value = (Integer) dauChromosome.elementAt(Pos);
						 while (visitedSon[Value.intValue()] == true)
						{
								Pos = sonChromosome.indexOf(Value);												//son part
								Value = (Integer)dauChromosome.elementAt(Pos);								
						}
						sonChromosome.setElementAt(dadChromosome.elementAt(Pos) , i);
						findSon = true;
						finishSon = true;
					}		
					if  (( ((Integer) momChromosome.elementAt(i)).intValue() == ((Integer) dadChromosome.elementAt(j)).intValue() ) && (finishDau == false) )
					{
						Integer Value;
						int Pos = j;
						Value = (Integer) sonChromosome.elementAt(Pos);
						while (visitedDau[Value.intValue()] == true)
						{
								Pos = dauChromosome.indexOf(Value);											//dauther part
								Value = (Integer)sonChromosome.elementAt(Pos);								
						}
						dauChromosome.setElementAt(momChromosome.elementAt(Pos), i);
						findDau = true;
						finishDau = true;
					}
			  }	
			  if (findSon == false)
					sonChromosome.setElementAt(dadChromosome.elementAt(i), i);
			  if (findDau == false)
					dauChromosome.setElementAt(momChromosome.elementAt(i), i);
		}
		for (int i = point2+1; i <= dadChromosome.size() - 1; i++)			
		{	
			findDau = false;				
			findSon = false;
			finishSon = false;
			finishDau = false;
			for (int j = point1; j <= point2; j++)
			{
					if (( ((Integer) dadChromosome.elementAt(i)).intValue() == ((Integer) momChromosome.elementAt(j)).intValue() ) && (finishSon == false) )
					{	
						Integer Value;
						int Pos = j;
						Value = (Integer) dauChromosome.elementAt(Pos);
						 while (visitedSon[Value.intValue()] == true)
						{
								Pos = sonChromosome.indexOf(Value);												//son part
								Value = (Integer)dauChromosome.elementAt(Pos);								
						}
						sonChromosome.setElementAt(dadChromosome.elementAt(Pos) , i);
						findSon = true;
						finishSon = true;
					}		
					if  (( ((Integer) momChromosome.elementAt(i)).intValue() == ((Integer) dadChromosome.elementAt(j)).intValue() ) && (finishDau == false) )
					{
						Integer Value;
						int Pos = j;
						Value = (Integer) sonChromosome.elementAt(Pos);
						while (visitedDau[Value.intValue()] == true)
						{
								Pos = dauChromosome.indexOf(Value);											//dauther part
								Value = (Integer)sonChromosome.elementAt(Pos);								
						}
						dauChromosome.setElementAt(momChromosome.elementAt(Pos), i);
						findDau = true;
						finishDau = true;
					}
			  }	
			  if (findSon == false)
					sonChromosome.setElementAt(dadChromosome.elementAt(i), i);
			  if (findDau == false)
					dauChromosome.setElementAt(momChromosome.elementAt(i), i);
		}
			Individual sonIndividual,dauIndividual;
			double sonFitness,dauFitness;
			sonIndividual = new Individual(sonChromosome);
			sonFitness=sonIndividual.getFitness();
			dauIndividual = new Individual(dauChromosome);
			dauFitness=dauIndividual.getFitness();
			if(sonFitness<dauFitness){
             sonChromosome=(Chromosome) dauChromosome.clone();
			}
			sonIndividual = new Individual(sonChromosome);
			next.addChromosome(son,sonIndividual);
	}
//---------------------------------------------------------------------------------------------------
//------------------------------------------Order Crossover------------------------------------------
public void ODERCrossOver(Population current,Population next, int dad, int mom, int son) {
    Chromosome momChromosome = current.getIndividual(mom).getChromosome();
	Chromosome dadChromosome = current.getIndividual(dad).getChromosome();
	boolean [] visitedMom = new boolean[MAXCITY];
	boolean [] visitedDad = new boolean[MAXCITY];
    int point1, point2;
    do {
       point1 = (int) (Math.random() * dadChromosome.size());
       point2 = (int) (Math.random() * dadChromosome.size());
    } while ( point1 >= point2 || point1 == 0 || point2 == (dadChromosome.size()-1) );
    Chromosome sonChromosome = new Chromosome(dadChromosome.size());
    Chromosome dauChromosome = new Chromosome(momChromosome.size());
    for(int i=0; i<dadChromosome.size(); i++) {
      sonChromosome.addElement(new Integer(Integer.MAX_VALUE));
      dauChromosome.addElement(new Integer(Integer.MAX_VALUE));
    }
    // Copy middle section from parents to children
    for(int i=point1; i<=point2; i++) {
      sonChromosome.setElementAt(dadChromosome.elementAt(i), i);
      dauChromosome.setElementAt(momChromosome.elementAt(i), i);
      visitedDad[((Integer) dadChromosome.elementAt(i)).intValue()] = true;      
      visitedMom[((Integer) momChromosome.elementAt(i)).intValue()] = true;
    }
    // Copy the rest for the first child
    int i=0, j=0;
    while( i < point1 && j < momChromosome.size() ) {
      Integer gene;
      do {
	gene = (Integer) momChromosome.elementAt(j);
      } while ( j++ < momChromosome.size() && visitedDad[gene.intValue()] );
      sonChromosome.setElementAt(gene, i);
      visitedDad[gene.intValue()] = true;
      i++;
    }
    i=point2+1;
    while( i < sonChromosome.size() && j < momChromosome.size() ) {
      Integer gene;
      do {
	gene = (Integer) momChromosome.elementAt(j);
      } while ( j++ < momChromosome.size() && visitedDad[gene.intValue()] );
      sonChromosome.setElementAt(gene, i);
      visitedDad[gene.intValue()] = true;
      i++;
    }
    // Copy the rest for the second child
    i=0; j=0;
    while( i < point1 && j < dadChromosome.size() ) {
      Integer gene;
      do {
	gene = (Integer) dadChromosome.elementAt(j);
      } while ( j++ < dadChromosome.size() && visitedMom[gene.intValue()] );
      dauChromosome.setElementAt(gene, i);
      visitedMom[gene.intValue()] = true;
      i++;
    }
    i=point2+1;
    while( i < dauChromosome.size() && j < dadChromosome.size() ) {
      Integer gene;
      do {
	gene = (Integer) dadChromosome.elementAt(j);
      } while ( j++ < dadChromosome.size() && visitedMom[gene.intValue()] );
      dauChromosome.setElementAt(gene, i);
      visitedMom[gene.intValue()] = true;
      i++;
    }
      Individual sonIndividual,dauIndividual;
	  double sonFitness,dauFitness;
	  sonIndividual = new Individual(sonChromosome);
	  sonFitness=sonIndividual.getFitness();
	  dauIndividual = new Individual(dauChromosome);
	  dauFitness=dauIndividual.getFitness();
	  if(sonFitness<dauFitness){
         sonChromosome=(Chromosome) dauChromosome.clone();
	  }
      sonIndividual = new Individual(sonChromosome);
      next.addChromosome(son,sonIndividual);
  }
//-------------------------------------------------------------------------------------------------
//---------------------- CSEX Crossover -----------------------------------------------------------
private void CSEXCrossOver(Population current,Population next,int dad,int mom,int son){
    Chromosome dadChromosome = current.getIndividual(dad).getChromosome();
	Chromosome momChromosome = current.getIndividual(mom).getChromosome();
	Chromosome sonChromosome = new Chromosome(dadChromosome.size() );
	Chromosome dauChromosome = new Chromosome(momChromosome.size() );
	Chromosome tempChromosome = new Chromosome(dadChromosome.size() );
//--------------------------
     Vector vla=new Vector();
     Vector vlb=new Vector();
     Vector vra=new Vector();
     Vector vrb=new Vector();  
     int flag=0;
     int num=0;
     int len=1;
	 int i=0;
     int ra,rb,lefta,leftb,righta,rightb;
	 int la=0;
	 int lb=0;
	 lefta=0;
     righta=0;
     leftb=0;
     rightb=0;
     int maxloop=dadChromosome.size();
//------------------------------	
	do{
       if(i < maxloop){
	   la=i;
       lb=momChromosome.indexOf(dadChromosome.elementAt(i));
       }
	   if(flag==0){
	lefta=la;
	leftb=lb;
	rightb=lb;
	flag=1;
	i=i+1;
       }
       else{ //else1
	    if(Math.abs(rightb-lb)==1){
	     righta=la;
	     rightb=lb;
	     i=i+1;
	     len=len+1;
	     }
	     else{ //else2
	       if(len>1){
	       la=lefta;
	       ra=righta;
	       lb=leftb;
	       rb=rightb;
	     //--------
	       vla.addElement(new Integer(la));
	       vra.addElement(new Integer(ra));
	       vlb.addElement(new Integer(lb));
	       vrb.addElement(new Integer(rb));
	    //----------
	       num=num+1;
	       }
	       flag=0;
	       len=1;
	     } //else2
       }  //else1
     }while(i < (maxloop+1));
//-------
int temp;
int la1,la2,ra1,ra2,lb1,lb2,rb1,rb2;
int tempindex;
Individual tempIndividual;
double tempFitness;
double maxFitness1=0.0;
double maxFitness2=0.0;
sonChromosome=(Chromosome) dadChromosome.clone();
//------
if(num==0){
  tempChromosome=(Chromosome) dadChromosome.clone();
  tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	    if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
  tempChromosome=(Chromosome) momChromosome.clone();
  tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	    if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
 //-----
}
else 
  if(num==1){ // if2
      la1= ((Integer) vla.elementAt(0)).intValue();
      ra1= ((Integer) vra.elementAt(0)).intValue();
      lb1= ((Integer) vlb.elementAt(0)).intValue();
      rb1= ((Integer) vrb.elementAt(0)).intValue();
      //---------
	  if(lb1>rb1){
      temp=rb1;
      rb1=lb1;
      lb1=temp;
     }
	  //-----------
	   tempindex=la1;
	  tempChromosome=(Chromosome) dadChromosome.clone();
	   for(int x=lb1;x<=rb1;x++){
	    tempChromosome.setElementAt(momChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
      tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	    if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	  //--------
      tempindex=lb1;
	  tempChromosome=(Chromosome) momChromosome.clone();
	   for(int x=la1;x<=ra1;x++){
	    tempChromosome.setElementAt(dadChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }	
       tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	    if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
  //--------
  } // if 2
else // else 1
	{
	   if(num>2){
        int random1,random2; 
	    do
	    {
	      random1=(int) (Math.random()*num);  
	      random2=(int) (Math.random()*num);
	    } while ( random1 >= random2 || random1==num || random2==num);
		 la1= ((Integer) vla.elementAt(random1)).intValue();
         ra1= ((Integer) vra.elementAt(random1)).intValue();
         la2= ((Integer) vla.elementAt(random2)).intValue();
         ra2= ((Integer) vra.elementAt(random2)).intValue();
	     lb1= ((Integer) vlb.elementAt(random1)).intValue();
         rb1= ((Integer) vrb.elementAt(random1)).intValue();
         lb2= ((Integer) vlb.elementAt(random2)).intValue();
         rb2= ((Integer) vrb.elementAt(random2)).intValue();
	  }
      else // num==2
		{
		 la1= ((Integer) vla.elementAt(0)).intValue();
         ra1= ((Integer) vra.elementAt(0)).intValue();
         la2= ((Integer) vla.elementAt(1)).intValue();
         ra2= ((Integer) vra.elementAt(1)).intValue();
	     lb1= ((Integer) vlb.elementAt(0)).intValue();
         rb1= ((Integer) vrb.elementAt(0)).intValue();
         lb2= ((Integer) vlb.elementAt(1)).intValue();
         rb2= ((Integer) vrb.elementAt(1)).intValue();
		}
	//----------
	if(lb1>rb1){
      temp=rb1;
      rb1=lb1;
      lb1=temp;
     }
	if(lb2>rb2){
      temp=rb2;
      rb2=lb2;
      lb2=temp;
     }
	//----------   
	   tempindex=la1;
	   tempChromosome=(Chromosome) dadChromosome.clone();
	   for(int x=lb1;x<=rb1;x++){
	    tempChromosome.setElementAt(momChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	   tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	    if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	//---------
	   tempindex=la2;
	   tempChromosome=(Chromosome) dadChromosome.clone();
	   for(int x=lb2;x<=rb2;x++){
	    tempChromosome.setElementAt(momChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	   tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
		if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	//---------
	   tempindex=la1;
	   tempChromosome=(Chromosome) dadChromosome.clone();
	   for(int x=lb1;x<=rb1;x++){
	    tempChromosome.setElementAt(momChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	   tempindex=la2;
	   for(int x=lb2;x<=rb2;x++){
	    tempChromosome.setElementAt(momChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	  tempIndividual = new Individual(tempChromosome); 
	  tempFitness=tempIndividual.getFitness();
	  if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	//---------
	 tempindex=lb2;
	   tempChromosome=(Chromosome) momChromosome.clone();
	   for(int x=la2;x<=ra2;x++){
	    tempChromosome.setElementAt(dadChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	   tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	   if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	//----------
	   tempindex=lb1;
	   tempChromosome=(Chromosome) momChromosome.clone();
	   for(int x=la1;x<=ra1;x++){
	    tempChromosome.setElementAt(dadChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	   tempIndividual = new Individual(tempChromosome);
	   tempFitness=tempIndividual.getFitness();
	   if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	//---------
	   tempindex=lb2;
	   tempChromosome=(Chromosome) momChromosome.clone();
	   for(int x=la2;x<=ra2;x++){
	    tempChromosome.setElementAt(dadChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	   tempindex=lb1;
	   for(int x=la1;x<=ra1;x++){
	    tempChromosome.setElementAt(dadChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	  tempIndividual = new Individual(tempChromosome); 
	  tempFitness=tempIndividual.getFitness();
	  if(tempFitness > maxFitness1){
		  maxFitness1=tempFitness;
		  sonChromosome=(Chromosome) tempChromosome.clone();
		}
	//----------
	} //else 1
	 Individual sonIndividual = new Individual(sonChromosome);
	 next.addChromosome(son,sonIndividual);
}
//---------------------------------------------
	private Chromosome getRandomChromosome()	
	{
		Chromosome RChromosome = new Chromosome(NCITY);
		boolean[] visited = new boolean[NCITY];
		int city;
		int cityCount = 0;
		while(cityCount < visited.length)
		{
			city = (int) (Math.random()* NCITY );
			while(visited[city]==true)
			     city = (int) (Math.random()* NCITY );
			RChromosome.addElement(new Integer(selectedCity[city]));
			visited[city] = true;
			cityCount++;
		}
		return RChromosome;
	}
//--------------------------------------------
	private void printChromosome(Chromosome ch)
	{
		for(int i=0;i<ch.size();i++)
		   System.out.print( (Integer) ch.elementAt(i) +" ");
		   System.out.println("");
	}
//---------------------------------------------
	public int select(Population population,double scale_fitness_array[],double sumfitness) 
	{
		double cumulativeFitness = 0.0;
		double totalFraction = sumfitness * Math.random();
		for(int i=0; i < MAXCHROMOSOME; i++) {
			cumulativeFitness +=scale_fitness_array[i];
		    if( cumulativeFitness >= totalFraction )
			return i;
        }
        return MAXCHROMOSOME - 1;
	}
//----------------------------------------------
//<-------mutate 1
public void mutate1(Population current,Population next, int parent, int child) {
    Chromosome chromosome = current.getIndividual(parent).getChromosome();
	Chromosome tempChromosome = new Chromosome(chromosome.size());
    tempChromosome=(Chromosome) chromosome.clone();
	int point,point1,point2,temp;
	int maxpoint;
    int tempindex;
	maxpoint=chromosome.size();
    do {
       point1 = (int) (Math.random() * maxpoint );
       point2 = (int) (Math.random() * maxpoint);
    } while ( point1 == point2 || point1== maxpoint || point2== maxpoint);
    if(point1 > point2){
	 temp=point2;
	 point2=point1;
	 point1=temp;
	}
    point=(int) ((point1+point2)/2);
	tempindex=point1;
	for(int x=point2;x > point;x--){
	    chromosome.setElementAt(tempChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
	for(int x=point1;x <= point;x++){
	    chromosome.setElementAt(tempChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
    Individual sonIndividual = new Individual(chromosome);
    next.addChromosome(child,sonIndividual);
  }
//>-------mutate 1
//<--------mutate 2
public void mutate2(Population current,Population next, int parent, int child) {
	Chromosome chromosome = current.getIndividual(parent).getChromosome();
	Chromosome tempChromosome = new Chromosome(chromosome.size() );
    tempChromosome=(Chromosome) chromosome.clone();
	int point1, point2,temp;
	int maxpoint;
    int tempindex;
	maxpoint=chromosome.size();
    do {
       point1 = (int) (Math.random() * maxpoint );
       point2 = (int) (Math.random() * maxpoint);
    } while ( point1 == point2 || point1== maxpoint || point2== maxpoint);
    if(point1 > point2){
	 temp=point2;
	 point2=point1;
	 point1=temp;
	}
	tempindex=point1;
	for(int x=point2;x >= point1;x--){
	    chromosome.setElementAt(tempChromosome.elementAt(x),tempindex);        
	    tempindex=tempindex+1;
	   }
     Individual sonIndividual = new Individual(chromosome);
     next.addChromosome(child,sonIndividual);
}
//>--------mutate 2
 //---------------------------------------
}// class TSP
 
 