#ifndef MAIN_H
#define MAIN_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define MAX_SIZE 1024

int len(char* ch){
	int strlen=0;
	while(*ch != '\0'){
		strlen+=1;
		ch+=1;
	}
	return strlen;
}

void concat(char *ch1,char *ch2,char *ch3,int str1len,int str2len){
	int i=0;
	if(str1len>=str2len){
		while(*ch2 != '\0'){
			*ch3=*ch2;
			ch2+=1;
			ch3+=1;
			i+=1;
		}
		while(*ch1 != '\0'){
			*ch3=*ch1;
			ch1+=1;
			ch3+=1;
			i+=1;
		}
		*ch3='\0';
		for(i;i>0;i--){
			ch3-=1;
		}
	}else{
		while(*ch1 != '\0'){
			*ch3=*ch1;
			ch1+=1;
			ch3+=1;
			i+=1;
		}
		while(*ch2 != '\0'){
			*ch3=*ch2;
			ch2+=1;
			ch3+=1;
			i+=1;
		}
		*ch3='\0';
		for(i;i>0;i--){
			ch3-=1;
		}
	}
	printf("maintenant la chaine vaut %s\n",ch3);

}


#endif
