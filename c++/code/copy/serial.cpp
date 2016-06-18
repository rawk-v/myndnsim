

#include<iostream>
#include "serial.hpp"


int main(){



    Serial s1,s2,s3;
    Serial s4=s1;
    Serial s7=(s3);
    s7.show();
    s4.show();
    Serial s5;
    s5=s4;
    s5.show();

    return 0;

}
