from GameEngine.GameLogic.USER.__init__ import ModelBaseReflex
class AI:
    def __init__(self):#Get Map Path
        #Setting
        self.Func=ModelBaseReflex()
        self.ModelBase=self.Func.GetPath()
        self.State=self.Func.InitState()

    def Run(self,Percept):
        Func=self.Func                              #Use Library
        pos = self.ModelBase[self.State]            #Get Current Point
        if Func.IsReachPoint(pos,Percept)==True :   #if reach point
            self.State=Func.UpdateState(self.State) #Update
        return Func.MoveTo(pos)
