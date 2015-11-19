/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company;

import java.util.*;

/**
 *
 * @author Vincent
 */

//un jeu de carte est un ensemble de carte = public class JeudeCartes extends TreeSet<Carte> l'utilisateur possede toutes les fonction
//un jeu de carte contient un ensemble de carte = private TreeSet<Carte> cartes on encapsule (privé) le jeu de carte pour pouvoir controler l'acces aux méthodes
public class JeudeCartes
{
    private List<Carte> cartes = new ArrayList<Carte>();
    // on peut mettre cartes = new TreeSet(); directement ici et juste mettre cartes dans le constructeur
    
    public List<Carte> getCarte() {
        return cartes;
    }
    public JeudeCartes() {
        // on peut faire les 32 cartes a la main = cartes.add(new Cartes(Valeur.Sept, Couleur.CARREAU));
        for(Valeur valeur : Valeur.values()) {
            for(Couleur couleur : Couleur.values()) {
                cartes.add(new Carte(valeur, couleur));
            }
        }
    }
    public void distribuer(Joueur j1, Joueur j2) {
        Collections.shuffle(cartes);
        for(int i=0;i<cartes.size();i++) {
            if(i%2==0) {
                j1.ajouterCarte(cartes.get(i));
            } else {
                j2.ajouterCarte(cartes.get(i));
            }
        }
    }
    
}
