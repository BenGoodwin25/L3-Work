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
public class Carte implements Comparable<Carte>{
    private Couleur couleur;
    private Valeur valeur;
    
    public Couleur getCouleur() {
        return couleur;
    }
    
    public Valeur getValeur() {
        return valeur;
    }
    
    public Carte(Valeur valeur, Couleur couleur) {
        this.couleur = couleur;
        this.valeur = valeur;
    }
    
    @Override
    public boolean equals(Object o) {
        return(o instanceof Carte && (((Carte)o).getCouleur() == this.couleur) && (((Carte)o).getValeur() == this.valeur));
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.couleur);
        hash = 59 * hash + Objects.hashCode(this.valeur);
        return hash;
    }
    
    @Override
    public String toString()
    {
        return "{"+valeur+" de "+couleur+"}";
    }

    public int getPoints()
    {
        return valeur.getPointsBataille();
    }
    
    @Override
    public int compareTo(Carte o) {
        int difference = this.valeur.ordinal()-o.valeur.ordinal();
        if(difference==0) {
            return this.couleur.ordinal()-o.couleur.ordinal();
        } else {
            return difference;
        }
    }
    
    public static Comparator<Carte> ordreCouleurValeur =new Comparator<Carte>() {
        public int Compare(Carte c1, Carte c2) {
            int difference = c1.couleur.ordinal()-c2.couleur.ordinal();
            if(difference==0) {
                return c1.valeur.ordinal()-c2.valeur.ordinal();
            } else {
                return difference;
            }
        }

        @Override
        public int compare(Carte o1, Carte o2) {
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
    };
}

