#ifndef GRAPH_H
#define GRAPH_H

#include "list.h"

struct graph{
    size_t maxStates;
    struct list* adjacencyList;
};

//4.1
void graph_create(struct graph *self, size_t maxStates);

bool graph_add_state(struct graph *self, size_t state);

bool graph_add_transitions(struct graph *self, size_t from, size_t to);

bool graph_state_exist(struct graph *self, size_t state);

bool graph_has_transitions(struct graph *self, size_t from, size_t to);

void graph_remove_state(struct graph *self, size_t state);

void graph_remove_transitions(struct graph *self, size_t from, size_t to);

//4.2
void graph_depth_first_search(const struct graph *self, size_t state, bool *visited);

//4.3
bool graph_has_path(const struct graph *self, size_t from, size_t to);

//4.4
void graph_create_from_fa(struct graph *self, const struct fa *fa, bool inverted);

//4.5
void graph_destroy(struct graph *self);

#endif