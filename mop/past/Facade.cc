#include "Rectangle.h"
#include "Pignon.h"
class Facade{
public:
	Facade (rectangle r,pignon p, int n)
	: rectangleFacade(r)
	, pignonFacade(p)
	, nbOuverture(n)
	{
	
	}
	rectangle rectangleFacade;
	pignon pignonFacade;
	int nbOuverture;
};
