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
public class Joueur {
    private List<Carte>main = new ArrayList(); //Collection est une clase abstraite qui hérite de TreeSet ...
                                                     //Collections est une classe qui possede des méthodes static pour effectuer des opérations entre collections.

    public int points=0;
    public String nom;
    public Joueur(String nom) {
        this.nom = nom;
    }

    public String getNom(){
        return nom;
    }
    public int getNbCarteEnMains(){
        return main.size();
    }

    public Carte retireCarteValeurLaPlusElevee() {
        Collections.shuffle(main);
        Carte carte =main.get(0);
        main.remove(carte);
        return carte;
    }

    public Carte retireCarteValeurLaPlusPetite(Couleur couleur){
        int index=0;
        while (index<main.size() && main.get(index).getCouleur() != couleur ) {
            index+=1;
        }
        if(index==main.size()) {
            return null;
        } else {
            Carte carteLaPlusPetite = main.get(index);
            while (index<main.size()){
                Carte carteCourante=main.get(index);
                if(carteCourante.getCouleur() !=couleur &&
                        carteCourante.getValeur().getPointsBataille() <
                                carteLaPlusPetite.getValeur().getPointsBataille()){
                    carteLaPlusPetite=carteCourante;

                }
                index++;
            }
            main.remove(carteLaPlusPetite);
            return carteLaPlusPetite;
        }
    }

    public Carte retireCarteValeurLaPlusPetite(){
        if (main.size()==0) {
            return null;
        } else {
            Carte carteLaPlusPetite = main.get(0);
            int index=1;
            while (index<main.size()){
                Carte carteCourante=main.get(index);
                if(carteCourante.getValeur().getPointsBataille() < carteLaPlusPetite.getValeur().getPointsBataille()){
                    carteLaPlusPetite=carteCourante;
                }
                index++;
            }
            main.remove(carteLaPlusPetite);
            return carteLaPlusPetite;
        }
    }

    public Carte retireCarteValeurSuperieure(Carte carte) {
        int index = 0;
        while (index < main.size() && main.get(index).getCouleur() != carte.getCouleur()) {
            index += 1;
        }
        if (index == main.size()) {
            return null;
        } else {
            Carte carteValeurSuperieure = main.get(index);
            while (index < main.size()) {
                Carte carteCourante = main.get(index);
                if (carteCourante.getCouleur() != carte.getCouleur() &&
                        carteCourante.getValeur().getPointsBataille() <
                                carteValeurSuperieure.getValeur().getPointsBataille()) {
                    carteValeurSuperieure = carteCourante;

                }
                index++;
            }
            main.remove(carteValeurSuperieure);
            return carteValeurSuperieure;
        }
    }
    @Override
    public String toString(){
        return nom+" a en main "+main.toString();
    }

    public int ajouterCarte(Carte c) {
        main.add(c);
        return main.size();
    }
    
}
