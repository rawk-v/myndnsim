

#ifndef SERIAL_HPP
#define SERIAL_HPP


#include<iostream>

class Serial{

    private:
        int m_sn;
    public:
        static int current;
        Serial():m_sn(current++){}
   //     Serial(const Serial& s):m_sn(current++){}
        Serial& operator=(const Serial& s){
            return *this;
        }

   //     Serial(const Serial& s)=default;
        void show(){
            std::cout<<m_sn<<std::endl;
        }
};


int Serial::current=1;
#endif
