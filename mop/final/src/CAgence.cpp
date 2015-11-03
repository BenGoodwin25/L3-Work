//--------------------------------------------------------------------------------------------------
// Fichier     : CAgence.cpp
// Description : Implémentation de la classe permettant le stockage d'une agence immobilière.
//--------------------------------------------------------------------------------------------------

#include "AgenceImmobiliere.h"

//--------------------------------------------------------------------------------------------------
/// Constructeur par défaut
//--------------------------------------------------------------------------------------------------
/*explicit*/ CAgence::CAgence(void)
: m_aClient()
, m_aBienCourant()
, m_aBienEpargne()
{

}

//--------------------------------------------------------------------------------------------------
/// Destructeur
//--------------------------------------------------------------------------------------------------
/*virtual*/ CAgence::~CAgence(void)
{

}

//--------------------------------------------------------------------------------------------------
/// Ajout d'un client.
//--------------------------------------------------------------------------------------------------
void CAgence::AjoutClient(void)
{
	std::cout << "Particulier ou Professionnel ?(0 ou 1)\n";
	int type=ReadIntBetween(0,1);

	if(type == 0){
		std::cout << "\n  Ajout d'un client Particulier:\n";

		std::cout << "  Entrez le nom : ";
		std::string strNom;
		ReadString(strNom);
	
		std::cout << "  Entrez le prenom : ";
		std::string strPrenom;
		ReadString(strPrenom);

		std::cout << "  Entrez l'adresse : ";
		std::string strAdresse;
		ReadString(strAdresse);

		std::cout << "  Entrez le telephone : ";
		std::string strTelephone;
		ReadString(strTelephone);
		AjoutClient(CClient((CClient::EType)type, strNom, strPrenom, strAdresse, strTelephone));
	}else{
		std::cout << "\n  Ajout d'un client Professionnel:\n";

		std::cout << "  Entrez la Raison Social : ";
		std::string strNom;
		ReadString(strNom);
	
		std::cout << "  Entrez le SIRET : ";
		std::string strPrenom;
		ReadString(strPrenom);

		std::cout << "  Entrez l'adresse : ";
		std::string strAdresse;
		ReadString(strAdresse);

		std::cout << "  Entrez le telephone : ";
		std::string strTelephone;
		ReadString(strTelephone);
		AjoutClient(CClient((CClient::EType)type, strNom, strPrenom, strAdresse, strTelephone));

	
	}

	std::cout << "  -> Client ajoute !\n\n";
}

//--------------------------------------------------------------------------------------------------
/// Ajout d'un bien.
//--------------------------------------------------------------------------------------------------
void CAgence::AjoutBien(void)
{
	std::cout << "\n  Ajout d'un bien :\n";

	std::cout << "  Entrez le type du bien (0: courant / 1: Epargne) : ";
	int type = ReadIntBetween(0, 1);
	CBien::EType eType = (CBien::EType)type;

	float solde = 0.0f;
	//CBienLot::EStatut eStatut = CBienLot::e_statut_en_vente;
	std::vector<int> aLot;

	switch(eType)
	{
	case CBien::e_type_courant:
	case CBien::e_type_epargne:
		{
			std::cout << "  Entrez le solde : ";
			solde = ReadFloatBetween(0.0f, FLT_MAX);

			//std::cout << "  Entrez le statut (0: en vente / 1: a louer / 2: loue) : ";
			//int statut = ReadIntBetween(0, 2);
			//eStatut = (CBienLot::EStatut)statut;
		}
		break;

	default:
		{

		}
		break;
	}

	switch(eType)
	{
	case CBien::e_type_courant:
		{
			AjoutCourant(CBienCourant(solde));
		}
		break;

	case CBien::e_type_epargne:
		{
			std::cout << "  Entrez le taux : ";
			float taux = ReadFloatBetween(0.0f, FLT_MAX);
			AjoutEpargne(CBienEpargne(solde, taux));
		}
		break;
	}
	std::cout << "  -> Compte ajoute !\n\n";
}

//--------------------------------------------------------------------------------------------------
/// Suppression d'un client.
//--------------------------------------------------------------------------------------------------
void CAgence::SuppressionClient(void)
{
	if (0 == GetNombreClients())
	{
		std::cout << "\n  Supression impossible : aucun client !\n\n";
		return;
	}

	std::cout << "\n  Supression d'un client :\n\n";

	std::cout << "  Entrez le numero du client a supprimer : ";

	int iClient = ReadIntBetween(0, GetNombreClients() - 1);
	SupprimeClient(iClient);

	std::cout << "  -> Client supprime !\n\n";
}

