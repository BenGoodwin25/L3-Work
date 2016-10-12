/*
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
	if(argc != 1){
		fprintf(stderr,"Need no Parameter\n");
		return 0;
	}
	int i,j=0;
  while ((i = fgetc(stdin)) != EOF) {
		unsigned char c;
		if((unsigned char) i<'A' || (unsigned char) i>'Z'){
			c = (unsigned char) i;
		}else{
			c = (unsigned char) (((i + (key[j%size]))%26)+'A');
			j+=1;
		}
		printf("%c", c);
	}
	return 1;
}*/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

float IndiceCoincidence(char *path){
  int c, i, n = 0;
  float z = 0;
  int tab[26] = {0};
  FILE *cypherText=fopen(path,"r");
  if(cypherText==NULL){
    perror("erreur de lecture fichier");
  } else {
    while((c = fgetc(stdin)) != EOF){
      c=fgetc(cypherText); // lecture d'un caractere
      if (isalpha(c)){
        tab[toupper(c)-65]++;
        n++;
      }
    }
    fclose(cypherText);
  }
  for(i=0;i<26;i++){
    z+=(float)tab[i]*(tab[i]-1)/(float)(n*(n-1));
  }
  return z;
}
    //-----------------------------------------------------------------

    int main(int argc, char *argv[]){
      printf("indice de coincidence du text est :%f\n",IndiceCoincidence("cipher"));
}
