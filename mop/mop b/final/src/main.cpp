//--------------------------------------------------------------------------------------------------
// Fichier     : main.cpp
// Description : Implémentation du point d'entrée de l'application.
//--------------------------------------------------------------------------------------------------
#include <stdio.h>

#include "AgenceImmobiliere.h"

//--------------------------------------------------------------------------------------------------
/// Point d'entrée de l'application
//--------------------------------------------------------------------------------------------------
int main(void)
{
	printf("Bienvenue dans l'application Agence Immobiliere !\n");

	CAgence agence;

	while (1)
	{
		std::cout << "------------------------------------------------------------\n";
		std::cout << "1 : Ajout d'un nouveau client\n";
		std::cout << "2 : Ajout d'un compte pour un client existant\n";
		std::cout << "3 : Suppression d'un client\n";
		std::cout << "4 : Suppression d'un compte\n";

		std::cout << "5 : Affichage du nombre total de clients\n";
		std::cout << "6 : Affichage du nombre total de comptes ouvert\n";

		std::cout << "7 : Affichage de la liste des clients\n";
		std::cout << "8 : Affichage de la liste des comptes\n";//TODO
		std::cout << "9 : Affichage d'un compte\n";//TODO

		std::cout << "10 : Depots ou Retrait sur le compte d'un client(pos : depot, inf : retrait)\n";
		std::cout << "11 : Transfer d'un compte a l'autre d'un client\n";
		
		std::cout << "\n";
		
		std::cout << "Entrez votre choix : ";

		int choix = ReadIntBetween(1, 11);
		switch(choix)
		{
		case 1:  { agence.AjoutClient();                 } break;
		case 2:  { agence.AjoutBien();                   } break;
		case 3:  { agence.SuppressionClient();           } break;
		case 4:  { agence.SuppressionBien();             } break;
		case 5:  { agence.AfficheNombreTotalDeClients(); } break;
		case 6:  { agence.AfficheNombreTotalDeBiens();   } break;
		case 7:  { agence.AfficheListeClients();         } break;
		case 8:  { agence.AfficheListeBiens();           } break;
		case 9:  { agence.AfficheBien();                 } break;
		case 10: { agence.SetSolde(); 	                 } break;
		case 11: { /*agence.Transfer();  */                  } break;
		default: {							 			 } break;
		}
	}

	return(0);
}

