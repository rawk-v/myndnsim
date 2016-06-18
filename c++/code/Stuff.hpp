#ifndef STUFF_HPP
#define STUFF_HPP

#include <iostream>

namespace myspace{
    class Stuff
    {
    private:
            std::string m_name;
            double m_salary;
            int m_id;
        public:
            Stuff(int id,double salary,const std::string& name);
           double  getSalary() const;
           void setSalary(double salary);
           int getId()  const;
           virtual void Show() const;
           virtual ~Stuff();

    };
}
#endif
