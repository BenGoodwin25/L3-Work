#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
	if(argc != 2){
		fprintf(stderr,"Use encrypt x < plaintext > ciphertext,\n where x is a number(1 to 25)\n");
		return 1;
	}
	int letter;
	int nbshift=atoi(argv[1]);
	while ((letter = fgetc(stdin)) != EOF) {
		unsigned char c;
    if (letter <= 64 || letter >= 91){
      c = (unsigned char) (letter);
      printf("%c", c);
    } else {
		  c =(unsigned char) ((letter - nbshift - 39) % 26) + 'A';
		  printf("%c", c);
    }
	}
	return 0;
}