//--------------------------------------------------------------------------------------------------
/// Suppression d'un bien.
//--------------------------------------------------------------------------------------------------
void CAgence::SuppressionBien(void)
{
	std::cout << "\n  Suppression d'un bien :\n";

	std::cout << "  Entrez le type du bien (0: Courant / 1: Epargne) : ";
	int type = ReadIntBetween(0, 1);
	CBien::EType eType = (CBien::EType)type;

	switch(eType)
	{
	case CBien::e_type_courant:
		{
			if (0 == GetNombreCourant())
			{
				std::cout << "\n  Supression impossible : aucun compte courant !\n\n";
				return;
			}
			
			std::cout << "  Entrez le numero du compte courant a supprimer : ";
			int iCourant = ReadIntBetween(0, GetNombreCourant() - 1);
			SupprimeCourant(iCourant);
			std::cout << "  -> Compte supprime !\n\n";
			return;
		}
		break;

	case CBien::e_type_epargne:
		{
			if (0 == GetNombreEpargne())
			{
				std::cout << "\n  Supression impossible : aucun compte Epargne !\n\n";
				return;
			}
			
			std::cout << "  Entrez le numero du compte d'epargne a supprimer : ";
			int iEpargne = ReadIntBetween(0, GetNombreEpargne() - 1);
			SupprimeEpargne(iEpargne);
			std::cout << "  -> Compte supprimee !\n\n";
			return;
		}
		break;
	}
}

//--------------------------------------------------------------------------------------------------
/// Affichage du nombre total de clients de l'agence.
//--------------------------------------------------------------------------------------------------
void CAgence::AfficheNombreTotalDeClients(void)
{
	std::cout << "Nombre total de clients : " << GetNombreClients() << "\n";
}

//--------------------------------------------------------------------------------------------------
/// Affichage du nombre total de biens de l'agence.
//--------------------------------------------------------------------------------------------------
void CAgence::AfficheNombreTotalDeBiens(void)
{
	const int nombreTotalDeBiens = GetNombreCourant()
								 + GetNombreEpargne();

	std::cout << "Nombre total de comptes : " << nombreTotalDeBiens << "\n";
}

//--------------------------------------------------------------------------------------------------
/// Affichage de la liste des clients de l'agence.
//--------------------------------------------------------------------------------------------------
void CAgence::AfficheListeClients(void)
{
	std::cout << "\n  Liste des clients :\n\n";

	const int nombreClients = GetNombreClients();
	for (int nClient = 0 ; nClient < nombreClients ; ++nClient)
	{
		const CClient & client = GetClient(nClient);
		std::cout << "  Client " << nClient << "\n";
		client.Affiche();
	}
}

//--------------------------------------------------------------------------------------------------
/// Affichage de la liste des biens de l'agence.
//--------------------------------------------------------------------------------------------------
void CAgence::AfficheListeBiens(void)
{
	std::cout << "  Liste des comptes : ";
	
	const int nombreCourant = GetNombreCourant();
	for (int nCourant = 0 ; nCourant < nombreCourant ; ++nCourant)
	{
		GetCourant(nCourant).Affiche();
	}
	
	const int nombreEpargne = GetNombreEpargne();
	for (int nEpargne = 0 ; nEpargne < nombreEpargne ; ++nEpargne)
	{
		GetEpargne(nEpargne).Affiche();
	}
	
}

//--------------------------------------------------------------------------------------------------
/// Affichage d'un bien.
//--------------------------------------------------------------------------------------------------
void CAgence::AfficheBien(void)
{
	std::cout << "  Entrez le type du bien (0: courant / 1: epargne) : ";
	int type = ReadIntBetween(0, 2);
	CBien::EType eType = (CBien::EType)type;

	switch(eType)
	{
	case CBien::e_type_courant:
		{
			if (0 == GetNombreCourant())
			{
				std::cout << "\n  Affichage impossible : aucun compte courant !\n\n";
				return;
			}
			
			std::cout << "  Entrez le numero du compte a afficher : ";
			int iCourant = ReadIntBetween(0, GetNombreCourant() - 1);
			GetCourant(iCourant).Affiche();
			return;
		}
		break;

	case CBien::e_type_epargne:
		{
			if (0 == GetNombreEpargne())
			{
				std::cout << "\n  Affichage impossible : aucun compte d'epargne !\n\n";
				return;
			}
			
			std::cout << "  Entrez le numero du compte d'epargne a afficher : ";
			int iEpargne = ReadIntBetween(0, GetNombreEpargne() - 1);
			GetEpargne(iEpargne).Affiche();
			return;
		}
		break;
	}
}

//--------------------------------------------------------------------------------------------------
/// Affichage d'un client.
/// @param Référence sur le client à afficher.
//--------------------------------------------------------------------------------------------------
void CAgence::AjoutClient(const CClient & client)
{
	m_aClient.push_back(client);
}

//--------------------------------------------------------------------------------------------------
/// Suppression d'un client.
/// @param iClient Index du client à supprimer.
//--------------------------------------------------------------------------------------------------
void CAgence::SupprimeClient(int iClient)
{
	m_aClient.erase(m_aClient.begin() + iClient);
}

