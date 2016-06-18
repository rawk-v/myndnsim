#include<iostream>
#include "Stuff.hpp"
int main()
{
    using namespace myspace;
     std::string name="nick";
     Stuff* s1=new Stuff(5,40.0,name);
    s1->Show();
    delete s1;
    return 0;
}
