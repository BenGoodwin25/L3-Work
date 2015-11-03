//--------------------------------------------------------------------------------------------------
// Fichier     : CBienEpargne.cpp
// Description : Implémentation de la classe permettant le stockage d'une maison.
//--------------------------------------------------------------------------------------------------

#include "AgenceImmobiliere.h"

//--------------------------------------------------------------------------------------------------
/// Constructeur.
/// @param surface Surface du bien.
/// @param eStatut Statut courant.
//--------------------------------------------------------------------------------------------------
/*explicit*/ CBienEpargne::CBienEpargne(float solde, float taux)
: CBienLot(solde, taux)
{

}

//--------------------------------------------------------------------------------------------------
/// Destructeur
//--------------------------------------------------------------------------------------------------
/*virtual*/ CBienEpargne::~CBienEpargne(void)
{

}

//--------------------------------------------------------------------------------------------------
/// Retourne le type du bien (@see CBien::EType)
/// @return Type du bien.
//--------------------------------------------------------------------------------------------------
/*virtual*/ CBien::EType CBienEpargne::GetType(void) const
{
	return(e_type_epargne);
}

