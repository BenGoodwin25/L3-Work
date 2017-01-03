#include "fa.h"
#include "graph.h"



void fa_create(struct fa *self, size_t alpha_count, size_t state_count){
  int i,f;

  self->is_trash_on=false;

  self->alpha_count = alpha_count;
  self->state_count = state_count;

  self->initial_states = malloc((self->state_count+1)*sizeof(size_t));//+1 : Trash State
  self->final_states = malloc((self->state_count+1)*sizeof(size_t));
  for(i=0;i<self->state_count;i++){
    self->initial_states[i] = false;
    self->final_states[i] = false;
  }

  self->transitions = (struct state_set**)malloc((self->state_count+1) * self->alpha_count*sizeof(struct state_set*));

  for(i=0;i<self->state_count+1;i++){
    self->transitions[i] = malloc((self->state_count+1) * sizeof(struct state_set));
    for(f=0;f<self->alpha_count;f++){
      self->transitions[i][f].capacity = self->alpha_count*(self->state_count+1);
      self->transitions[i][f].size = 0;
      self->transitions[i][f].states = malloc(sizeof(size_t));
    }
  }

  self = (struct fa*) malloc(sizeof(struct fa));
}

void fa_destroy(struct fa *self){
  self->alpha_count=0;
  self->state_count=0;
  free(self->initial_states);
  free(self->final_states);
  int i,f;
  for(i=0;i<self->state_count;i++){
    for(f=0;f<self->alpha_count;f++){
      free(self->transitions[i][f].states);
    }
    free(self->transitions[i]);
  }
  free(self->transitions);

}

void fa_set_state_initial(struct fa *self, size_t state){
  if(state>=self->state_count){
    return;
  }
  self->initial_states[state]=true;
}

void fa_set_state_final(struct fa *self, size_t state){
  if(state>=self->state_count){
    return;
  }
  self->final_states[state]=true;
}

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to){//TODO
  int s;
  if(from>=self->state_count || to>=self->state_count ||
     (size_t)alpha-'a' >= self->alpha_count){
    return;
  }

  if(self->transitions[from][(size_t) alpha - 'a'].size >
     self->transitions[from][(size_t) alpha - 'a'].capacity){
    fprintf(stderr,"plus de place, aggrandissement non pris en charge taille maximum de transitions alpha*state");
  }


  if(self->transitions[from][(size_t) alpha - 'a'].size>0){
    for(s=0;s<self->transitions[from][(size_t) alpha - 'a'].size;s++){
        if(self->transitions[from][(size_t) alpha - 'a'].states[s]==to){
          return;
        }
    }
  }
  self->transitions[from][(size_t) alpha - 'a'].states[self->transitions[from]
    [(size_t) alpha - 'a'].size]=to;
  self->transitions[from][(size_t) alpha - 'a'].size+=1;
}

void fa_pretty_print(const struct fa *self, FILE *out){
  int i,f,s;
  fprintf(out, "Initial states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->initial_states[i]==true){
      fprintf(out, "%d ", i);
    }
  }

  fprintf(out, "\nFinal states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->final_states[i]==true){
      fprintf(out, "%d ",i);
    }
  }

  fprintf(out, "\nTransitions :");
  for(i=0;i<self->state_count;i++){
    fprintf(out, "\n\tFor State %d:",i);
    if(self->is_trash_on==true && i==self->state_count-1){
      fprintf(out," (Trash State)");
    }
    for(f=0;f<self->alpha_count;f++){
      fprintf(out, "\n\t\tFor letter %c: ",(unsigned int) f + 'a');
      for(s=0;s<self->transitions[i][f].size;s++){
        fprintf(out, "%zu ",self->transitions[i][f].states[s]);
      }
    }
  }
  fprintf(out, "\n");
}


//------------------------TP2----------------------//
bool transitions_exist(struct fa *self,size_t from, char alpha, size_t to){
  int i;
  for(i=0;i<self->transitions[from][(size_t) alpha - 'a'].size;i++){
    if(self->transitions[from][(size_t) alpha - 'a'].states[i]==to){
      return true;
    }
  }
  return false;
}

void fa_remove_transition(struct fa *self, size_t from, char alpha, size_t to){
  int s,c;
  if(from>=self->state_count || to>=self->state_count ||
     (size_t)alpha-'a' >= self->alpha_count){
    return;
  }

  if(self->transitions[from][(size_t) alpha - 'a'].size>0){
    for(s=0;s<self->transitions[from][(size_t) alpha - 'a'].size;s++){
        if(self->transitions[from][(size_t) alpha - 'a'].states[s]==to){
          for(c=s+1;c<self->transitions[from][(size_t) alpha - 'a'].size;c++){
            self->transitions[from][(size_t) alpha - 'a'].states[s]=
              self->transitions[from][(size_t) alpha - 'a'].states[c];
          }
          self->transitions[from][(size_t) alpha - 'a'].size-=1;
        }
    }
  }
  return;
}

