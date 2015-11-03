//--------------------------------------------------------------------------------------------------
// Fichier     : CBien.h
// Description : Définition de la classe permettant le stockage d'un bien immobilier.
//--------------------------------------------------------------------------------------------------

#ifndef __CBIEN_H
#define __CBIEN_H

#include <string>

//
/// Classe permettant le stockage d'un bien immobilier.
class CBien
{
public:

	//
	/// Type de bien.
	enum EType
	{
		e_type_courant,		///< Appartement.
		e_type_epargne,		///< Maison.
	};

	//
	// Construction / Destruction
	explicit		CBien		(float solde);
	virtual			~CBien		(void);

	//
	// Accesseurs
	virtual EType	GetType		(void) const = 0;
	void			SetSolde	(float solde);
	float			GetSolde	(void) const;

	//
	// Affichage
	virtual void	Affiche		(void) const = 0;

protected:

private:

	float			m_solde;	///< Surface du bien.

};

#endif // __CBIEN_H
