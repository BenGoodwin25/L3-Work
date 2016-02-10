#ifndef AUTOMATE_H
#define AUTOMATE_H

typedef struct s_liste {
	int data;
	struct s_liste* suiv;
} liste;

typedef struct {
	int size;
	int sizealpha;
	int* initial;
	int* final;
	liste*** trans;
} automate;

automate initAutomate(int size, int sizealpha, int *initial, int *final);
void ajouteTransition(automate self, int source, int cible, int nbalpha);
automate construitAutomateExemple();
void afficheAutomate(automate);
int compteTransitions(automate*);
int deterministe(automate*);
int complet(automate*);
void supprimeTransition(automate* self, int source, int cible, int nbalpha);
void supprimeEtat(automate* self,int etat);
void completeAutomate(automate);
void fusionEtats(automate);

void ajouteListe(liste** l, int q);
void printListe(liste*);
int listLength(liste*);

void list_remove_after(liste* self);

#endif
