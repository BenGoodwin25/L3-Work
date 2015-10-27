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
int compteTransitions(automate A);
int deterministe(automate A);
int complet(automate A);
void supprimeTransition(automate *A, int startstate, int endstate, char transition);
void supprimeEtat(automate *A,int etat);
void completeAutomate(automate *A);
void fusionEtats(automate *A,int etatPrimaire, int EtatSecondaire);




void ajouteListe(liste**,int q);
int supprimeListe(liste**,int pos);
void afficheListe(liste*);
int compterListe(liste*);
void list_remove_after(liste* self);


#endif//TP2_H
