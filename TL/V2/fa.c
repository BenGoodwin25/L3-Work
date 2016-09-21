#include "fa.h"



void fa_create(struct fa *self, size_t alpha_count, size_t state_count){
  int i;
  self->alpha_count=alpha_count;
  self->state_count=state_count;

  self->initial_states = (bool*) malloc(self->state_count*sizeof(size_t));
  for(i=0;i<self->state_count;i++){
    self->initial_states[i]=false;
  }
  self->final_states = (bool*) malloc(self->state_count*sizeof(size_t));
  for(i=0;i<self->state_count;i++){
    self->final_states[i]=false;
  }

}

void fa_destroy(struct fa *self){
  self->alpha_count=0;
  self->state_count=0;
  free(self->initial_states);
  free(self->final_states);
}

void fa_set_state_initial(struct fa *self, size_t state){
  self->initial_states[state]=true;
}

void fa_set_state_final(struct fa *self, size_t state){
  self->final_states[state]=true;
}

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to){
  ajouteListe(&self->transitions[from][alpha-'a'], to);
}

void ajouteListe(struct state_set* l, size_t q){
  struct state_set* ptl;
  struct state_set* tmp;
  /*
  ptl=*l;
  if(!ptl){
    ptl=(struct state_set*) malloc(sizeof(struct state_set));
    ptl->first->state=q;
    ptl->first->next=NULL;
    *l=ptl;
    return;
  }

  if(ptl->first->state == q){
    return;
  }

  if(q< ptl->first->state){
    tmp=*l;
    *l=(struct state_set*) malloc(sizeof(struct state_set));
    (*l)->first->state=q;
    (*l)->first->next=(struct state_node*)tmp;
    return;
  }

  while(ptl->first->next && ptl->first->next->state < q){
    ptl=(struct state_set*)ptl->first->next;
  }

  if(!ptl->first->next){
    ptl->first->next=(struct state_node*) malloc(sizeof(struct state_set));
    ptl=(struct state_set*)ptl->first->next;
    ptl->first->state=q;
    ptl->first->next=NULL;
    return;
  }

  if(ptl->first->next->state==q){
    return;
  }
  tmp=(struct state_set*)ptl->first->next;
  ptl->first->next=(struct state_node*) malloc(sizeof(struct state_set));
  ptl=(struct state_set*)ptl->first->next;
  ptl->first->state=q;
  ptl->first->next=tmp->first;
  */
}


void fa_pretty_print(const struct fa *self, FILE *out){
  int i,f;
  fprintf(out, "Initial states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->initial_states[i]==true){
      fprintf(out, "%d ", i);
    }
  }
  fprintf(out, "\n");

  fprintf(out, "Final states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->final_states[i]==true){
      fprintf(out, "%d ",i);
    }
  }
  fprintf(out, "\n");

  fprintf(out, "Transitions :\n");
  for(i=0;i<self->state_count;i++){
    fprintf(out, "\tFor State %d:\n",i);
    for(f=0;f<self->alpha_count;f++){
      fprintf(out, "\t\tFor letter %c: ",(unsigned int) f + 'a');
      //struct state_set *p = malloc(self->state_count*sizeof(size_t));
      /**p = self->transitions[i][f];
      while(p != NULL){
        fprintf(out, "%zu ", p->first->state);
        p = p->first->next;
      }*/
      fprintf(out, "\n");
    }
  }
  fprintf(out, "\n");

}
