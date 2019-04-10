#include<stdio.h>
#include<stdlib.h>

int partition_asc(int * arr, int p ,int r)
{
	int x = arr[r];
	int i = p-1;
	int temp;
	for(int j=p;j<=r-1;j++)
	{
		if (arr[j]<=x)
		{
			i = i+1;
			temp = arr[i];
			arr[i] = arr[j];
			arr[j] = temp;
		}
	}
	i= i+1;
	temp = arr[i];
	arr[i] = arr[r];
	arr[r] = temp;
	return i;
}

void quicksort_asc(int * arr,int p, int r)
{
	if(p<r)
	{
		int q = partition_asc(arr,p,r);
		quicksort_asc(arr,p,q-1);
		quicksort_asc(arr,q+1,r);
	}
}
void allot(int **t, int *p,int m, int n){
        for(int i=0; i<n; i++){
            t[i%m][i/m]=p[i];
        }
}

void main(){
    
    int m,n;
    printf("Enter number of tapes :");
    scanf("%d",&m);
    printf("Enter number of programs :");
    scanf("%d",&n);

    //declaring tape matrix and program array
    int **t = (int **)malloc(m * sizeof(int *));
    for(int i=0; i<m; i++){
        t[i] = (int *)malloc(((n/m)+1) * sizeof(int));
    }

    int p[n];

    //Initializing tape lengths to 0.
    for(int i=0;i<m;i++){
        for(int j=0; j<((n/m)+1); j++)
            t[i][j]=0;
    }

    //Program length input
    printf("Enter program lengths : \n");
    for(int i=0;i<n;i++){
        scanf("%d",&p[i]);
    }

    quicksort_asc(p,0,n-1);

    allot(t,p,m,n); //alloting program lengths to tapes

    //Display the lengths of programs stored on each tape
    for(int i=0; i<m; i++){

        printf("\nTape no %d : ",i+1);

        for(int j=0; j <= n/m && t[i][j]!=0; j++){
            printf("%d ",t[i][j]);
        }
    }

