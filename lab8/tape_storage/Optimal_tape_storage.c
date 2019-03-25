#include<stdio.h>
#include<stdlib.h>

void merge(int *a, int l, int m, int r){
    int i, j, k;
    int n1 = m - l + 1;
    int n2 =  r - m;

    int L[n1], R[n2];

    for (i = 0; i < n1; i++)
        L[i] = a[l + i];
    for (j = 0; j < n2; j++)
        R[j] = a[m + 1+ j];
  
    
    i = 0; 
    j = 0; 
    k = l; 
    while (i < n1 && j < n2) 
    { 
        if (L[i] <= R[j]) 
        { 
            a[k] = L[i]; 
            i++; 
        } 
        else
        { 
            a[k] = R[j]; 
            j++; 
        } 
        k++; 
    } 
  

    while (i < n1)
    {
        a[k] = L[i];
        i++;
        k++;
    }


    while (j < n2)
    {
        a[k] = R[j];
        j++;
        k++;
    }
}
void mergeSort(int *a, int l, int r){
    if (l < r)
    {
        int m = l+(r-l)/2; 
  
        // Sort first and second halves 
        mergeSort(a, l, m); 
        mergeSort(a, m+1, r); 
  
        merge(a, l, m, r); 
    } 
}

void allot(int **t, int *p,int m, int n){
    int j=0,k=0;
    if(m>=n){
        for(int i=0; i<n; i++){
            t[i][j]=p[i];
        }
    }
    else{
        for(int i=0; i<n; i++){
            t[k][j]=p[i];
            k++;
            if(k==m){
                j++; k=0;
                }
            }
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
        for(int j=0; j<(n/m+1); j++)
            t[i][j]=0;
    }

    //Program length input
    printf("Enter program lengths : \n");
    for(int i=0;i<n;i++){
        scanf("%d",&p[i]);
        if(p[i]<=0){
            printf("Enter program length again (Negatives or zeros not allowed) : \n");
            scanf("%d",&p[i]);
        }
    }

    mergeSort(p,0,n-1);

    allot(t,p,m,n); //alloting program lengths to tapes

    //Display the lengths of programs stored on each tape
    for(int i=0; i<m; i++){

        printf("\nTape no %d : ",i+1);

        for(int j=0; t[i][j]!=0; j++){
            printf("%d ",t[i][j]);
        }
    }



}
