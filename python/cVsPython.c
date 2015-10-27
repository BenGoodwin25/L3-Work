#include <stdio.h>

int main(){
	int i,j;
	double s=0;
	printf("Program in C \n");
	for (i=1;i<5;i++){
		for (j=1;j<100000000;j++){
			s+=1.0/j;
		}
		printf("Iteration %i of 4 done\n",i);
	}
}
