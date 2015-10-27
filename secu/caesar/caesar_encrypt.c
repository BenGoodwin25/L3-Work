#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
	int i;
	int nbshift=atoi(argv[1]);
	while ((i = fgetc(stdin)) != EOF) {
		unsigned char c = (unsigned char) (i+nbshift);
		printf("%c", c);
	}
	return 0;
}
