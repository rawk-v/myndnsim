#include<iostream>
#include "specialization.hpp"
#include<string>
int main()
{  std::string name=std::string("nick");
    myspace::Pair<double,int> demo=myspace::Pair<double,int>(50.0,50);
   demo.show();
   countTemp(demo);
}
