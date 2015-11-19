package com.company;

/**
 *
 * @author Vincent
 */
public class Partie {
    private Joueur joueur1=new Joueur("Jean");
    private Joueur joueur2=new Joueur("Philippe");
    private JeudeCartes jeu=new JeudeCartes();

    Partie(){
        jeu.distribuer(joueur1,joueur2);
        System.out.println(joueur1);
        System.out.println(joueur2);
        Pli(joueur1,joueur2);
    }

    public static void main (String) {
        Partie p=new Partie();
    }

    private Joueur Pli(Joueur e,Joueur f){
        Carte c1=e.retireCarteValeurLaPlusElevee();
        if(c1==null){
            throw new RuntimeException(e.getNom()+" n'a plus de carte");
        } else if (f.getNbCarteEnMains()==0) {
            throw new RuntimeException(f.getNom()+" n'a plus de carte en mains");
        } else {
            Carte c2=f.retireCarteValeurLaPlusPetite(c1.getCouleur());
            if (c2!=null) { //Joueur e fait le pli
                e.points+=c1.getValeur().getPointsBataille()+c2.getValeur().getPointsBataille();
                return e;
            } else {
                c2=f.retireCarteValeurSuperieure(c1);
                if(c2!=null){ //Joueur f fait le pli
                    f.points+=c1.getValeur().getPointsBataille()+c2.getValeur().getPointsBataille();
                    return f;
                } else {
                    c2 = f.retireCarteValeurLaPlusPetite();
                    if (c2 != null) {
                        e.points += c1.getValeur().getPointsBataille() + c2.getValeur().getPointsBataille();
                        return e;
                    } else {
                        throw new RuntimeException(f.getNom() + " Error");
                    }
                }
            }
        }
    }
}
