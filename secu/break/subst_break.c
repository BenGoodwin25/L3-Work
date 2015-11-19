#include <stdio.h>
#include <stdlib.h>
#define NBALPHA 25

#define couleur(param) printf("\033[%sm",param)

int isintab(char c,char chars[NBALPHA], int nb){
	int i;
	for(i=0;i<nb;i++){
		if(chars[i]==c){
			return i;
		}
	}
	return -1;
}

void sort(int nbap[NBALPHA], char chars[NBALPHA],int nb){
	int i,j;
	for(j=0;j<nb;j++){
		for(i=0;i<nb;i++){
			if(nbap[i]<nbap[i+1]){
				int tmp=nbap[i];
				nbap[i]=nbap[i+1];
				nbap[i+1]=tmp;

				char temp=chars[i];
				chars[i]=chars[i+1];
				chars[i+1]=temp;
			}
		}
	}
}




int main(int argc, char *argv[]) {
	
	if(argc < 2){
		fprintf(stderr,"Need file location");
		return 1;
	}
	
	couleur("0");
	int i;
	const int NB_ALPHA = 26;
	char chars[NB_ALPHA]; 	
	int nb_ap[NB_ALPHA]; 
	float percentage[NB_ALPHA];
	size_t nb_elem = 0; // compteur de lettres
	size_t textLength = 0;
	
	char texte[500000];
	
	FILE* fp = fopen(argv[1],"r");
	while ((i = fgetc(fp)) != EOF) {
		printf("%c",i);
		texte[textLength] = i;
		textLength ++;
		if(i > 64 && i < 91){
			int indice = isintab(i, chars, nb_elem);
			if(indice >= 0){
				nb_ap[indice] ++;
			}
			else{
				chars[nb_elem] = i;
				nb_ap[nb_elem] = 1;
				nb_elem++;
			}
		}
	}
	
	//analyse statistique
	
	sort(nb_ap, chars, nb_elem); //chars et nb_ap par ordre d'apparitions décroissant
	
	
	int c;
	printf("\n");
	for(c = 0; c<nb_elem; c++){
		percentage[c] = ((float)nb_ap[c]*100) / textLength; //on passe le nombre d'apparition en pourcentage
		printf("%c : %f \n",chars[c],percentage[c]);
	}
	
	char decrypt[NB_ALPHA];
	
	/*do{
		printf("Manuel ou Automatique ? : ");
		scanf(" %1s",&choice);
	}while(choice != 'M' && choice != 'A');*/
	
	for(c = 0; c<26; c++){
		decrypt[c]='.';
	}
	
	char choiceE;
	char choiceD;
	int cpt = 0;
	do{
		cpt++;
		
		for(c = 0; c < textLength; c++){
			if(texte[c] < 64 || texte[c] > 91){
				printf("%c",texte[c]);
			}
			else{
				if(decrypt[isintab(texte[c], chars, 26)] == '.'){
					couleur("41");
					printf("%c",texte[c]);
					couleur("0");
				}
				else{
					//couleur("44");
					printf("%c",decrypt[isintab(texte[c], chars, 26)]);
					couleur("0");
				}
			}
		}
		
		printf("\nChoisis une lettre du texte puis la lettre qui doit lui etre associee : \n");
		scanf(" %c",&choiceE);
		scanf(" %c",&choiceD);
		printf("decrypt[%d] = %c\n",isintab(choiceE,chars,26),choiceD);
		decrypt[isintab(choiceE,chars,26)] = choiceD;
		
		//demander à l'utilisateur de choisir les lettres correspondantes
		
		for(c = 0; c < textLength; c++){
			if(texte[c] < 64 || texte[c] > 91){
				printf("%c",texte[c]);
			}else{
				printf("%c",decrypt[isintab(texte[c], chars, 26)]);
			}
		}
		printf("\n");
	}while(cpt < 26);

	fclose(fp);
	couleur("0");
	return 0;	
}
