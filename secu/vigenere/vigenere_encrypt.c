#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char *argv[]) {
	int i,j=0;
	char *key=argv[1];
	size_t size=strlen(key);
	while ((i = fgetc(stdin)) != EOF) {
		//printf("%c :",(unsigned char) i);
		unsigned char c;
		if((unsigned char) i<'A' || (unsigned char) i>'Z'){
			c = (unsigned char) i;
		}else{
			//printf(" %c :",(key[j%size]));
			c = (unsigned char) (((i + (key[j%size]))%26)+'A');
			j+=1;
		}
		printf("%c", c);
	}
	//printf("\n key : %s\n",key);
	return 0;
}
