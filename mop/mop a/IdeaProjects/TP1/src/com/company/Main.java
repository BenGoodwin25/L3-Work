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

    String getNameFilm(){
        return name;
    }
}

class Carte{
    private String name;
    private String surname;
    private String secret;
    private float solde;
    private float maxSolde;
    private static int nbCarte;
    private ArrayList<Film> listFilm;


    Carte(String name, String surname, float solde, float maxSolde) {
        this.name = name;
        this.surname = surname;
        this.solde = solde;
        this.maxSolde = maxSolde;
        this.secret = (getToday()+nbCarte);
        nbCarte += 1;
        listFilm = new ArrayList<Film>();
    }

    void recharger(float currency){
        if (currency+solde<=maxSolde) {
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

    void addFilm(Film film){
        listFilm.add(film);
    }

    ArrayList<Film> getListFilm(){
        return listFilm;
    }
}

class Club{
    private Map<Carte,ArrayList<Film>> allListFilm;

    Club(Carte member) {
        allListFilm = new HashMap();
        allListFilm.put(member,member.getListFilm());
    }

    void addMember(Carte member){
        allListFilm.put(member,member.getListFilm());
    }

    void refreshListFilm(Carte member){
        if(allListFilm.containsKey(member)){
            allListFilm.remove(member);
        }
        allListFilm.put(member,member.getListFilm());
    }

    void printListFilm(Carte member){
        int size=allListFilm.get(member).size();
        String res="[";
        if(size>0) {
            for (int i = 0; i < size - 1; i++) {
                res += allListFilm.get(member).get(i).getNameFilm() + ",";
            }
            res += allListFilm.get(member).get(size - 1).getNameFilm() + "]";
            System.out.println(res);
        }
    }
    void printAllListFilm(){
        
    }
}

public class Main {
    static boolean getPlace(Carte membre, Film film){
        final float price=7.0f;
        Scanner sc = new Scanner(System.in);
        System.out.println("Veuillez saisir votre code :");
        String str = sc.nextLine();
        int i=1;
        while(!membre.isSecret(str) && i<3){
            System.out.println("Code Incorrect, veuillez resaisir votre code :");
            str = sc.nextLine();
            i+=1;
        }
        if(!membre.isSecret(str)){
            return false;
        }else{
            if(membre.getSolde()>price && film.getDate().equalsIgnoreCase(getToday())){
                membre.recharger(-price);
                membre.addFilm(film);
                return true;
            }else{
                return false;
            }
        }
    }

    static void checkPlace(boolean res, Carte member,Club assos) {
        if (res) {
            System.out.println("Billet en cours d'impression");
            assos.refreshListFilm(member);
        } else {
            System.out.println("Erreur lors de l'achat du billet");
            System.exit(1);
        }
    }
    static void checkPlace(boolean res, Carte member) {
        if (res) {
            System.out.println("Billet en cours d'impression");
        } else {
            System.out.println("Erreur lors de l'achat du billet");
            System.exit(1);
        }
    }

    static String getToday() {
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yy");
        return sdf.format(date);
    }

    public static void main(String[] args) {
        Carte buddy = new Carte ("Goodwin","Benjamin",90.0f,100.0f);
        Carte buddy2 = new Carte ("Goo","Ben",100.0f,100.0f);
        Club assos = new Club (buddy);
        buddy.recharger(10.0f);
        Film sortie1=new Film("Star Wars 7");
        Film sortie2=new Film("Batman");
        boolean res=getPlace(buddy,sortie1);
        checkPlace(res,buddy,assos);
        res=getPlace(buddy2,sortie2);
        checkPlace(res,buddy2);
        assos.addMember(buddy2);
        assos.printListFilm(buddy);
        assos.printListFilm(buddy2);
    }
}