class rectangle{
public:
	rectangle (int l,int h)
	: largeur(l)
	, hauteur(h)
	{

	}
	int largeur,hauteur;

	int Square (int largeur,int hauteur) 
	{
		return (largeur*hauteur);
	}
};
