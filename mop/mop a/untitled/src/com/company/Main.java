package com.company;

import java.util.*;
import java.text.SimpleDateFormat;


class Film{
    private String name;
    private String date;
    Film(String name) {
        this.name = name;
        this.date = getToday();
    }

    String getDate() {
        return date;
    }

    String getToday() {
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yy");
        return sdf.format(date);
    }
}

class Carte{
    private String name;
    private String surname;
    private String secret;
    private float solde;
    private float maxSolde;
    private static int nbCarte;


    Carte(String name, String surname, float solde, float maxSolde) {
        this.name = name;
        this.surname = surname;
        this.solde = solde;
        this.maxSolde = maxSolde;
        this.secret = (getToday()+nbCarte);
        nbCarte += 1;
    }
    void recharger(float currency){
        if (currency+solde<maxSolde) {
            solde+=currency;
        }else{
            System.out.print("Plafond du solde dépasser ("+maxSolde+")");
            System.exit(1);
        }
    }
    void afficherCarte(){
        System.out.println(name+" "+surname+" "+"("+solde+")");
    }

    float getSolde(){
        return solde;
    }

    String getToday() {
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yy");
        return sdf.format(date);
    }

    boolean isSecret(String essai){
        return secret.equalsIgnoreCase(essai);
    }
}

public class Main {
    static boolean getPlace(Carte membre, Film film){
        if(membre.getSolde()>7.0f && film.getDate().equalsIgnoreCase(getToday())){
            Scanner sc = new Scanner(System.in);
            System.out.println("Veuillez saisir votre code :");
            String str = sc.nextLine();
            int i=1;
            while(membre.isSecret(str)!=true && i<3){
                System.out.println("Code Incorrect, veuillez resaisir votre code :");
                str = sc.nextLine();
                i+=1;
            }
            if(membre.isSecret(str)!=true){
                return false;
            }else{
                membre.recharger(-7.0f);
                return true;
            }
        }else{
            return false;
        }
    }

    static String getToday() {
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yy");
        return sdf.format(date);
    }

    public static void main(String[] args) {
        Carte test = new Carte ("Goodwin","Benjamin",0.0f,100.0f);
        test.afficherCarte();
        test.recharger(10.0f);
        test.afficherCarte();
        Film StarWars=new Film("Star Wars 7");
        boolean res=getPlace(test,StarWars);
        if (res==false){
            System.out.print("Erreur lors de l'achat du billet");
            System.exit(1);
        }else{
            System.out.print("Billet en cours d'impression");
        }
    }
}