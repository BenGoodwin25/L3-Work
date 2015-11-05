#include <vector>
#include <string>

class CClient{
		public:
	std::string firstname,name,address,telNumber;
	CClient(std::string firstname,std::string name,std::string address, std::string telNumber);
};

void initClient();
