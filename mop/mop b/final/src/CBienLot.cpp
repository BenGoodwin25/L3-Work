//--------------------------------------------------------------------------------------------------
// Fichier     : CBienLot.cpp
// Description : Implémentation de la classe permettant le stockage d'un lot (i.e. un appartement ou
//               une maison faisant partie d'une copropriété.
//--------------------------------------------------------------------------------------------------

#include "AgenceImmobiliere.h"

//--------------------------------------------------------------------------------------------------
/// Constructeur.
/// @param surface Surface du bien.
/// @param eStatut Statut courant.
//--------------------------------------------------------------------------------------------------
/*explicit*/ CBienLot::CBienLot(float solde, float taux)
: CBien(solde)
, m_taux(taux)
{

}

//--------------------------------------------------------------------------------------------------
/// Destructeur
//--------------------------------------------------------------------------------------------------
/*virtual*/ CBienLot::~CBienLot(void)
{

}

//--------------------------------------------------------------------------------------------------
/// Initialiser le statut du bien.
/// @param eStatut Nouveau statut du bien.
//--------------------------------------------------------------------------------------------------
void CBienLot::SetTaux(float taux)
{
	m_taux = taux;
}


//--------------------------------------------------------------------------------------------------
/// Initialiser le statut du bien.
/// @param eStatut Nouveau statut du bien.
//--------------------------------------------------------------------------------------------------
void CBienLot::SetSolde(float solde)
{
	m_solde = m_solde+solde;
}


//--------------------------------------------------------------------------------------------------
/// Retourne le statut du bien (@see CBienLot::EStatut).
/// @return Statut du bien.
//--------------------------------------------------------------------------------------------------
float CBienLot::GetTaux(void) const
{
	return(m_taux);
}



//--------------------------------------------------------------------------------------------------
/// Affiche le bien sur la ligne de commande.
//--------------------------------------------------------------------------------------------------
/*virtual*/ void CBienLot::Affiche(void) const
{
	std::cout << "  Solde : " << GetSolde() << "\n";
	std::cout << "  Taux : " << GetTaux() << "\n";
	std::cout << "\n";
}

