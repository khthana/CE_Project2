public class Population
{
	Individual generation[];
	int maxChromosome;
	double totalFitness;
	double averageFitness;

	public Population(int maxCh)
	{	
		maxChromosome = maxCh;
		generation = new Individual[maxChromosome];
	}

	public void addChromosome(int i,Individual ind)
	{
		generation[i] = ind;
	}

	public Individual getIndividual(int i)
	{
		return generation[i];
	}

	public void calTotalFitness( )
	{
		totalFitness=0.0;
		averageFitness=0.0;
		for (int i =0 ; i<= maxChromosome-1 ; i++ )
		  totalFitness += generation[i].getFitness( );
	    averageFitness=totalFitness/maxChromosome;
	     
	}

	public double getTotalFitness( )
	{
		return totalFitness;
	}

	public double getAverageFitness()
    {
        return averageFitness;
    }    	
	
	public int getBestIndividual( )
	{
		int bestIndividual = Integer.MAX_VALUE;
		double fitness = 0;
		for (int i =0 ; i<= maxChromosome-1 ; i++ )
				if ( fitness < generation[i].getFitness( ) )
				{
						fitness =  generation[i].getFitness( );
						bestIndividual = i;
				}
		return bestIndividual;
	}
	
	public Chromosome getBestChromosome(int i)
	{
		Chromosome chromosome;
		chromosome = generation[i].getChromosome( ) ;
		return chromosome;
	}

	public double getBestFitness(int i)
	{
		double bestFitness;
		bestFitness = generation[i].getFitness( ) ;
		return bestFitness;
	}
	
	public void printPopulation( )
	{
		for(int i = 0; i <= maxChromosome-1 ; i++)//{
				printChromosome(generation[i].getChromosome( ) );
				
		//		System.out.print(generation[i].getFitness( )+"   ");	
		//		System.out.println(generation[i].getCost( ) );
		
		//}	
	}

	private void printChromosome(Chromosome ch)
	{
		for(int i=0;i<ch.size();i++)
			System.out.print( (Integer) ch.elementAt(i) +" ");
		System.out.println("");
	}
}
