public class Nearleast
{
	map mapApplet;
	int selectedCity[];
	int path[];
	int startCity,countVisit;
	int visited[]; 
	int showResult[];
	String result=" ";
	int cost = 0;
 public Nearleast(map mapApplet,int selectedCity[])
 {
			this.mapApplet = mapApplet;	
			this.selectedCity = new int[selectedCity.length];
			for(int i=0; i<selectedCity.length;i++)						//copy selected City
				this.selectedCity[i] = selectedCity[i];				
			startCity = mapApplet.startCity;
			path = new int[selectedCity.length];
			visited= new int[selectedCity.length];
			visited[countVisit] = selectedCity[0];		//First City  selected is First City is visited
 }
public void solv()
{
		mapApplet.nearleastResult.clear();
		int city,target=0,indexStartCity=99;
		int tmp;
		city = startCity;
		for(int i=0;i<selectedCity.length;i++)			//find indexStartCity
			if(selectedCity[i] == startCity)
			{
				indexStartCity = i;
				tmp = selectedCity[i];
				selectedCity[i] = selectedCity[0];
				selectedCity[0] = tmp;
			}
		//System.out.println("index = " +indexStartCity);
		//	for(int i = 0; i < selectedCity.length ; i++)
		//		System.out.print(selectedCity[i] +" ");
			selectedCity[0] +=1000;    //Init First city have visited
			path[0]=city;	 //init path
			for (int i=1;i <= selectedCity.length - 1; i++ )
			{
				//System.out.print(city);
				target = findNext(city);
				path[i] = target;
				//System.out.println("  Next target is "+target);
				city = target;
			}
			path[selectedCity.length-1] = target;
			//System.out.println("#### nearleast ####");
			//for(int i = 0; i < path.length ; i++)
			//	System.out.print(path[i] +" ");
			
			String strtmp;
			for(int i = 0;i< path.length;i++)
			{		
				mapApplet.area = (Area) mapApplet.areas.elementAt(path[i]);
				strtmp = mapApplet.area.getNameProvince();
				result = Integer.toString(i+1)+". "+strtmp;
				mapApplet.nearleastResult.addItem(result);
			}	
			findCost(path);
			mapApplet.nearleastCostField.setText(Integer.toString(cost));
}
private int findNext(int nowCity)
{
		int target = 0,min= Integer.MAX_VALUE;               //IF city is visited then will add value 1000 in selectedCity for not check it again
		int cityAdd=nowCity;		//cityAdd store city that be added 1000
			for (int i = 0;i <= selectedCity.length -1 ; i++ )
			{
					if (selectedCity[i] < 1000)   // if selectedCity[i] >= 1000 meant city is visited
						//Distance.getDistance(first,second);
						if (Distance.getDistance(nowCity,selectedCity[i]) <= min)
						//if (map[nowCity][selectedCity[i]] <= min)
						{
								min = Distance.getDistance(nowCity,selectedCity[i]);
								//min = map[nowCity][selectedCity[i]];	//Set New min distance
								target = selectedCity[i];
								cityAdd = i;
						}
			}
			selectedCity[cityAdd]+=1000;
			return target;
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