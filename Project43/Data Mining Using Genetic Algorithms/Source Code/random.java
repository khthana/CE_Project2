public class  random
{
	map mapApplet;
	int NCITY;
	int cost = 0;
	int selectedCity[];
	String result=" ";
	public random(map mapApplet,int[] selectedCity)
	{
		this.mapApplet = mapApplet;
		this.selectedCity = new int[selectedCity.length];
		for(int i=0; i<selectedCity.length;i++)						//copy selected City
				this.selectedCity[i] = selectedCity[i];		
		this.NCITY = selectedCity.length;
	}
	public void solv()
	{
		mapApplet.randomResult.clear();
		int randomCity[] = new int[NCITY];
		boolean[] visited = new boolean[NCITY];
		int city;
		int cityCount = 0;
		while(cityCount < visited.length)
		{
			city = (int) (Math.random()* NCITY );
			while(visited[city]==true)
				city = (int) (Math.random()* NCITY );
			
			randomCity[cityCount] = selectedCity[city] ;
			visited[city] = true;
			cityCount++;
		}

		int []showResult = new int [randomCity.length];
		int indexStartCity=99;
		for (int i=0;i<randomCity.length ;i++ )
			if(mapApplet.startCity == randomCity[i])
				indexStartCity = i;
		//-------------   sorting ---------------------------------------------------------//
		for(int i = 0; i < randomCity.length - indexStartCity;i++) 
			showResult[i] = randomCity[indexStartCity+i];		
		for(int i = randomCity.length-1 ; i> (randomCity.length -1) - indexStartCity ;i--) 
			showResult[i] = randomCity[indexStartCity -1-(randomCity.length-1-i)];		
	//-----------------------------------------------------------------------------------//

		String strtmp;
			for(int i = 0;i< showResult.length;i++)
			{		
				mapApplet.area = (Area) mapApplet.areas.elementAt(showResult[i]);
				strtmp = mapApplet.area.getNameProvince();
				result = Integer.toString(i+1)+". "+strtmp;
				mapApplet.randomResult.addItem(result);
			}	
			
    		findCost(randomCity);
			mapApplet.randomCostField.setText(Integer.toString(cost));
	}
	private void findCost(int path[])    //Find cost value for each chromosome
	{
		for (int i=0; i < selectedCity.length-1; i++)
		{
			int first =  path[i];
			int second = path[i+1]; 
			cost +=Distance.getDistance(first,second);
		}
			int first = path[0];
			int last =  path[selectedCity.length-1]; //if last city next distance is last city with first city
			cost +=Distance.getDistance(first,last);
    		//System.out.print("Cost = "+cost);
	}


}
