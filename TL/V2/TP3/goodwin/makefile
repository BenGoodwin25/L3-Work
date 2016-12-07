CC=gcc
CFLAGS=-g -Wall -std=c99
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
EXEC=testfa

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $(OBJ) $(CFLAGS)

%.o: %.c %.h
	$(CC) -o $@ $(CFLAGS) -c $<

clean:
	rm *.o; rm $(EXEC)
