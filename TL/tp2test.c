#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "tp2test.h"


int main(int argc,char* argv[]){
	automate A;
	A=construitAutomateExemple();
	/*ajouteTransition(A,0,0,'a');
	ajouteTransition(A,0,1,'a');
	ajouteTransition(A,1,1,'b');*/
	afficheAutomate(A);
}
	
automate initialisationAutomate(int size,int sizealpha,int *initial, int *final){
	automate A;
	int i,j;
	A.size=size;
	A.sizealpha=sizealpha;
	A.trans=(liste***) malloc(A.size*sizeof(liste***));
	for(i=0;i<A.size;i++){
		A.trans[i]=(liste**) malloc(A.sizealpha*sizeof(liste*));
		for(j=0;j<A.sizealpha;j++){
			A.trans[i][j]=NULL;
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
void ajouteTransition(automate A,int i,int j,char c){
	ajouteListe(&A.trans[i][j],0);
}

automate construitAutomateExemple(){
	automate A;
	int size,sizealpha;
	size=5;
	sizealpha=2;
	A.initial=(int*) malloc(size*sizeof(int));
	A.final=(int*) malloc(size*sizeof(int));
	
	A.initial[0]=1;
	A.initial[1]=1;
	A.initial[2]=0;
	A.initial[3]=0;
	A.initial[4]=0;

	A.final[0]=0;
	A.final[1]=1;
	A.final[2]=0;
	A.final[3]=0;
	A.final[4]=1;
	
	A=initialisationAutomate(size,sizealpha,A.initial,A.final);

	ajouteTransition(A,0,1,'a');
	ajouteTransition(A,0,3,'a');
	ajouteTransition(A,0,2,'a');
	ajouteTransition(A,1,3,'b');
	ajouteTransition(A,2,3,'a');
	ajouteTransition(A,2,4,'b');
	ajouteTransition(A,3,3,'b');
	ajouteTransition(A,3,4,'b');
	ajouteTransition(A,4,4,'a');


	return A;
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

void afficheListe(liste* self){
	liste* tmp = self;
	while(tmp != NULL){
		printf(" %d", tmp->state);
    	tmp = tmp->suiv;
	}
}