//--------------------------------------------------------------------------------------------------
/// Retourne le nombre de clients de l'agence.
/// @return Nombre de clients de l'agence.
//--------------------------------------------------------------------------------------------------
int CAgence::GetNombreClients(void) const
{
	return(m_aClient.size());
}

//--------------------------------------------------------------------------------------------------
/// Retourn le n-ième client de l'agence.
/// @return Référence sur le n-ième client de l'agence.
//--------------------------------------------------------------------------------------------------
const CClient & CAgence::GetClient(int nClient) const
{
	return(m_aClient[nClient]);
}

//--------------------------------------------------------------------------------------------------
/// Ajout d'un appartement.
/// @param Référence sur l'appartement à ajouter.
//--------------------------------------------------------------------------------------------------
void CAgence::AjoutCourant(const CBienCourant & courant)
{
	m_aBienCourant.push_back(courant);
}

//--------------------------------------------------------------------------------------------------
/// Supprime le n-ième client de l'agence.
/// @return Référence sur le n-ième client de l'agence.
//--------------------------------------------------------------------------------------------------
void CAgence::SupprimeCourant(int iCourant)
{
	m_aBienCourant.erase(m_aBienCourant.begin() + iCourant);
}

//--------------------------------------------------------------------------------------------------
/// Retourne le nombre d'appartements contenus dans l'agence.
/// @return Nombre d'appartements contenus dans l'agence.
//--------------------------------------------------------------------------------------------------
int CAgence::GetNombreCourant(void) const
{
	return(m_aBienCourant.size());
}

//--------------------------------------------------------------------------------------------------
/// Retourne le n-ième appartement contenu dans l'agence.
/// @return Référence sur le n-ième appartement contenu dans l'agence.
//--------------------------------------------------------------------------------------------------
const CBienCourant & CAgence::GetCourant(int nCourant) const
{
	return(m_aBienCourant[nCourant]);
}

//--------------------------------------------------------------------------------------------------
/// Ajout d'une maison.
/// @param Référence sur la maison à ajouter.
//--------------------------------------------------------------------------------------------------
void CAgence::AjoutEpargne(const CBienEpargne & epargne)
{
	m_aBienEpargne.push_back(epargne);
}

//--------------------------------------------------------------------------------------------------
/// Supprime la n-ième maison contenue dans l'agence.
/// @param Index de la maison à supprimer
//--------------------------------------------------------------------------------------------------
void CAgence::SupprimeEpargne(int iEpargne)
{
	m_aBienEpargne.erase(m_aBienEpargne.begin() + iEpargne);
}

//--------------------------------------------------------------------------------------------------
/// Retourne le nombre de maisons contenues dans l'agence.
/// @return Nombre de maisons contenues dans l'agence.
//--------------------------------------------------------------------------------------------------
int CAgence::GetNombreEpargne(void) const
{
	return(m_aBienEpargne.size());
}

//--------------------------------------------------------------------------------------------------
/// Retourne la n-ième maison contenue dans l'agence.
/// @return Référence sur la n-ième maison contenue dans l'agence.
//--------------------------------------------------------------------------------------------------
const CBienEpargne & CAgence::GetEpargne(int nEpargne) const
{
	return(m_aBienEpargne[nEpargne]);
}

void CAgence::SetSolde(void)
{
	std::cout << "  Entrez le type du compte (0: courant / 1: epargne) : ";
	int type = ReadIntBetween(0, 2);
	CBien::EType eType = (CBien::EType)type;
	switch(eType)
	{
	case CBien::e_type_courant:
		{
			if (0 == GetNombreCourant())
			{
				std::cout << "\n  Action impossible : aucun compte courant !\n\n";
				return;
			}
			
			std::cout << "  Entrez le numero du compte a modifer : ";
			int iCourant = ReadIntBetween(0, GetNombreCourant() - 1);
			std::cout << "  Entrez la valeur de la transaction: ";
			float iTransaction = ReadFloatBetween(0.0f, 100000.0f);
			m_aBienCourant[iCourant].SetSolde(iTransaction);
			GetCourant(iCourant).Affiche();
			return;
		}
		break;

	case CBien::e_type_epargne:
		{
			if (0 == GetNombreEpargne())
			{
				std::cout << "\n  Action impossible : aucun compte d'epargne !\n\n";
				return;
			}
			
			std::cout << "  Entrez le numero du compte d'epargne a afficher : ";
			int iEpargne = ReadIntBetween(0, GetNombreEpargne() - 1);
			GetEpargne(iEpargne).Affiche();
			//float iTransaction = ReadFloatBetween(0.0f, 100000.f);
			//SetEpargne(iEpargne).SetSolde(iTransaction);
			return;

			return;
		}
		break;
	}
}

