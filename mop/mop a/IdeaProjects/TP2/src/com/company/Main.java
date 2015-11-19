package com.company;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

class CompteClic1 extends JFrame {
    public CompteClic1(){
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel z2= new JPanel();
        z2.setBackground (Color.green);
        setContentPane(z2);

        setLayout(new BorderLayout());

        // placer les composants sur un panel
        JPanel z1= new JPanel();
        // le label est un ecouteur
        ListenerLabel e=new ListenerLabel();
        e.setBackground(Color.YELLOW);
        ListenerLabel f=new ListenerLabel();
        f.setBackground(Color.YELLOW);
        ListenerLabel g=new ListenerLabel();
        g.setBackground(Color.YELLOW);



        // le bouton est une source pour l'ecouteur e
        JCheckBox a=new JCheckBox("Dé 1");
        z1.add(a);
        z1.add(e);

        // le bouton est une source pour l'ecouteur e
        JCheckBox b=new JCheckBox("Dé 2");
        z1.add(b);
        z1.add(f);

        // le bouton est une source pour l'ecouteur e
        JCheckBox c=new JCheckBox("Dé 3");
        z1.add(c);
        z1.add(g);
        z2.add(z1,BorderLayout.NORTH);

        JPanel z3= new JPanel();
        JButton x=new JButton("Nouvelle Partie");
        JButton y=new JButton("Rouler dés sélectionnés");
        JButton z=new JButton("Valider Coup");
        z3.add(x);
        z3.add(y);
        z3.add(z);

        z2.add(z3,BorderLayout.SOUTH);

        // Les "Ecouteurs"
        a.addActionListener(e);
        b.addActionListener(f);
        c.addActionListener(g);
        // incorporer le panel
    }
}


public class Main {

    public static void main(String[] args) {
        Frame f=new CompteClic1();
        f.setSize(625,400);
        f.setTitle("TP2 Jeu de 421");
        f.setVisible(true);
    }
}

class ListenerLabel extends JLabel implements ActionListener {
    int nbclics=0;
    ListenerLabel(){
        super("0",JLabel.CENTER);
    }

    public void actionPerformed(ActionEvent evt){
        nbclics++;
        setText("" + Integer.toString(nbclics));
    }
}
