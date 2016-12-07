#include <stdlib.h>
#include <stdbool.h>

#include "fa.h"
#include "graph.h"

//4.1
void graph_create(struct graph *self, size_t maxStates){
  self->maxStates=malloc(sizeof(size_t));
  self->maxStates=maxStates;
	self->adjacencyList=calloc(maxStates, sizeof(struct list));
  size_t i;
  for(i=0; i<self->maxStates; i++){
    createList(&self->adjacencyList[i]);
  }
}

bool graph_add_state(struct graph *self, size_t state){
  if(state < self->maxStates && isEmptyList(&self->adjacencyList[state])){
    return addNode(&self->adjacencyList[state], state);
  } else {
    return false;
  }
}

bool graph_add_transitions(struct graph *self, size_t from, size_t to){
  if(graph_has_transitions(self, from, to)){
    return false;
  }
  if(graph_state_exist(self, from) && graph_state_exist(self, to)){
    return addNode(&self->adjacencyList[from], to);
  }
  return false;
}

bool graph_state_exist(struct graph *self, size_t state){
  if(state < self->maxStates && !isEmptyList(&self->adjacencyList[state])){
    return true;
  } else {
    return false;
  }
}

bool graph_has_transitions(struct graph *self, size_t from, size_t to){
  struct list visit;
  visit.first = self->adjacencyList[from].first;
  bool found = false;
  while(visit.first->next != NULL && found == false){
    if(visit.first->state == to){
      found = true;
    }
    visit.first=visit.first->next;
  }
  return found;
}

//4.2
void graph_depth_first_search(const struct graph *self, size_t state, bool *visited){
  visited[state]=true;
  struct list visit;
  visit.first = self->adjacencyList[state].first;
  while(visit.first->next != NULL){
    if(visited[visit.first->state] == false) {
      graph_depth_first_search(self, visit.first->state, visited);
    }
    visit.first=visit.first->next;
  }
}

//4.3
bool graph_has_path(const struct graph *self, size_t from, size_t to){
  bool *visited;
  visited=malloc(sizeof(bool)*self->maxStates);
  size_t i;
  size_t max = self->maxStates;
  for(i=0;i<max;i++){
    visited[i]=false;
  }
  graph_depth_first_search(self,from,visited);
  bool result=visited[to];
  free(visited);
	return result;
}

//4.4
void graph_create_from_fa(struct graph *self, const struct fa *fa, bool inverted){
  graph_create(self,fa->state_count);
  size_t i,f,s;
  for(i=0;i<fa->state_count;i++){//creation of state before to avoid having error of creation of transition with destination not yet created
    graph_add_state(self,i);
  }
  for(i=0;i<fa->state_count;i++){//State From
    for(f=0;f<fa->alpha_count;f++){//letter
      for(s=0;s<fa->transitions[i][f].size;s++){//State To
        if(inverted == true){
          //printf("State From:%zu, To:%zu, with:%c\n", fa->transitions[i][f].states[s], i, (unsigned char) f+'A');
          graph_add_transitions(self,fa->transitions[i][f].states[s],i);
        } else {
          //printf("State From:%zu, To:%zu, with:%c\n", i, fa->transitions[i][f].states[s], (unsigned char) f+'A');
          graph_add_transitions(self,i,fa->transitions[i][f].states[s]);
        }
      }
    }
  }
}

//4.5
void graph_destroy(struct graph *self){
  size_t i;
  for(i=0; i<self->maxStates;i++){
    destroyList(&self->adjacencyList[i]);
  }
  free(self->adjacencyList);
  self->adjacencyList=NULL;
}

