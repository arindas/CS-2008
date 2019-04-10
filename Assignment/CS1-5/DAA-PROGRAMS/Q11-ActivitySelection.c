#include<stdio.h>
struct Activity 
{ 
	int id,start,finish; 
};
void sort(struct Activity arr[],int n)
{
	struct Activity temp;
	for(int i=0;i<n;i++)
		for(int j=i+1;j<n;j++)
			if(arr[i].finish>arr[j].finish)
			{
				temp.start=arr[i].start;
				temp.finish=arr[i].finish;
				temp.id=arr[i].id;
				arr[i].start=arr[j].start;
				arr[i].finish=arr[j].finish;
				arr[i].id=arr[j].id;
				arr[j].start=temp.start;
				arr[j].finish=temp.finish;
				arr[j].id=temp.id;
			}
}
void printMaxActivities(struct Activity arr[], int n) 
{ 
	sort(arr,n); 
	printf("Following activities are selected \n"); 
	int i = 0; 
	printf("%d, ",arr[i].id);
	for (int j = 1; j < n; j++) 
	{ 
	if (arr[j].start >= arr[i].finish) 
	{ 
		printf("%d, ",arr[j].id); 
		i = j; 
	} 
	} 
}
int main() 
{ 
	int n;
	printf("\nEnter number of activities:");
	scanf("%d",&n);
	struct Activity arr[n];
	printf("\nEnter start and end times:");
	for(int i=0;i<n;i++)
	{
		scanf("%d %d",&arr[i].start,&arr[i].finish);
		arr[i].id=i;
	}
	printMaxActivities(arr, n); 
	return 0; 
} 