void fa_remove_state(struct fa *self, size_t state){
  int i,j,s;
  if(state>=self->state_count){
    return;
  }
  i=state;
  for(j=0;j<self->state_count;j++){
    for(s=0;s<self->alpha_count;s++){
      fa_remove_transition(self, i, 'a' + s, j);
      fa_remove_transition(self, j, 'a' + s, i);
    }
  }
  for(i=state;i<self->state_count;i++){
    for(j=0;j<self->state_count;j++){
      for(s=0;s<self->alpha_count;s++){
        if(transitions_exist(self,j,'a'+s,i)) {
          fa_remove_transition(self, j, 'a' + s, i);
          if(i==j){
            fa_add_transition(self, i - 1, 'a' + s, j-1);
          }else {
            fa_add_transition(self, j, 'a' + s, i - 1);
          }
        }
        if(transitions_exist(self, i, 'a' + s, j)) {
          fa_remove_transition(self, i, 'a' + s, j);
          fa_add_transition(self, i - 1, 'a' + s, j);
        }
      }
    }
  }
  self->state_count-=1;
}

size_t fa_count_transitions(struct fa *self){
  size_t count=0;
  int i,j,s;
  for(i=0;i<self->state_count;i++){
    for(j=0;j<self->state_count;j++){
      for(s=0;s<self->alpha_count;s++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
    }
  }
  return count;
}

bool fa_is_deterministic(struct fa *self){
  int ini_count=0,count=0,i,j,s;
  for(i=0;i<self->state_count;i++){
    //checking for multiple initial_states
    if(ini_count>1){
      return false;
    }
    if(self->initial_states[i]==true){
      ini_count+=1;
    }
    //Checking for multiple choice for a letter
    for(s=0;s<self->alpha_count;s++){
      count=0;
      for(j=0;j<self->state_count;j++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
      if(count>1){
        return false;
      }
    }

  }
  return true;
}


bool fa_is_complete(struct fa *self){
  int i,j,s,count;
  for(i=0;i<self->state_count;i++){
    for(s=0;s<self->alpha_count;s++){
      count=0;
      for(j=0;j<self->state_count;j++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
      if(count==0){
        return false;
      }
    }
  }
  return true;
}

void fa_make_complete(struct fa *self){
  if(fa_is_complete(self)==true){
    return;
  }
  int i,j,s,count;
  for(i=0;i<self->state_count;i++){
    for(s=0;s<self->alpha_count;s++){
      count=0;
      for(j=0;j<self->state_count;j++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
      if(count==0){
        if(self->is_trash_on==false){
          self->is_trash_on=true;
          self->state_count+=1;
        }
        fa_add_transition(self,i,'a'+s,self->state_count-1);
      }
    }
  }
  return;
}

void fa_merge_states(struct fa *self, size_t s1, size_t s2){
  int i,s;
  for(i=0;i<self->state_count;i++){
    for(s=0;s<self->alpha_count;s++){
      if(transitions_exist(self,i,'a'+s,s2)){
        fa_remove_transition(self,i,'a'+s,s2);
        if(i==s2){
          fa_add_transition(self, s1, 'a' + s, s1);

        }else {
          fa_add_transition(self, i, 'a' + s, s1);
        }
      }
      if(transitions_exist(self,s2,'a'+s,i)){
        fa_remove_transition(self,s2,'a'+s,i);
        fa_add_transition(self,s1,'a'+s,i);
      }
    }
  }
  fa_remove_state(self,s2);
}
//4.6
bool fa_is_language_empty(const struct fa *self){
  struct graph gf;
  graph_create_from_fa(&gf,self,false);
  size_t i,j;
  for(i=0;i<self->state_count;i++){
    if(self->initial_states[i] == true){
      if(self->final_states[i] == true && graph_has_transitions(&gf,i,i)){
        graph_destroy(&gf);
        return false;
      }
      for(j=0;j<self->state_count;j++){
        if(self->final_states[j] == true){
          if(graph_has_path(&gf,i,j) && i != j){
            graph_destroy(&gf);
            return false;
          }
        }
      }
    }
  }
  graph_destroy(&gf);
  return true;
}

//5.1
void fa_remove_non_accessible_states(struct fa *self){
  struct graph gf;
  graph_create_from_fa(&gf,self,false);
  size_t i,j;
  bool delete;
  for(j=0;j<self->state_count;j++){
    delete=true;
    for(i=0;i<self->state_count;i++){
      if(self->initial_states[i] == true){
        if (graph_has_path(&gf, i, j)) {
          delete=false;
        }
      }
    }
    if(delete==true) {
      printf("removing state : %zu\n", j);
      fa_remove_state(self, j);
      fa_remove_non_accessible_states(self);
    }
  }
  graph_destroy(&gf);
}

//5.2
void fa_remove_non_co_accessible_states(struct fa *self){//Not fully working
  struct graph gf;
  graph_create_from_fa(&gf,self,true);
  size_t i,j=malloc(sizeof(size_t));
  bool delete;
  for(j=0;j<self->state_count;j++){
    delete=true;
    for(i=0;i<self->state_count;i++) {
      if (self->final_states[i] == true) {
        if (graph_has_path(&gf, i, j)) {
          delete = false;
        }
      }
    }
    if(delete==true) {
      printf("removing state : %zu\n", j);
      fa_remove_state(self, j);
      //fa_remove_non_co_accessible_states(self);
    }
  }
  graph_destroy(&gf);
}

//6.1
void fa_create_product(struct fa *self, const struct fa *lhs, const struct fa *rhs){
  fa_create(self, MIN(lhs->alpha_count, rhs->alpha_count), (lhs->state_count*rhs->state_count));
  size_t i,f,s;
  for(i=0;i<self->state_count;i++) {
    for(f=0;f<self->state_count;f++) {
      if (lhs->initial_states[i] == true && rhs->initial_states[f] == true) {
        self->initial_states[i*lhs->state_count+f] = true;
      }
      if (lhs->final_states[i] == true && rhs->final_states[f] == true) {
        self->final_states[i*rhs->state_count+f] = true;
      }
    }
  }
  //TODO redux transitions
  size_t maxsize = self->state_count;
  size_t q1 = maxsize;
  size_t q2 = maxsize;
  for(i = 0; i < lhs->state_count; i++) {
    for (s = 0; s < self->alpha_count; s++) {
      for (f = 0; f < rhs->state_count; f++) {
        printf("%zu -%c> %zu", i, 'a' + s, f);
        if (transitions_exist(lhs, i, 'a' + s, f)) {
          //printf("lhs : %zu -%c> %zu\n",i,'a'+s,f);
          q1 = f;
        }
        if (transitions_exist(rhs, i, 'a' + s, f)) {
          //printf("rhs : %zu -%c> %zu\n",i,'a'+s,f);
          q2 = f;
        }
        printf("\n");
      }
      if (q1 != maxsize && q2 != maxsize) {
        //printf("lhs : %zu -%c> %zu\n",i,'a'+s,q1);
        //printf("rhs : %zu -%c> %zu\n",i,'a'+s,q2);
        //printf("%zu -%c> %zu\n", i * lhs->state_count + i, 'a' + s, q1 * rhs->state_count + q2);
        fa_add_transition(self, i * lhs->state_count + i, 'a' + s, q1 * rhs->state_count + q2);
        q1 = maxsize;
        q2 = maxsize;
      }
    }
  }
}
//6.2
bool fa_has_empty_intersection(const struct fa *lhs, const struct fa *rhs){
  struct fa tmp;
  fa_create_product(&tmp,lhs,rhs);
  bool res = fa_is_language_empty(&tmp);
  fa_destroy(&tmp);
  return res;
}

//7.1
bool fa_create_deterministic(struct fa *self, const struct fa *nfa){
  if(fa_is_deterministic(nfa)){
    fa_create(self,nfa->alpha_count,nfa->state_count);
    size_t i,f,s;
    for(i=0;i<self->state_count;i++){//creation of state before to avoid having error of creation of transition with destination not yet created
      self->initial_states[i]=nfa->initial_states[i];
      self->final_states[i]=nfa->final_states[i];
    }
    for(i=0;i<self->state_count;i++){//State From
      for(f=0;f<self->state_count;f++){//State To
        for(s=0;s<self->alpha_count;s++){//letter
          if(transitions_exist(nfa,i,'a'+s,f)){
            fa_add_transition(self,i,'a'+s,f);
          }
        }
      }
    }
    return true;
  } else {
    size_t numberInitialStates=0;
    size_t i;
    size_t *initial_states = malloc((self->state_count+1)*sizeof(size_t));
    for(i=0;i<self->state_count;i++){
      if(self->initial_states[i]){
        initial_states[numberInitialStates]=i;
        numberInitialStates+=1;
      }
    }
    if(numberInitialStates==0){
      sprintf(stderr,"Nothing can be done, there is no initial state ...\n");
      return false;
    }
    if(numberInitialStates>1){
      for(i=0;i<numberInitialStates;i++){

      }
    }
    return true;
  }
}
//7.2
bool fa_is_included(const struct fa *lhs, const struct fa *rhs){
  if(lhs->state_count>rhs->state_count){
    return false;
  }
  if(lhs->alpha_count>rhs->alpha_count){
    return false;
  }
  int i;
  int max;
  if(lhs->state_count<=rhs->state_count){
    max=lhs->state_count;
  } else {
    max=rhs->state_count;
  }
  for(i=0;i<max;i++){
    if(lhs->initial_states[i]!=rhs->initial_states[i]){
      return false;
    }
    if(lhs->final_states[i]!=rhs->final_states[i]){
      return false;
    }
  }

  if(fa_count_transitions(lhs)>fa_count_transitions(rhs)){
    return false;
  }

  // It isn't true, but it could be true, see it as it could be included
  return true;
}

//8.1
bool fa_are_nerode_equivalent(const struct fa *self, size_t s1, size_t s2){
  //
}
//8.2
void fa_create_minimal_nerode(struct fa *self,  const struct fa *other){

}
//8.3
void fa_create_minimal_moore(struct fa *self, const struct fa *other){

}
