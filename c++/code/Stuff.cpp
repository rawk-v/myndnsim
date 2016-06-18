#include "Stuff.hpp"
#include <iostream>
namespace myspace{
    using namespace std;
    Stuff::Stuff(int id,double salary,const string& name):m_name(name),m_salary(salary),m_id(id){

        }

    double Stuff::getSalary() const{
        return this->m_salary;
    }
    void Stuff::setSalary(double salary){
        this->m_salary=salary;
    }
    int Stuff::getId() const{return this->m_id;}
    void Stuff::Show() const
    {
        std::cout<<std::endl<<"this is stuff "+m_id<<std::endl;
        std::cout<<m_id<<std::endl;
    }
    Stuff::~Stuff(){}
}
