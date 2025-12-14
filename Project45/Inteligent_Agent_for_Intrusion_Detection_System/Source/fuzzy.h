/***************************************************************************
                          fuzzy.h  -  description
                             -------------------
    begin                : Tue Jan 28 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/
//Find Fuzzy Per node
//Max will devide 10 then contast between fuzzyInput if it in the part of fuzzy will show
//output is fuzzy between 0-1
double fuzzy(int fuzzyInput,int MAX)
{ int i,j;
  double rangeFuzzy = 0;
  double part = MAX/10;
  if (fuzzyInput <= 0) return 0;
  else if (fuzzyInput < rangeFuzzy+part) return 0.1;
  else if (fuzzyInput < rangeFuzzy+(2*part)) return 0.2;
  else if (fuzzyInput < rangeFuzzy+(3*part)) return 0.3;
  else if (fuzzyInput < rangeFuzzy+(4*part)) return 0.4;
  else if (fuzzyInput < rangeFuzzy+(5*part)) return 0.5;
  else if (fuzzyInput < rangeFuzzy+(6*part)) return 0.6;
  else if (fuzzyInput < rangeFuzzy+(7*part)) return 0.7;
  else if (fuzzyInput < rangeFuzzy+(8*part)) return 0.8;
  else if (fuzzyInput < rangeFuzzy+(9*part)) return 0.9;
  else return 1.0;
}
