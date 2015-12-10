#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "tp1.h"
#define MAX_SIZE 1024

int main(int argc, char *argv[]){
	
	//PARTIE 1
	/*char* ch = malloc (12*sizeof(char));
	scanf("%s",ch);
	printf("vous avez tape : %s\n",ch);
	while(*ch != '\0'){
		printf("%c\n",*ch);
		ch++;
	}
	free (ch);*/
	//PARTIE 2
	/*char* ch1 = malloc (24*sizeof(char));
	char* ch2 = malloc (12*sizeof(char));
	scanf("%s",ch1);
	scanf("%s",ch2);
	int str1len=strlen(ch1);
	int str2len=strlen(ch2);
	if(str1len>=str2len){
		strcat(ch2,ch1);
		printf("maintenant la chaine vaut %s\n",ch2);
	}else{
		strcat(ch1,ch2);
		printf("maintenant la chaine vaut %s\n",ch1);
	}*/


	//PARTIE 3
	char* ch1 = malloc (24*sizeof(char));
	char* ch2 = malloc (24*sizeof(char));
	scanf("%s",ch1);
	scanf("%s",ch2);
	int str1len=len(ch1);
	int str2len=len(ch2);
	char* ch3 = malloc (24*sizeof(char));
	concat(ch1,ch2,ch3,str1len,str2len);

}
