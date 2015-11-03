//--------------------------------------------------------------------------------------------------
// Fichier     : CBienLotAppartement.cpp
// Description : Implémentation de la classe permettant le stockage d'un appartement.
//--------------------------------------------------------------------------------------------------

#include "AgenceImmobiliere.h"

//--------------------------------------------------------------------------------------------------
/// Constructeur.
/// @param surface Surface du bien.
/// @param eStatut Statut courant.
//--------------------------------------------------------------------------------------------------
/*explicit*/ CBienCourant::CBienCourant(float solde)
: CBienLot(solde, 0.0f)
{

}

//--------------------------------------------------------------------------------------------------
/// Destructeur
//--------------------------------------------------------------------------------------------------
/*virtual*/ CBienCourant::~CBienCourant(void)
{

}

//--------------------------------------------------------------------------------------------------
/// Retourne le type du bien (@see CBien::EType)
/// @return Type du bien.
//--------------------------------------------------------------------------------------------------
/*virtual*/ CBien::EType CBienCourant::GetType(void) const
{
	return(e_type_courant);
}

