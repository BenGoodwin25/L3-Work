CC = g++
CFLAGS = -Wall -g

all:main
main: Facade.cc Maison.cc Rectangle.cc Triangle.cc Porte.cc Fenetre.cc Ouverture.cc Pignon.cc
	$(CC) $(CFLAGS) Facade.cc Maison.cc Rectangle.cc Triangle.cc Porte.cc Fenetre.cc Ouverture.cc Pignon.cc -o main

clean:
		rm -f *.o
mrproper: clean
		rm -f hello

