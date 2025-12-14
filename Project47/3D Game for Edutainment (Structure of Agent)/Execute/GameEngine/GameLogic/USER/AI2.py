from GameEngine.GameLogic.USER.__init__ import GoalBase

class AI:
    def __init__(self):
        self.Func=GoalBase()
        self.CheckPointList=self.Func.GetPath()

        self.State=self.Func.InitState()
        self.Path=[]#compute By me Automatically

    def FindGoal(self,i):        
        if self.CheckPointList[i].Special=='Goal':
            return i
        
        if len(self.CheckPointList[i].ConnectionList)==0:
            return -1
        else:
            for j in range(0,len(self.CheckPointList[i].ConnectionList)):
                x=self.FindGoal(self.CheckPointList[i].ConnectionList[j])
                if x>=0:
                    self.Path.append(x)
                    return i
        return -1
        

    def Compute(self):
        self.Path=[]#after Pass FindGoal will Get Path to run from Goal->start
        self.FindGoal(self.Func.InitState())#First is Start So Add it too
        self.Path.append(self.Func.InitState())

        #Convert to Goal->start        
        tmp=[]
        tmp.extend(self.Path)
        length=len(self.Path)
        for i in range(0,length):#Sort Backward
            self.Path[i]=tmp[length-i+(-1)]
            
    def Run(self,Percept):#attributes for(ModelBase,Control,Percept)
        Func=self.Func
        self.Compute()#Get self.path        
        AtNode=self.Path[self.State]
        pos = self.CheckPointList[AtNode].Point
        if Func.IsReachPoint(pos,Percept)==True :   #if reach point
            self.State=Func.UpdateState(self.State,self.Path) #Update
        return Func.MoveTo(pos)
        
