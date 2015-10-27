#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "tp2.h"


int main(int argc,char* argv[]){
	automate A;
	construitAutomateExemple(&A);
	afficheAutomate(A);

	/*printf("L'automate A a %d transitions\n",compteTransitions(A));
	if(deterministe(A)==1){
		printf("L'automate A est deterministe\n");
	}else{
		printf("L'automate A n'est pas deterministe\n");
	}
	if(complet(A)==1){
		printf("L'automate A est complet.\n");
	}else{
		printf("L'automate n'est pas complet.\n");
	}*/
	
	fusionEtats(&A,2,3);
	//supprimeEtat(&A,3);
	//supprimeTransition(&A,0,2,'a');
	//afficheAutomate(A);
	//supprimeTransition(&A,0,1,'a');
	//supprimeTransition(&A,0,3,'a');
	/*supprimeTransition(&A,1,3,'b');
	supprimeTransition(&A,2,3,'a');
	supprimeTransition(&A,2,4,'b');
	supprimeTransition(&A,3,3,'b');
	supprimeTransition(&A,3,4,'b');
	supprimeTransition(&A,4,4,'a');*/
	afficheAutomate(A);
}

void initialisationAutomate(automate* A,int size,int sizealpha,int *initial, int *final){
	int i,j;
	A->size=size;
	A->sizealpha=sizealpha;
	A->trans=(liste***) malloc(A->size*sizeof(liste***));
	for(i=0;i<A->size;i++){
		A->trans[i]=(liste**) malloc(A->sizealpha*sizeof(liste*));
		for(j=0;j<A->sizealpha;j++){
			A->trans[i][j]=NULL;
		}
	}
}

void afficheAutomate(automate A){
	int i,j,k;
	printf("Les Etats initiaux :\n");
	for(i=0;i<A.size;i++){
		if(A.initial[i]==1){
			printf(" %d",i);
		}
	}
	printf("\n");

	printf("Les Etats finaux :\n");
	for(j=0;j<A.size;j++){
		if(A.final[j]==1){
			printf(" %d",j);
		}
	}
	printf("\n");
	
	printf("---------------------------\n");
	printf("------Les Transitions------\n");
	printf("---------------------------\n");

	for(k=0;k<A.size;k++){
		printf("Depuis l'etat %d\n",k);
		for(i=0;i<A.sizealpha;i++){
			printf("avec la lettre %c :\n",(unsigned char) (i + 97) );
			afficheListe(A.trans[k][i]);
			printf("\n");
		}
		printf("---------------------------\n");
	}

}
void ajouteTransition(automate *A,int i,int j,char c){
	ajouteListe(&A->trans[i][(unsigned char) (c-97)],j);
}

void construitAutomateExemple(automate *A){
	int size,sizealpha;
	size=5;
	sizealpha=2;
	A->initial=(int*) malloc(size*sizeof(int));
	A->final=(int*) malloc(size*sizeof(int));
	
	A->initial[0]=1;
	A->initial[1]=1;
	A->initial[2]=0;
	A->initial[3]=0;
	A->initial[4]=0;

	A->final[0]=0;
	A->final[1]=1;
	A->final[2]=0;
	A->final[3]=0;
	A->final[4]=1;
	
	initialisationAutomate(A,size,sizealpha,A->initial,A->final);

	ajouteTransition(A,0,1,'a');
	ajouteTransition(A,0,3,'a');
	ajouteTransition(A,0,2,'a');
	ajouteTransition(A,1,3,'b');
	ajouteTransition(A,2,3,'a');
	ajouteTransition(A,2,4,'b');
	ajouteTransition(A,3,3,'b');
	ajouteTransition(A,3,4,'b');
	ajouteTransition(A,4,4,'a');


}

int compteTransitions(automate A){
	int k,i;
	int number=0;
	for(k=0;k<A.size;k++){
		for(i=0;i<A.sizealpha;i++){
			number+=compterListe(A.trans[k][i]);
		}
	}
	return number;
}

int deterministe(automate A){
	int i,f,initNumber,number;
	for(i=0;i<A.size;i++){
		if(A.initial[i]==1){
			initNumber+=1;
		}
		for(f=0;f<A.sizealpha;f++){
			number=compterListe(A.trans[i][f]);
			if(number>1){
				return 0;
			}
		}
	}
	if(initNumber!=1){
		return 0;
	}else{
		return 1;
	}
}

