#include <stdio.h>
#include <iostream.h>

#define SIZE 300

void fill_matrix(int m[SIZE][SIZE],int SIZEb)

{

  int n=0;

  int i, j;

  for (i=0; i<SIZEb; i++)

    for (j=0; j<SIZEb; j++)

      m[i][j] = n++;

}

void print_matrix(int m[SIZE][SIZE],int SIZEb)

{

  int i, j = 0;

  for (i=0; i<SIZEb; i++) {

    printf("\n\t| ");

    for (j=0; j<SIZEb; j++)

      printf("%5d ", m[i][j]);

    printf("|");

  }

}

int main()
{
	int SIZEa;
	int A[SIZE][SIZE], B[SIZE][SIZE], C[SIZE][SIZE];
	int i ,j ,k;
	int from, to;
	
	printf("Please in put SIZE : ");
	cin >> SIZEa;

	from = 0;
	to = SIZEa;

	 fill_matrix(A,SIZEa);
     fill_matrix(B,SIZEa);
	  
	 for (i=from; i<to; i++)
	 {
		 for (j=from; j<to; j++)
		 {
			 C[i][j] = 0;
			 for (k=0; k<to; k++)
				C[i][j] += A[i][k]*B[k][j];
		 }
	 }

		 
    printf("\n\n");

    print_matrix(A,SIZEa);

  printf("\n\n\t       * \n");

   print_matrix(B,SIZEa);

  printf("\n\n\t       = \n");

    print_matrix(C,SIZEa);

    printf("\n\n");

  return 0;
}