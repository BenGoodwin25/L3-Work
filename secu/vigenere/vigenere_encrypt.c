#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char *argv[]) {
	if(argc != 2){
		fprintf(stderr,"Need one Parameter\n");
		return;
	}
	int i,j=0;
	char *key=argv[1];
	size_t size=strlen(key);
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
	return 0;
}
