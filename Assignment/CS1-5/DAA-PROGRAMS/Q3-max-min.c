#include<stdio.h>
#include<stdlib.h>
#include<time.h>
int counter1=0;
int counter2=0;
void gen(int *ar, int n)
{
  srand(time(0));
  for(int i=0;i<n;i++)
  {
     *ar=rand()%10000;
     ar++;
  }
}
void display(int *ar,int n)
{
   for(int i=0;i<n;i++)
   {
       printf("%d,",*ar);
       ar++;
   }
   printf("\n");
}
void st_max_min(int A[],int p,int r,int max, int min,int mode)
{
   int i;
   max=A[p];
   min=A[p];
   for(i=0;i<r;i++)
   {
     counter1++;
     if(A[i]>max)
     {
       counter1++;
       max=A[i];
     }  
     if(A[i]<min)
     {
       counter1++;
       min=A[i];
     } 
   }
   if(mode==1)
   {
     printf("Maximum element is : %d\n Minimum element is %d \n",max,min);
   }        
}
void divide_max_min(int* A,int p,int r,int *max,int *min,int mode)
{
  int q,max1,min1;
  if(p==r)
  {
    counter2++;
    *max=A[p];
    *min=A[p];
  }  
  else if(p==(r-1))
  {
   counter2++;
   if(A[p]>A[r])
   {
     *max=A[p];
     *min=A[r];
   }
   else
   {
     *max=A[r];
     *min=A[p];
   }
 }
 else
 {
   max1=*max;
   min1=*max;
   q=(p+r)/2;
   divide_max_min(A,p,q,max,min,0);
   divide_max_min(A,q+1,r,&max1,&min1,0);
   if(max1>*max)
   { counter2++;
     *max=max1;
     }
   if(min1<*min)
   {
   counter2++;
     *min=min1;
   }    
 } 
    if (mode==1)
     printf("Maximum element is : %d\n Minimum element is %d \n",*max,*min); 
}          

void tabularCase()
{
  int max1=0,min1=0,max2=0,min2=0;
  int n;
  int *arr;
  printf("\nSl.no \t n \t\t Straight Case \t Divide Case \n");
  for(int i=1;i<=10;i++)
  {
    counter1=0;counter2=0;
     printf("%d\t",i);
     n=i*500;
     arr=(int *)malloc(n*sizeof(int));
     gen(arr,n);
     divide_max_min(arr,0,n-1,&max1,&min1,0);
     st_max_min(arr,0,n-1,max2, min2,0);
     printf("%d\t",n);
     printf("\t%d",counter1);
     printf("\t\t%d",counter2);
     printf("\n");
  }
}
int main()
{
   int max=0;
   int min=0;
   int n,c;
   printf("Enter no of terms\n");
   scanf("%d",&n);
   int *arr=(int *)malloc(n*sizeof(int));
   while(1)
   {
    printf("--------------------------------------\n MAX-MIN PROBLEM MENU \n--------------------------------------\n");
     printf(" 0. Quit \n 1.Generate n random nos. \n 2. Display \n 3. MAx-Min with Iterative Algorithm \n 4. Max-Min with DNC Algorithm \n 5. Comparison  \n Enter your choice \n");
     scanf("%d",&c);
     switch(c)
     {
        case 0: printf("Bye Bye \n");return 0;
        case 1: gen(arr,n);break;
        case 2: display(arr,n);break;
        case 3: st_max_min(arr,0,n-1,0,0,1);break;
        case 4: divide_max_min(arr,0,n-1,0,0,1);break;
        case 5: tabularCase();break;
      }
    }
   return 0;             
 }                           
