//--------------------------------------------------------------------------------------------------
// Fichier     : CBienLot.h
// Description : Définition de la classe permettant le stockage d'un lot (i.e. un appartement ou
//               une maison faisant partie d'une copropriété.
//--------------------------------------------------------------------------------------------------

#ifndef __CBIENLOT_H
#define __CBIENLOT_H

#include "CBien.h"

//
/// Classe permettant le stockage d'un lot.
class CBienLot : public CBien
{
public:

	//
	/// Status
	enum EStatut
	{
		e_statut_en_vente,			///< En vente.
		e_statut_a_louer,			///< A louer.
		e_statut_loue				///< Loué.
	};

	//
	// Construction / Destruction
	explicit		CBienLot			(float solde, float taux);
	virtual			~CBienLot			(void);

	//
	// Accesseurs
	void			SetTaux				(float taux);
	void			SetSolde			(float solde);
	float			GetTaux				(void) const;
	void			SetNombreDePieces	(int nombreDePieces);
	int				GetNombreDePieces	(void) const;

	//
	// Affichage
	virtual void	Affiche				(void) const;

protected:

private:

	float			m_solde,m_taux;			///< Statut du bien (@see CBienLot::EStatut).
	int				m_nombreDePieces;	///< Nombre de pièces du bien.
	
};

#endif // __CBIENLOT_H
