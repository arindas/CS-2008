#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int *generate(int , int);
void display(int *, int);

void iSort_asc(int *, int);
void iSort_desc(int *, int);

double bestCase(int *, int);
double aveCase(int *, int);
double worstCase(int *, int);

void rTime_complexity(int *, int);

void main(void){
	int ch, n, ch1, ub, *arr = NULL, i;
	char choice = 'n';
	
	do{
		system("cls");
		
		printf("-------------------------------------------------------------------------------------");
		printf("\n---------------------------------  INSERTION SORT  ----------------------------------");
		printf("\n-------------------------------------------------------------------------------------");

		printf("\n\n************************************* Main Menu *************************************\n");

		printf("\n 0. Exit.");
		printf("\n 1. n Random Numbers ==> Array.");
		printf("\n 2. Display.");
		printf("\n 3. Sort the array (asc).");
		printf("\n 4. Sort the array (desc).");
		printf("\n 5. Best case runtime complexity.");
		printf("\n 6. Average case runtime complexity.");
		printf("\n 7. Worst case runtime complexity.");
		printf("\n 8. Runtime complexity analysis table.");
		
		printf("\n\nEnter your choice : \n >> ");
		scanf("%d", &ch);
		
		switch(ch){
				case 1 : 	
				 			 printf("\nEnter how many elements : ");
							  scanf("%d", &n);
							 
							 printf("\nEnter upperbound of the value : ");
							  scanf("%d", &ub);
							  
							  arr = generate(n, ub);
							  
					 		 break;
					 
				case 2 : 	display(arr, n);
						 	break;
						 	
				case 3 : 	iSort_asc(arr, n);
						 	break;
				
				case 4 : 	iSort_desc(arr, n);
						 	break;
						 	
				case 5 : 	printf("\nBest case runtime complexity = %g secs.", bestCase(arr, n));
						 	break;
				
				case 6 : 	printf("\nAverage case runtime complexity = %g secs.", aveCase(arr, n));
						 	break;
				
				case 7 : 	printf("\nWorst case runtime complexity = %g secs.", worstCase(arr, n));
						 	break;
						 	
				case 8 : 	rTime_complexity(arr, n);
						 	break;
						 	
				case 9 : 	free(arr);
							printf("\n\n\t\t\t[Program ended : MEMORY CLEARED.]");
							exit(0);
						 	
				default : printf("\nINVALID OPTION!");		 	
		}
		
			while(getchar() != '\n');
			
				printf("\n\nWant to enter again : \n >> ");
				scanf("%c", &choice);
	
	}while((ch != 9) && (choice == 'y' || choice == 'Y'));
	
	free(arr);
	printf("\n\n\t\t\t[Program ended : MEMORY CLEARED.]");
}

void iSort_asc(int *a, int n){
	int key, i, j;
	
	for(j = 1; j < n; j++){
		key = a[j];
		i = j-1;
		
		while((key < a[i]) && i >= 0){
			a[i+1] = a[i];
			i--;
		}
		
		a[i+1] = key;
	}
}

void iSort_desc(int *a, int n){
	int key, i, j;
	
	for(j = 1; j < n; j++){
		key = a[j];
		i = j-1;
		
		while((key > a[i]) && i >= 0){
			a[i+1] = a[i];
			i--;
		}
		
		a[i+1] = key;
	}
}

void display(int *a, int n){
	int i;
	printf("\nArray : ");
		for(i = 0; i < n; i++)
	 	printf("%d ", a[i]);
}

void rTime_complexity(int *a, int n){
	double b, av, w;
	
	double sum_av = 0.0, sum_b = 0.0, sum_w = 0.0;
	
	int i, j;
	
	int *arr;
	
	printf("\n-------------------------------------------------------------------------------------");
	printf("\n\tTIME COMPLEXITY ANALYSIS TABLE\t  (Unit = Secs, Clocks per second = %d)", CLOCKS_PER_SEC);
	printf("\n-------------------------------------------------------------------------------------");
	
	printf("\n-------------------------------------------------------------------------------------");
	printf("\n\tNumber of elements\t Best case \t Average case \t   Worst case");
	printf("\n-------------------------------------------------------------------------------------");

	for(i = 5000; i <= 50000; i += 5000){
		arr = generate(i, 50000);
		
		av = aveCase(arr, i);
		b = bestCase(arr, i);
		w = worstCase(arr, i);
		
		printf("\n\t%10d\t\t%10.4f\t%10.4f\t%10.4f", i, b, av, w);
		
		sum_av += av;
		sum_b  += b;
		sum_w  += w;
	}
	
	printf("\n\n Average time taken :\n   Best case    : %0.4f secs \n   Average case : %0.4f secs \n   Worst case   : %0.4f secs", sum_b/10, sum_av/10, sum_w/10);
}

int *generate(int n, int ub){
	 srand(time(0));
	 int i;
	 
	 int *arr = calloc(n, sizeof(int));
	 for(i = 0; i < n; i++)
	 	arr[i] = rand()%ub;
	
	return arr;
}

double bestCase(int *a, int n){
	double s_time, f_time, t_time;
	
		iSort_asc(a, n);
		s_time = clock();
			iSort_asc(a, n);
		f_time = clock();
		
		t_time = (f_time - s_time)/CLOCKS_PER_SEC;
		
 return t_time;
}

double aveCase(int *a, int n){
	double s_time, f_time, t_time;
	
		s_time = clock();
			iSort_asc(a, n);
		f_time = clock();
		
		t_time = (f_time - s_time)/CLOCKS_PER_SEC;
		
 return t_time;
}

double worstCase(int *a, int n){
	double s_time, f_time, t_time;
	
		iSort_desc(a, n);
		s_time = clock();
		iSort_asc(a, n);
		f_time = clock();
		
		t_time = (f_time - s_time)/CLOCKS_PER_SEC;
		
 return t_time;
}
