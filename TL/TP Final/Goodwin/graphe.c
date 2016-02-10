#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "automate.h"
#include "graphe.h"


int main(int argc, char *argv[]){

	automate a=construitAutomateExemple();
	automate b=construitAutomateExemple();
	ajouteTransition(b, 2, 2, 1);
	automate prod;
	produit(&prod,a,b);
	automate c;
	//determinise(&c,a);
	
	return 0;
}

char* printState(enum state status){
	switch(status){
		case 0: return "Vide";
			break;
		case 1: return "Non Vide";
			break;
		default: return "problem enum state";		
	}
}

void printGraph(struct graph* graphe){
	int i;
	struct list* tmp;
	for(i = 0; i<graphe->nbSommet; i++){
		printf("Sommet %d -> ",i);
		tmp = &graphe->sommet[i];
		while(tmp != NULL){
			printf("%c,%s; ",(char) '0'+tmp->data[0], printState(tmp->state));
			tmp = tmp->next;
		}
		printf("\n");
	}
}

int path(struct graph* graphe, int sommet1, int sommet2){
	tailAll(graphe);
	printf("Tail :\n");
	printGraph(graphe);
	branchFrom(graphe, sommet1);
	printf("Branch from sommet %d :\n",graphe->sommet[sommet1].data);
	printGraph(graphe);
	
	if(graphe->sommet[sommet2].state == BRANCH){
		return 1;
	}
	return 0;
}

int visit(struct graph* graphe, int sommet1){
	return 0;
}

void tailAll(struct graph* graphe){
	int i;
	struct list* tmp;
	for(i = 1; i<=graphe->nbSommet; i++){
		tmp = &graphe->sommet[i];
		while(tmp != NULL){
			tmp->state = TAIL;
			tmp = tmp->next;
		}
	}
}

void branchFrom(struct graph* graphe, int sommet){
	struct list* tmp;
	tmp = &graphe->sommet[sommet];
	while(tmp != NULL){
		tmp->state = BRANCH;
		tmp = tmp->next;
	}
}

automate initAutomate(int size, int sizealpha, int *initial, int *final){
	automate toto;
	int i,j;
	toto.size = size;
	toto.sizealpha = sizealpha;
	toto.initial = initial;
	toto.final = final;
	toto.trans = (liste***) malloc (size * sizeof(liste**));
	for(i=0; i<size; i++){
		toto.trans[i] = (liste**) malloc (sizealpha*sizeof(liste*));
		for(j=0; j<sizealpha; j++){
			toto.trans[i][j] = NULL;
		}
	}
	
	return toto;
}

void ajouteTransition(automate self, int source, int cible, int nbalpha){
	ajouteListe(&self.trans[source][nbalpha], cible);
}

automate construitAutomateExemple(){
	int* initial;
	initial = (int *) malloc (5 * sizeof(int));
	initial[0] = 1;
	initial[1] = 1;
	initial[2] = 0;
	initial[3] = 0;
	initial[4] = 0;
	
	int* final;
	final = (int *) malloc (5 * sizeof(int));
	final[0] = 0;
	final[1] = 1;
	final[2] = 0;
	final[3] = 0;
	final[4] = 1;
	
	automate toto;
	
	toto = initAutomate(5, 2, initial, final);
	
	ajouteTransition(toto, 0, 1, 0);
	ajouteTransition(toto, 0, 3, 0);
	ajouteTransition(toto, 0, 2, 0);
	ajouteTransition(toto, 1, 3, 1);
	ajouteTransition(toto, 2, 3, 0);
	ajouteTransition(toto, 2, 4, 1);
	ajouteTransition(toto, 3, 3, 1);
	ajouteTransition(toto, 3, 4, 1);
	ajouteTransition(toto, 4, 4, 0);
	
	return toto;
}

void afficheAutomate(automate self){
	int etat;
	int lettre;
	printf("Les etats initiaux\n");
	for(etat=0; etat<self.size; etat++){
		if(self.initial[etat] == 1){
			printf(" %d",etat);
		}
	}
	printf("\nLes etats finaux\n");
	for(etat=0; etat<self.size; etat++){
		if(self.final[etat]){
			printf(" %d",etat);
		}
	}
	printf("\nLes transitions\n");
	printf("----------------------------------------------\n");
	for(etat = 0; etat<self.size; etat++){	
		printf("Depuis l'etat %d\n",etat);
		
		for(lettre=0; lettre<self.sizealpha; lettre++){
			printf("avec la lettre %c : \n",(unsigned char) (lettre+97));
			printListe(self.trans[etat][lettre]);
		}
		printf("----------------------------------------------\n");
	}
}

