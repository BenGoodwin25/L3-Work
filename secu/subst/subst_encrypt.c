#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void deleteDoubloon(char *self){
	size_t size=strlen(self);
	int i,j,k=0;
	for(i=0;i<size-1;i++){
		for(j=i+1;j<size-1;j++){
			if(self[i]==self[j] && j<size-1){
				self[k]==self[i];
				memmove( self+j,self+j+1, (size-j* sizeof *self));
				j+=1;
			}
		}
	}
}

void createSubstTab(char *tabCipher,char *tabinit,char *key, size_t size){
	int i;
	for(i=0;i<size;i++){
		tabCipher[i]=key[i];
	}
	for(i=size;i<26+size;i++){
		tabCipher[i]=tabinit[i-size];
	}
	deleteDoubloon(tabCipher);
}


int main(int argc, char *argv[]) {
	int i,j;
	char tabinit[26]={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','W','X','Y','Z'};
	char *tabCipher=malloc(sizeof(int)*26);
	size_t size;
	char *key=argv[1];
	size=strlen(key);
	createSubstTab(tabCipher, tabinit, key, size);
	//DEBUG//
	for(j=0;j<size+26;j++){
		printf(" %c",tabCipher[j]);
	}
	printf("\n");
	/*for(j=0;j<27;j++){
		printf(" %c",tabinit[j]);
	}*/
	return 0;
}
