//--------------------------------------------------------------------------------------------------
// Fichier     : CBien.cpp
// Description : Implémentation de la classe permettant le stockage d'un bien immobilier.
//--------------------------------------------------------------------------------------------------

#include "AgenceImmobiliere.h"

//--------------------------------------------------------------------------------------------------
/// Constructeur
/// @param surface Surface du bien.
//--------------------------------------------------------------------------------------------------
/*explicit*/ CBien::CBien(float surface)
: m_surface(surface)
{

}

//--------------------------------------------------------------------------------------------------
/// Destructeur
//--------------------------------------------------------------------------------------------------
/*virtual*/ CBien::~CBien(void)
{

}

//--------------------------------------------------------------------------------------------------
/// Initiliser la surface du bien.
/// @param surface Nouvelle surface du bien.
//--------------------------------------------------------------------------------------------------
void CBien::SetSurface(float surface)
{
	assert(surface > 0.0f);
	m_surface = surface;
}

//--------------------------------------------------------------------------------------------------
/// Retourne la surface du bien
/// @return Surface du bien.
//--------------------------------------------------------------------------------------------------
float CBien::GetSurface(void) const
{
	return(m_surface);
}
