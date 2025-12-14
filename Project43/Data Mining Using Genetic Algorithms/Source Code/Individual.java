import java.util.Vector;

public class Individual
{
	private static final int FITNESS_SCALER = 100000000;
	private Chromosome chromosome;
	private double fitness;
	private int cost;

	public Individual(Chromosome chromosome)
	{
		this.chromosome = chromosome;
		cost = findCost(chromosome);
		fitness = findFitness(cost);
	}

	public int getCost()
	{
		return cost;
	}

	public Chromosome getChromosome( )
	{
		return chromosome;
	}

	public double getFitness()
	{
		return fitness;
	}
	
	private int findCost(Chromosome ch)    //Find cost value for each chromosome
	{
		int chromoSize = ch.size();
		int cost=0;
		for (int i=0; i < chromoSize-1; i++)
		{
			int first = ((Integer) chromosome.elementAt(i)).intValue();
			int second = ((Integer) chromosome.elementAt(i+1)).intValue(); 
			this.cost +=Distance.getDistance(first,second);
		}
			int first = ((Integer) chromosome.elementAt(chromoSize-1)).intValue();
			int last = ((Integer) chromosome.elementAt(0)).intValue(); //if last city next distance is last city with first city
			this.cost +=Distance.getDistance(first,last);
			
		return this.cost;
	}

	private double findFitness(int cost)		//Find fitness value for each chromosome
	{
		double fitness;

		if (cost == 0.0)
			this.fitness = FITNESS_SCALER;
		else 
			this.fitness = FITNESS_SCALER/cost;
		return this.fitness;
	}
}
