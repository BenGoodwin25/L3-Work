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

#endif
