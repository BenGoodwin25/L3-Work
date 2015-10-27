#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
	int i,c,f;
	int check;
	int NbOfE[400];
	int EIs;
	int comparator=0;
	unsigned char value;
	unsigned char tab[400];
	for(f=0;f<401;f++){
		NbOfE[f]=0;
	}
	while ((i = fgetc(stdin)) != EOF) {
		if(c==0){
			tab[c]=(unsigned char) i;
			NbOfE[c]+=1;
			c+=1;
		}else{
			check=0;
			for(f=0;f<c+1;f++){
				if(tab[f]==(unsigned char) i){
					NbOfE[f]+=1;
					check=1;
				}
			}
			if(check==0){
				tab[c]=(unsigned char) i;
				NbOfE[c]=1;
				c+=1;
			}
		}

	}
	for(f=0;f<c;f++){
			if(NbOfE[f]>comparator){
				comparator=NbOfE[f];
				value=tab[f];
			}
		}
	printf("e is egal to : '%c' and is '%i' times in the text\n",value,comparator);
	EIs=(unsigned char) value - 'e';
	printf("the key is : %i\n",EIs);
	comparator=0;
	return 0;
}
