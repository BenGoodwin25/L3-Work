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
public class TdCarte {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    
        Carte carte1;
        Carte carte2;
        Carte carte3;
        
        carte1=new Carte(Valeur.As, Couleur.PIQUE);
        carte2=new Carte(Valeur.As, Couleur.PIQUE);
        carte3=carte1;
        
        if (carte1.equals(carte3)) {
            System.out.println("egales");  
        } else {
            System.out.println("differentes");  
        }
        JeudeCartes monJeu = new JeudeCartes();
        System.out.println(monJeu.getCarte());
        Collections.shuffle((List)monJeu.getCarte());
        System.out.println(monJeu.getCarte());
    }
    
}
