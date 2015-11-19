package com.company;

public class De {
	private int v; //valeur
	
	public De () {
		v=0;
	}
	
	public void rouler() {
		v=(int)(Math.random()*6)+1;
	}
	
	int getValeur() {
		return v;
	}
	
	public String toString () {
		String res="["+v+"]";
		return res;
	}
	
}