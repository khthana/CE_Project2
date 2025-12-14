/***************************************************************************
                          invertID.h  -  description
                             -------------------
    begin                : Tue Mar 25 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/

void invertID(int id, char ID[])
{ FILE *stream;
  char data[25];
  stream = fopen("user","r");
  while (feof(stream) == 0)
  { fgets(data,25,stream);
    if (id == returnID(data,ID)) return;
  }
  strcpy(ID,"Can't find");
}