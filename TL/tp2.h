#ifndef TP2_H
#define TP2_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct s_liste {
		int state;
		struct s_liste* suiv;
} liste;

typedef struct {
		int size;
		int sizealpha;
		int* initial;
		int* final;
		liste*** trans;
} automate;

void initialisationAutomate(automate* A, int size,int sizealpha,int *initial, int *final);
void afficheAutomate(automate A);
void ajouteTransition(automate *A, int startstate, int endstate, char transition);
void construitAutomateExemple(automate *A);
int deterministe(automate A);



void ajouteListe(liste**,int);
void afficheListe(liste*);


#endif//TP2_H
