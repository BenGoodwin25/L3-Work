//--------------------------------------------------------------------------------------------------
// Fichier     : CAgence.h
// Description : D�finition de la classe permettant le stockage d'une agence immobili�re.
//--------------------------------------------------------------------------------------------------

#ifndef __CAGENCE_H
#define __CAGENCE_H

#include <string>
#include <vector>

#include "CClient.h"
#include "CBienCourant.h"
#include "CBienEpargne.h"

#define FLT_MAX 256.0f

//
/// Classe permettant le stockage d'une agence immobili�re.
class CAgence
{
public:

	//
	// Construction / Destruction
	explicit							CAgence						(void);
	virtual								~CAgence					(void);

	//
	// Methodes expos�es � l'utilisateur
	void								AjoutClient					(void);
	void								AjoutBien					(void);
	void								SuppressionClient			(void);
	void								SuppressionBien				(void);
	void								AfficheNombreTotalDeClients	(void);
	void								AfficheNombreTotalDeBiens	(void);
	void								AfficheListeClients			(void);
	void								AfficheListeBiens			(void);
	void								AfficheBien					(void);
	void 								SetSolde					(void);

protected:

	//
	// Methodes internes liees aux clients
	void								AjoutClient				(const CClient & client);
	void								SupprimeClient			(int iClient);
	int									GetNombreClients		(void) const;
	const CClient &						GetClient				(int nClient) const;

	//
	// Methodes internes liees aux appartements
	void								AjoutCourant		(const CBienCourant & courant);
	void								SupprimeCourant		(int iCourant);
	int									GetNombreCourant	(void) const;
	const CBienCourant &				GetCourant			(int nCourant) const;
	
	//
	// Methodes internes liees aux maisons
	void								AjoutEpargne			(const CBienEpargne & epargne);
	void								SupprimeEpargne			(int iEpargne);
	int									GetNombreEpargne		(void) const;
	const CBienEpargne &				GetEpargne				(int nEpargne) const;
private:

	std::vector<CClient>				m_aClient;				///< Tableau destin� � accueillir les clients.

	std::vector<CBienCourant>			m_aBienCourant;		///< Tableau destin� � accueillir les appartements.
	std::vector<CBienEpargne>			m_aBienEpargne;			///< Tableau destin� � accueillir les maison.
	
};

#endif // __CAGENCE_H