int compteTransitions(automate* self){
	int nb_trans = 0;
	int etat;
	int lettre;
	for(etat=0; etat<self->size; etat++){
		for(lettre=0; lettre<self->sizealpha; lettre++){
			liste* indice = self->trans[etat][lettre];
			while(indice != NULL){
				nb_trans++;
				indice = indice->suiv;
			}
		}
	}
	return nb_trans;
}

int deterministe(automate* self){
	int etat;
	int lettre;
	int nb_initial = 0;
	for(etat=0; etat<self->size; etat++){
		if(self->initial[etat] == 1){
			nb_initial ++;
		}
		for(lettre=0; lettre<self->sizealpha; lettre++){
			if(listLength(self->trans[etat][lettre]) > 1){
				return 0;
			}	
		}
	}
	if(nb_initial != 1){
 		return 0;
	}	
	
	return 1;
}

int complet(automate* self){
	int etat;
	int lettre;
	for(etat=0; etat<self->size; etat++){
		for(lettre=0; lettre<self->sizealpha; lettre++){
			if(listLength(self->trans[etat][lettre]) < 1){
				return 0;
			}
		}
	}
	return 1;
}

void supprimeTransition(automate* self, int source, int cible, int nbalpha){
	liste* tmp = self->trans[source][nbalpha];
	if(tmp != NULL){
		while(tmp->suiv != NULL){
			if(tmp->suiv->data == cible){
				list_remove_after(tmp);
			}
			tmp = tmp->suiv;
		}
	}
}

void supprimeEtat(automate *A,int etat){
	int source,cible,k;
	char c;
	for(source=0;source<A->size;source++){
		for(cible=0;cible<A->size;cible++){
			if(source==etat || cible==etat){
				for(k=0;k<A->sizealpha;k++){
					if(A->trans[source][k]!=NULL){
						c=(unsigned char)k+'a';
						printf("suppr : A,%d,%d,%c\n",source,cible,c);
						supprimeTransition(A,source,cible,c);
					}
				}
			}
		}
	}
	//Je n'arrive pas à supprimer l'Etat entièrement, mais pour moi s'il n'y a plus de transition avec l'automate, il ne fait plus partie de l'automate, c'est juste que dans le programme il existe encore.
}


void ajouteListe(liste** l,int q){
	liste* ptl;
	liste* tmp;
	ptl=*l;
	if(!ptl){
		ptl=(liste*) malloc(sizeof(liste));
		ptl->data=q;
		ptl->suiv=NULL;
		*l=ptl;
		return;
	}
	if(ptl->data == q){
		return;
	}
	if(q< ptl->data){
		tmp=*l;
		*l=(liste*) malloc(sizeof(liste));
		(*l)->data=q;
		(*l)->suiv=tmp;
		return;
	}
	while(ptl->suiv && ptl->suiv->data <q){
		ptl=ptl->suiv;
	}
	if(!ptl->suiv){
		ptl->suiv=(liste*) malloc(sizeof(liste));
		ptl=ptl->suiv;
		ptl->data=q;
		ptl->suiv=NULL;
		return;
	}
	if(ptl->suiv->data==q){
		return;
	}
	tmp=ptl->suiv;
	ptl->suiv=(liste*) malloc(sizeof(liste));
	ptl=ptl->suiv;
	ptl->data=q;
	ptl->suiv=tmp;
}

void printListe(liste* self){
	liste* tmp = self;
	while(tmp != NULL){
		printf("%d ",tmp->data);
		tmp = tmp->suiv;
	}
	printf("\n");
}

int listLength(liste* self){
	int length = 0;
	while(self->suiv != NULL){
		length++;
		self = self->suiv;
	}	
	return length;
}

void list_remove_after(liste* self) {
  liste* other = self->suiv;
  self->suiv = other->suiv;
  free(other);
}

void automateToGraph(struct graph* graphe,automate self){
	int i,f;
	int size=self.size;
	int sizeAlpha=self.sizealpha;
	graphe->nbSommet=size;
	struct list un;
	//Creation des Sommets
	for (i=0;i<size;i++){
		un.state = TAIL;
		un.next = NULL;
		for (f=0;f<sizeAlpha;f++){
			liste* tmp=self.trans[i][f];
			int c=0;
			while(tmp != NULL){
				un.state=BRANCH;
				un.data[c]=tmp->data;
				tmp = tmp->suiv;
				c+=1;
			}
		}
		graphe->sommet[i] = un;
	}
}

int langageVide(struct graph* G,automate self){
	int i;
	int size=self.size;
	for(i=0;i<size;i++){
		if(self.initial[i]==1 && self.final[i]==1){
			return 1;
		}
	}
	return 0;
}

char* listeTransitions(struct graph* G){
	int i,j;
	int c=0;
	char str[MAX_SIZE];
	int size=G->nbSommet;
	for(i=0;i<size;i++){
		for(j=0;j<3;j++){
			str[c]=(char) '0'+G->sommet[i].data[j];
			c+=1;
		}
	}
	str[c]='\0';
	deleteDoubloon(str);
	deleteDoubloon(str);//bug with this function need to be called twice
	printf("res :%s\n",str);
	return str;
}

