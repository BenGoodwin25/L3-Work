package com.company;

import java.lang.*;

public class Jet{
	private De  jt []; //trois des
	int nbRouler;
	
	public  Jet() {
		jt=new De  [3];
		for (int i=0;i<3;i++)
			jt[i]=new De();
		nbRouler=0;
	}
	
	public void roulerTroisDes() {
		for (int i=0;i<3;i++) 
			jt[i].rouler();
	}
	
	public void roulerDe(int i) {
			jt[i].rouler();
	}
	
	public int getValeur(int i) {
			return jt[i].getValeur();
	}
	
	@Override
	public String toString () {
		String res="";
		for (int i=0;i<3;i++) 
			res=res+jt[i]+" ";
		return res;
	}
	
	public void incrRouler() {
		nbRouler+=1;
	}
	
	public int getGain() {
		int g=0;
		// tri
		int temp;
		int d1=jt[0].getValeur();
		int d2=jt[1].getValeur();
		int d3=jt[2].getValeur();
		if (d1 > d2) {
			temp=d2;
			d2=d1;
			d1=temp;
		}
		if (d1 > d3) {
			temp=d3;
			d3=d1;
			d1=temp;
		}
		if (d2 > d3) {
			temp=d3;
			d3=d2;
			d2=temp;
		}
		
		if ((d1==1) && (d2==2) && (d3==4) )
			g=50;
		else
			if (d1==d3)
				g=d1*3;
			else
				if  ((d1==d2) || (d2==d3))
					g=d2*2;
		return g;
	}
			
	
	
	public int getNbRouler () {
		return nbRouler;
	}
	
/*	public static void main (String [] args) {
		Jet jtt=new Jet();
		jtt.roulerTroisDes();
		System.out.println(jtt);
	}
	*/
	
}