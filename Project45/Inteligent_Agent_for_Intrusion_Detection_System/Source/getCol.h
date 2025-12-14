/***************************************************************************
                          getCol.h  -  description
                             -------------------
    begin                : Mon Feb 24 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/
// return Data have 4 cols
void returnEachCol4(char data[],char frist[], int &second, int &third, double &fourth)
{ char temp[20];
  char *endPrt;
  // Clear Parmether
  frist[0] = '\0';
  second = 0;
  third = 0;
  fourth = 0;

 // Get number to parameter
  for (int i=0, j=0, tap =1; i<=strlen(data) /*&& !(tap !=1 && data[i] == '\0')*/; i++)
  {
    if (data[i] == '\t' || data[i] == '\0')
    { temp[j] = '\0';
      switch (tap)
      { case 1 : strcpy(frist,temp); break;
        case 2 : second = atoi(temp); break;
        case 3 : third = atoi(temp); break;
        case 4 : fourth = strtod(temp,&endPrt); break;
      }
      j = 0;
      temp[j] = '\0';
      tap++;
    }
    else
    { temp[j++]  = data[i];
    }
   }

}

// return Data have 3 cols

void returnEachCol3(char data[],char frist[], int &second, double &third)
{ char temp[20];
  char *endPrt;
  // Clear Parmether
  frist[0] = '\0';
  second = 0;
  third = 0;

 // Get number to parameter
  for (int i=0, j=0, tap =1; i<=strlen(data) /*&& !(tap !=1 && data[i] == '\0')*/; i++)
  {
    if (data[i] == '\t' || data[i] == '\0')
    { temp[j] = '\0';
      switch (tap)
      { case 1 : strcpy(frist,temp); break;
        case 2 : second = atoi(temp); break;
        case 3 : third =  strtod(temp,&endPrt); break;
      }
      j = 0;
      temp[j] = '\0';
      tap++;
    }
    else
    { temp[j++]  = data[i];
    }
   }

}
// Return ID user that for using in program (1,2,3)
// and realID = return reference real ID (s2010169)
int returnID(char data[],char *realID)
{  int i,j = 0,num;
   char ID[] = "   ";
   for (i=0; i< strlen(data) && data[i] != '\t'; i++)
     ID[i] = data[i];
   realID[j++] = data[++i];
   for (++i; i< strlen(data) && isalnum(data[i]); i++)
    realID[j++] = data[i];
   realID[j] ='\0';
   num = (int) strtol(ID, (char **)NULL, 10);
   return   num ;
}
int findNum(char data[])
{ int i,j;
  int num;
  char str[4];
  for (i=0; i<strlen(data) && data[i] != '\t'; i++) ;
  for (j=0; i<strlen(data) && data[i] != '\0'; i++)
    str[j++] = data[i];
  num = (int) strtol(str, (char **)NULL, 10);
  return num;
}

// Find numID node(Frist num)
int findID(char data[])
{ char str[3];
  int num;
  for (int i=0; i<25 && data[i] != '\t' && data[i] != '\n'; i++)
    str[i] = data[i];
  num = (int) strtol(str, (char **)NULL, 10);
  return num;
}

