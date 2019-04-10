// C program to demonstrate GCD Algorithms
#include <stdio.h> 

// Function to return gcd of a and b 
int euclid(int a, int b) 
{ 
	if (a == 0) 
		return b; 
	return euclid(b%a, a); 
} 

int linear(int a, int b){
	int max = a >= b? a : b;
	int gcd = 1;
	for(int i = 2; i <= max; i++){
		if(a % i == 0 && b % i == 0)
			gcd = i;
	}
	return gcd;
}

int consecutive(int m, int n){
	int t = m < n ? m : n;
	while(t > 0){
    	if(m % t == 0 & n % t == 0)
    	    return t;
		t = t - 1;
	}
}

// Driver program to test above function 
int main() 
{
	int x, y;
	printf("Enter two integers to find their GCD\n> ");
	scanf("%d", &x);
	printf("> ");
	scanf("%d", &y);
	printf("\n1. Euclidean\n2. Linear\n3. Consecutive integers\nWhich method would you like to use?\n> ");
	int ch;
	scanf("%d", &ch);
	switch(ch){
		case 1: printf("GCD : %d\n", euclid(x, y));
				break;
		case 2: printf("GCD : %d\n", linear(x, y));
				break;
		case 3: printf("GCD : %d\n", consecutive(x, y));
				break;
		default: printf("Wrong Input\n");
	}
	return 0; 
} 

