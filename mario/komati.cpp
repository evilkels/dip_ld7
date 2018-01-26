#include <fstream>

// Palaižot programmu jānorāda kuru failu pārveidot- ./komati Mario.txt
// Tiks izveidots fails Mario.coe

int main (int argc,char *argv[]){ 
    std::string s = argv[1];
    std::string token = s.substr(0, s.find("."));

    std::ifstream infile(argv[1]);
    std::ifstream inftmp(argv[1]);
    token+=".coe";
    std::ofstream outfile(token.c_str());

    outfile << "memory_initialization_radix=10;" <<std::endl;
    outfile << "memory_initialization_vector=" <<std::endl;

    std::string linetmp;
    getline( inftmp, linetmp );

    for(std::string line; getline( infile, line ); )
    {
        if(getline( inftmp, linetmp ))
        {
            line+=",";
        }
        else
        {
            line+=";";
        }
        outfile << line <<std::endl;
    }
    outfile.close();

    return 0;
}
