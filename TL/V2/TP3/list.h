#ifndef LIBLISTE_H
#define LIBLISTE_H


struct list_node {
	size_t state; //name of the current elem
	size_t weight;
	struct list_node *next;
};

struct list {
	struct list_node *first;
};

//creation
void createList(struct list* self);

//destruction
void destroyList(struct list* self);

//ajout
void addNode(struct list* self, size_t neighboor, size_t weight);

//suppression après l'élément courant
void delNodeAfter(struct list_node* self);

//supression de la valeur
void delNode(struct list* self, int value);

//suppression du premier node
void delFirstNode(struct list* self);

//vide
bool isEmptyList(const struct list* self);

//taille
size_t listSize(const struct list* self);

//recherche
struct list_node* searchNode(const struct list* self, size_t state);

#endif