int complet(automate A){
	int i,f,number;
	for(i=0;i<A.size;i++){
		for(f=0;f<A.sizealpha;f++){
			number=compterListe(A.trans[i][f]);
			if(number==0){
				return 0;
			}
		}
	}
	return 1;
}

void supprimeTransition(automate *A,int i,int j,char c){
	liste* tmp=A->trans[i][(unsigned char) (c-97)];
	if(tmp!=NULL){
		if(tmp->state==j){
			A->trans[i][(unsigned char) (c-97)]=A->trans[i][(unsigned char) (c-97)]->suiv;
		}
		while(tmp != NULL && tmp->suiv!=NULL){
			if(tmp->suiv->state==j){
				list_remove_after(tmp);
			}
			tmp=tmp->suiv;
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

void completeAutomate(automate *A){
	int source,cible,k;
	char c;
	for(source=0;source<A->size;source++){
		for(k=0;k<A->sizealpha;k++){
			c=(unsigned char)k+'a';
			if(A->trans[source][k]==NULL){
				ajouteTransition(A,source,source,c);
			}
		}
	}
}

void fusionEtats(automate *A,int etatPrimaire,int etatSecondaire){
	int source,cible,k;
	char c;
	for(source=0;source<A->size;source++){
		for(cible=0;cible<A->size;cible++){
			for(k=0;k<A->sizealpha;k++){
				if(A->trans[source][k]!=NULL){
					c=(unsigned char)k+'a';
					if(source==etatSecondaire){
						ajouteTransition(A,etatPrimaire,A->trans[source][k]->state,c);
					}
					if(cible==etatSecondaire){
						if(A->trans[source][k]->state==cible){
							ajouteTransition(A,A->trans[source][k]->state,etatPrimaire,c);
						}
					}	
				}
			}
		}
	}
	supprimeEtat(A,etatSecondaire);
}


//---------------------------Fonction general---------------------------//
void ajouteListe(liste** l,int q){
	liste* ptl;
	liste* tmp;
	ptl=*l;
	if(!ptl){
		ptl=(liste*) malloc(sizeof(liste));
		ptl->state=q;
		ptl->suiv=NULL;
		*l=ptl;
		return;
	}
	if(ptl->state == q){
		return;
	}
	if(q< ptl->state){
		tmp=*l;
		*l=(liste*) malloc(sizeof(liste));
		(*l)->state=q;
		(*l)->suiv=tmp;
		return;
	}
	while(ptl->suiv && ptl->suiv->state <q){
		ptl=ptl->suiv;
	}
	if(!ptl->suiv){
		ptl->suiv=(liste*) malloc(sizeof(liste));
		ptl=ptl->suiv;
		ptl->state=q;
		ptl->suiv=NULL;
		return;
	}
	if(ptl->suiv->state==q){
		return;
	}
	tmp=ptl->suiv;
	ptl->suiv=(liste*) malloc(sizeof(liste));
	ptl=ptl->suiv;
	ptl->state=q;
	ptl->suiv=tmp;
}

/*int supprimeListe(liste** l,int pos){
	int i;
	liste* tmp=*l;
	printf("tmp->state : %d, pos:%d\n",tmp->state,pos);
	if(tmp != NULL ){
		while(tmp->suiv!=NULL){
			if(tmp->state==pos){
				*l=tmp->suiv;
			}
			if(tmp->suiv->state!=pos){
				printf("debug : suiv\n");
				liste* other=tmp->suiv;
				//tmp=other->suiv;
				*l=tmp->suiv;
			}
			tmp=tmp->suiv;
		}
	}
	//next=tmp->suiv;
	//tmp->suiv=tmp->suiv->suiv;
	//l->suiv=tmp->suiv;
	//free(next);
	return 1;
}*/
void list_remove_after(liste* self){
	liste* other=self->suiv;
	self->suiv=other->suiv;
	free(other);
}

void afficheListe(liste* self){
	liste* tmp = self;
	while(tmp != NULL){
		printf(" %d", tmp->state);
    	tmp = tmp->suiv;
	}
}

int compterListe(liste* self){
	liste* tmp = self;
	int number=0;
	while(tmp != NULL){
		number+=1;
    	tmp = tmp->suiv;
	}
	return number;
}
