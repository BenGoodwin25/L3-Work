#ifndef GRAPHE_H
#define GRAPHE_H

#define MAX_SIZE 40

enum state{
	TAIL,BRANCH
};

struct list{
	int data[MAX_SIZE];
	int state;
	struct list* next;
};

struct graph{
	int nbSommet;
	struct list sommet[MAX_SIZE];
};

typedef struct s_iliste{
	int* val;
	int tailleVal;
	int state;
	struct s_iliste* suiv;
}iliste;

typedef struct{
	iliste* debut;
	iliste* fin;
}ifile;


char* printState(enum state);
void printGraph(struct graph* graphe);
int path(struct graph* graphe, int sommet1, int sommet2);
int visit(struct graph* graphe, int sommet);
void tailAll(struct graph* graphe);
void branchFrom(struct graph* graphe, int sommet);
void automateToGraph(struct graph* graphe, automate self);
int langageVide(struct graph* graphe, automate self);
char* listeTransitions(struct graph* graphe);
void deleteDoubloon(char *self);
int estDansFile(ifile f, int* pt, int n);
void ajouteFile(ifile* f, int* pt, int n);
void afficheFile(ifile f);
void produit(automate* prod, automate a, automate b);
void determinise(automate* determini, automate originel);
int estDansFile(ifile f, int* pt, int n);
void ajouteFile(ifile* f, int* pt,int n);
void afficheFile(ifile f);
void minimaliste(automate mini, automate originel);


#endif
