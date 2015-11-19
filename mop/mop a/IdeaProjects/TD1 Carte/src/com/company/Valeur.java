/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company;

/**
 *
 * @author Vincent
 */
public enum Valeur {
    Sept (0,0,0), Huit (0,0,0), Neuf (0,0,14), Dix (5,10,10), Valet (6,2,20), Dame (7,3,3), Roi (8,4,4), As (11,11,11);

    private final int pointBataille;
    private final int pointBelote;
    private final int pointAtoutBelote;
    
    Valeur(int pointBataille, int pointBelote, int pointAtoutBelote) {
        this.pointBataille = pointBataille;
        this.pointBelote = pointBelote;
        this.pointAtoutBelote = pointAtoutBelote;
    }
    
    int getPointsBataille() {
        return this.pointBataille;
    }



}
