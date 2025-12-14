#include "PathFinder.h"
#include "GameObject.h"

//=========================IMPLEMENTATION========================

struct node{
	POINT point;
	int g;
	int h;
	int f;
	int minXY;
	node *parent;
};

int diff(int n, int m){
	int diff = n-m;
	if(diff<0) diff = -diff;
	return diff;
}

int PathFinder::_maxService=5;
int PathFinder::_serviceCount=_maxService;
void PathFinder::setMaxService(int max){
	_maxService = max;
}
void PathFinder::startCount(){
	_serviceCount = _maxService;
}
bool PathFinder::canServ(){
	return (_serviceCount>0)? true:false;
}
bool PathFinder::path(Path *result, const POINT *start, const POINT *goal, GameObject *traveller)
{
	_serviceCount--;
	GameMap *gm = getWorldMap();
	GameObjectMap *gom;
	POINT tmp_point;
	traveller->getLocation(&tmp_point, gom);
	node nearest;
	int loopcount=0;
	list<node *> Open;
	list<node *> Closed;
	list<node *> tmpOpen;
	int newg;
	node *sn = new node;
	sn->point.x = start->x;
	sn->point.y = start->y;
	sn->g = 0;
	sn->f = sn->h = GameMap::DistEstimate(sn->point, *goal);
	sn->parent = NULL;
	Open.push_back(sn);
	nearest.h = sn->h;
	nearest.point.x = sn->point.x;
	nearest.point.y = sn->point.y;
	while(Open.size()>0&&loopcount<50){
		loopcount++;
		{
			list<node *>::iterator current = Open.begin();
			list<node *>::iterator last = Open.end();
			while(current!=last){
				node *n = *current++;
			}
			current = Closed.begin();
			last = Closed.end();
			while(current!=last){
				node *n = *current++;
			}
		}
		list<node *>::iterator inode =  Open.end();
		node *n = *(--inode);
		Open.erase(inode);
		if(n->point.x==goal->x&&n->point.y==goal->y){
			//construct path
			list<node *>::iterator current;
			while(Closed.size()>0){
				current = Closed.begin();
				node *n = *current;
				Closed.erase(current);
				POINT p={n->point.x, n->point.y};
				result->push_back(p);
			}
			result->push_back(*goal);
			return true;
		}else{ 
			if(n->h<nearest.h){
				nearest.point.x = n->point.x;
				nearest.point.y = n->point.y;
				nearest.h = n->h;
			}
		}			
		for(int j=-1; j<=1; j++){
			for(int i=-1; i<=1; i++){
				if(i==0&&j==0) continue;
				int x = n->point.x+i;
				int y = n->point.y+j;
				if(gm->pointExist(x, y)&&gm->getPassability(x,y)&&traveller->isPlaceable(x, y, gom)){
					newg = n->g+1;
					node *nn;
					//find if in Open
					bool b_alreadyInOpen = false;
					bool b_alreadyInClosed = false;
					list<node *>::iterator current = Open.begin();
					list<node *>::iterator last = Open.end();
					while(current!=last){
						node *tmpn = *current++;
						if(tmpn->point.x==x&&tmpn->point.y==y){
							nn = tmpn;
							b_alreadyInOpen = true;
							break;
						}
					}
					if(!b_alreadyInOpen){
						//find if in Closecd
						current = Closed.begin();
						last = Closed.end();
						while(current!=last){
							node *tmpn = *current++;
 							if(tmpn->point.x==x&&tmpn->point.y==y){
								nn = tmpn;
								b_alreadyInClosed = true;
								current--;
								break;
							}
						}
					}
					if(b_alreadyInOpen||b_alreadyInClosed){
						if(nn->g<=newg)
							continue;
					}else{
						nn = new node;
						nn->point.x = x;
						nn->point.y = y;
					}
					nn->g = newg;
					nn->h = GameMap::DistEstimate(nn->point, *goal);
					nn->minXY = min(diff(nn->point.x, goal->x), diff(nn->point.y, goal->y));
					nn->f = nn->g+nn->h;
					nn->parent = n;
					if(b_alreadyInClosed)
						Closed.erase(current);
					if(!b_alreadyInOpen){
						list<node *>::iterator current = tmpOpen.begin();
						list<node *>::iterator last = tmpOpen.end();
						while(current!=last){
							node *tmpn = *current;
							if((nn->f>tmpn->f)||(nn->f==tmpn->f&&nn->minXY>tmpn->minXY)){
								tmpOpen.insert(current, nn);
								break;
							}else{
								current++;
							}
						}
						if(current==last){
							tmpOpen.push_back(nn);
						}
					}
				}
			}
		}
		Closed.push_back(n);
		while(tmpOpen.size()>0){
			list<node *>::iterator current = tmpOpen.begin();
			node *tmpn = *current;
			Open.push_back(*current);
			tmpOpen.erase(current);
		}
	}

	return path(result, start, &(nearest.point), traveller);
};
