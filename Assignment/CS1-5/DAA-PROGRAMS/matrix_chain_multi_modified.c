
#include<stdio.h>
#include<limits.h>

void printParenthesis(int i, int j, int n, int *bracket) 
{ 
    // If only one matrix left in current segment 
    if (i == j) 
    { 
        printf("%c",i+64); 
        return; 
    } 
  
    printf("("); 
  
    printParenthesis(i, *((bracket+i*n)+j), n, 
                     bracket); 
                     
    printParenthesis(*((bracket+i*n)+j) + 1, j, 
                     n, bracket); 
    printf(")"); 
} 
  
void matrixChainOrder(int p[], int n) 
{ 
    int m[n][n];  
    int bracket[n][n]; 
  
   // cost is zero when multiplying one matrix. 
    for (int i=1; i<n; i++) 
        m[i][i] = 0; 
  
    // L is chain length. 
    for (int L=2; L<n; L++) 
    { 
        for (int i=1; i<n-L+1; i++) 
        { 
            int j = i+L-1; 
            m[i][j] = INT_MAX; 
            for (int k=i; k<=j-1; k++) 
            { 
                // q = cost/scalar multiplications 
                int q = m[i][k] + m[k+1][j] + p[i-1]*p[k]*p[j]; 
                if (q < m[i][j]) 
                { 
                    m[i][j] = q;  
                    bracket[i][j] = k; 
                } 
            } 
        } 
    } 
  
    // The first matrix is printed as 'A' 
  
    printf("Optimal Parenthesization is : "); 
    printParenthesis(1, n-1, n, (int *)bracket); 
    printf("\nOptimal Cost is : %d\n",m[1][n-1]);
	// m table
	printf("\nNumber of multiplies in best way to parenthesize chain of matrices (M-Table) is \n");
	for(int i=1;i<n;i++)
	{
    	for(int k=1;k<i;k++)
    	  printf("    ");
		for(int j=i;j<n;j++)
	    {
	      printf("%d  ",m[i][j]);
        }
    printf("\n");
   }
   // s table 
   printf("\nOptimal locations for parentheses (S-Table)\n");
   for(int i=1;i<n;i++)
	{
    	for(int k=1;k<=i;k++)
    	 printf("  ");
		for(int j=i;j<n;j++)
	    {
	      if(bracket[i][j]==0||bracket[i][j]>5)
	        printf(" ");
	      else  
		  printf("%d ",bracket[i][j]);
        }
    printf("\n");
   }
} 
  
// Driver code 
int main() 
{ 
    int n,i;
    printf("Enter number of matrices\n");
    scanf("%d",&n);
 
    n++;
 
    int arr[n];
 
    printf("Enter dimensions \n");
 
    for(i=0;i<n;i++)
    {
        printf("Enter d%d :: ",i);
        scanf("%d",&arr[i]);
    }
 
    int size = sizeof(arr)/sizeof(arr[0]);
 
    matrixChainOrder(arr, size); 
    return 0;
}

