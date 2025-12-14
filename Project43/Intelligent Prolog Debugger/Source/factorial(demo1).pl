fac(X,Y) :- (X1 is X-1) , fac(X1,Y1) , (Y is X*Y1).
fac(0,1) :- true.


