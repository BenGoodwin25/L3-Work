//--------------------------------------------------------------------------------------------------
// Fichier     : CBienLotMaison.h
// Description : Définition de la classe permettant le stockage d'une maison.
//--------------------------------------------------------------------------------------------------

#ifndef __CBIENLOTMAISON_H
#define __CBIENLOTMAISON_H

#include "CBienLot.h"

//
/// Classe permettant le stockage d'une maison.
class CBienEpargne : public CBienLot
{
public:

	//
	// Construction / Destruction
	explicit		CBienEpargne	(float solde, float taux);
	virtual			~CBienEpargne	(void);

	//
	// Accesseurs
	virtual EType	GetType			(void) const;

protected:

private:

};

#endif // __CBIENLOTMAISON_H
