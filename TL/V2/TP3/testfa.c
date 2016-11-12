#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#include "graph.h"
#include "fa.h"

int main(){
  printf("TP3\n");
	struct graph gf;
	graph_create(&gf,6);
  if(!graph_add_state(&gf,1)){
    fprintf(stderr,"couldn't create state\n");
  }
  if(!graph_add_state(&gf,2)){
    fprintf(stderr,"couldn't create state\n");
  }
  if(!graph_add_state(&gf,3)){
    fprintf(stderr,"couldn't create state\n");
  }
  if(!graph_add_state(&gf,4)){
    fprintf(stderr,"couldn't create state\n");
  }
  if(!graph_add_transitions(&gf,1,2)){
    fprintf(stderr,"couldn't create transitions\n");
  }
  if(!graph_add_transitions(&gf,1,3)){
    fprintf(stderr,"couldn't create transitions\n");
  }
  if(graph_has_path(&gf,1,3)){
    printf("There is a path between 1 and 3\n");
  } else {
    printf("There is no path between 1 and 3\n");
  }
  if(graph_has_path(&gf,3,1)){
    printf("There is a path between 3 and 1\n");
  } else {
    printf("There is no path between 3 and 1\n");
  }
  if(graph_has_path(&gf,1,4)){
    printf("There is a path between 1 and 4\n");
  } else {
    printf("There is no path between 1 and 4\n");
  }
}