void deleteDoubloon(char *self){
	size_t size=strlen(self);
	int i,j,k=0;
	for(i=0;i<size-1;i++){
		for(j=i+1;j<size-1;j++){
			if(self[i]==self[j] && j<size-1){
				self[k]==self[i];
				memmove( self+j,self+j+1, (size-j* sizeof *self));
				j+=1;
			}
		}
	}
}

void deleteNonAccessible(struct graph* graphe, automate self,char* listTransition){
	int i;
	char tmp;
	char* res;
	for(i=1;i<graphe->nbSommet;i++){
		tmp='0'+i;
		res=strchr(listTransition,tmp);
		if(res==NULL){
			supprimeEtat(&self,i);
		}
		res=NULL;
	}
	
}

void deleteNonCoAccessible();

void produit(automate* prod,automate a,automate b){
	prod->size=a.size*b.size;
	if(a.sizealpha>=b.sizealpha){
		prod->sizealpha=a.sizealpha;
	}else{
		prod->sizealpha=b.sizealpha;
	}
	//Je n'ai pas de nom pour les Etats du coup pas de régle de nomage.
	int i,j;
	int init=0;
	prod->initial = (int *) malloc (prod->size * sizeof(int));
	prod->final = (int *) malloc (prod->size * sizeof(int));
	for(i=0;i<prod->size;i++){
		if(init==0 &&(a.initial[i]==1 || b.initial[i]==1)){
			prod->initial[i]=1;
			init=1;
		}
		if(a.final[i]==1 || b.final[i]==1){
			prod->final[i]=1;
		}
		liste* parcours;
		for(j=0;j<=prod->size;j++){
			/*if(a.trans[i][j]!=NULL){// Segfault multiples
				parcours = a.trans[i][j];
				while(parcours!=NULL){
					ajouteTransition(*prod, i, parcours->data, j);
					parcours=parcours->suiv;
				}
			}*/
			/*if(b.trans[i][j]!=NULL){// Segfault multiples
				parcours = b.trans[i][j];
				while(parcours!=NULL){
					ajouteTransition(*prod, i, parcours->data, j);// Segfault
					parcours=parcours->suiv;
				}
			}*/
		}
	}
}

int intersectionVide(automate A, automate B){
    //On cherche des transitions à partir des etats initiaux
	automate prod;
	produit(&prod,A,B); 
	if(compteTransitions(&prod)>0){
		return 0;
	}else{
		return 1;
	}
}

void determinise(automate* determini, automate originel){
	int i;
	for(i = 0; i<originel.size; i++){
		if(originel.initial[i] == 1){
			determini->initial[i] = i;
		}
	}
	
	iliste l;
	l.tailleVal = 1;
	l.state = i;
	l.val[0] = l.state;
	
	ifile file;
	file.debut = &l;
	file.fin = &l;
	
	for(i = 0; i<originel.sizealpha; i++){
		liste* tmp = originel.trans[l.state][i];
		int tab[originel.size];
		int c = 0;
		while(tmp != NULL){
			tab[c] = tmp->data;
			tmp = tmp->suiv;
			c++;
			//...
		}
		//...
	}
}

int estDansFile(ifile f, int* pt, int n){
	int i;
	iliste* tmp;
	tmp=f.debut;
	while(tmp){
		if(tmp->tailleVal == n){ 
			i=0;
			while(i< n && pt[i]==tmp->val[i]){ 
				i++;
			}
			if(i == n) {
				return 1;
			}
		}
		tmp=tmp->suiv;
	}
	return 0;
}

void ajouteFile(ifile* f, int* pt,int n){ 
	int i;
	iliste* tmp;
	tmp= (iliste*) malloc(sizeof(iliste));
	tmp->val=(int*) malloc(n*sizeof(int));
	for(i=0;i<n;i++){
		tmp->val[i]=pt[i];
	}
	tmp->suiv=NULL;
	tmp->tailleVal=n;
	if(f->fin != NULL){
		tmp->state=f->fin->state+1;
		f->fin->suiv = tmp;
		f->fin= tmp;
		return;
	}
	tmp->state=0;
	f->fin= tmp; 
	f->debut= tmp;
}

void afficheFile(ifile f){
	iliste* pt;
	int i;
	int j=0;
	pt=f.debut;
	while(pt){
		printf("-----------------------------\n"); 
		printf("Element %d \n",pt->state); 
		for(i=0;i<pt->tailleVal;i++){
			printf( " %d",pt->val[i]);
		}
		pt=pt->suiv;
		j++;
		printf("\n");
	}
}

void minimaliste(automate mini, automate originel);


