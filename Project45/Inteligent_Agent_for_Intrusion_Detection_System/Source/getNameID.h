/***************************************************************************
                          getNameID.h  -  description
                             -------------------
    begin                : Thu Mar 20 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/
int returnID(char,char);
void getNameFileID(char real2[][15], int numUser1) //get Name for File ID
// // real ID User
{ int i;
  FILE *UserID;
  char data[20];
  char realID[9];
  int ID;

  for (i=0; i<numUser1; i++)
  {  strcpy(real2[i],"USER/");
  }
 // cout<<"aa"<<endl;
 // Get ID in array real2[] --------
  UserID = fopen("user","r");
  for (i=1; i<numUser1 && (feof(UserID) == 0) ; i++)
  { fgets(data,20,UserID);
   // cout<<data<<endl;
    ID = returnID(data,realID) ;
    strcat(real2[ID],realID);
   // cout<<real2[ID]<<endl;
  
  }          
  fclose(UserID);
//  cout<<"aa"<<endl;
}