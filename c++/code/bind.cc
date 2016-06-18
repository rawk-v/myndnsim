#include<iostream>

#include<functional>
#include<memory>
#include<random>

void print(int n1,int n2,int n3,int n4){

    std::cout<<n1<<n2<<n3<<n4<<std::endl;
}



class Foo{


    public:
        void print(int n1,int n2){

        std::cout<<"this is class";
    }

        private:
        void printPrivate(int n)
        {
            std::cout<<"this is private cout";
        }


        public: void operator()(){
               // std::endl;
            std::cout<<"this is operator";
        }
};


void print1(int a)
{
std::cout<<a<<std::endl;
}
int main(){



    using namespace std::placeholders;

    int n1=7;
    int n2=8;
    auto f1=std::bind(print,_1,_2,3,4);

    f1(n1,n2);

    Foo foo;

    auto f2=std::bind(&Foo::print,&foo,_1,_2);

    f2(34,67);


    auto lamda=[](int a)->int{return a;};
    auto f4=std::bind(lamda,_1);
    int m=f4(67);
    std::cout<<m<<std::endl;
    std::function<void(int)> func=print1;
    func(4);
    //auto f3=std::bind(&Foo::printPrivate,&foo,_1);

    //::cf3(3);
}
