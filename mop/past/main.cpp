#include <stdio.h>

int main(){
	int Facade,FacadeLargeur,FacadeHauteur;
	int Pignon,PignonHauteur;
	int LongeurFacade;
	int Fenetre,FenetreLargeur,FenetreHauteur;
	int Porte,PorteLargeur,PorteHauteur;
	printf("Combien de facade ?\n");
	scanf("%i",&Facade);
	for(int i=1;i<=Facade;i++){
		printf("largeur de la facade %i ?\n",i);
		scanf("%i",&FacadeLargeur);
		printf("Hauteur de la facade %i (hors pignon)?\n",i);
		scanf("%i",&FacadeHauteur);
		printf("Pignon pour la facade %i ?(1 ou 0)\n",i);
		scanf("%i",&Pignon);
		if(1==Pignon){
			printf("Hauteur du pignon %i ?\n",i);
			scanf("%i",&PignonHauteur);
		}
		printf("nombre de fenetre pour la facade %i ?\n",i);
		scanf("%i",&Fenetre);
		for(int f=1;f<=Fenetre;f++){
			printf("largeur de la fenetre %i ?\n",f);
			scanf("%i",&FenetreLargeur);
			printf("Hauteur de la fenetre %i ?\n",f);
			scanf("%i",&FenetreHauteur);
		}
		printf("nombre de porte pour la facade %i ?\n",i);
		scanf("%i",&Porte);
		for(int f=1;f<=Porte;f++){
			printf("largeur de la porte %i ?\n",f);
			scanf("%i",&PorteLargeur);
			printf("Hauteur de la porte %i ?\n",f);
			scanf("%i",&PorteHauteur);
		}
	}
}
