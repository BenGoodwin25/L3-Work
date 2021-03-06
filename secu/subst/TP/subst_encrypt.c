#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void deleteDoubloon(char *self){
	size_t size=strlen(self);
	int i,j;
	for(i=0;i<size-1;i++){
		for(j=i+1;j<size-1;j++){
			if(self[i]==self[j] && j<size-1){
				//self[k]=self[i];
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
	if(argc != 2){
		fprintf(stderr,"Need one Parameter\n");
		return 1;
	}
	int i;
	char tabinit[26]={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
	char *tabCipher=malloc(sizeof(int)*26);
	size_t size;
	char c;
	char *key=argv[1];
  size=strlen(key);
  for(i=0;i<size;i++){
    if((unsigned char) key[i] < 'A' || (unsigned char) key[i]> 'Z'){
      fprintf(stderr,"The passphrase need to be all capital and only alpha character\n");
      free(tabCipher);
      return 1;
    }
  }
	createSubstTab(tabCipher, tabinit, key, size);

	while ((i = fgetc(stdin)) != EOF){
		if((unsigned char) i < 'A' || (unsigned char) i > 'Z'){
			c=(unsigned char) i;
		}else{
			c=(unsigned char) tabCipher[i-'A'];
		}
		printf("%c", c);
	}
  free(tabCipher);
	return 0;
}
