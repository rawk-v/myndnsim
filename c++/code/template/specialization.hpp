#include<iostream>

using std::string;
using std::cout;

namespace myspace{
    template<typename T1,typename T2>
        class Pair{
            private:
                T1 first;
                T2 second;
            public:
                T1& getFirst(){return first;}
                T2& getSecond(){return second;}
              void show(){cout<<first<<std::endl;cout<<second<<std::endl;}
        };
    template<typename T>
        void countTemp(T& t);
    template<typename T1>
        class Pair<T1,int>{
            private:
                T1 first;
                int second;
            public:
                Pair(T1 t,int m):first(t),second(m){  }
                T1& getFirst(){return first;}
                int getSecond(){return second;}
                void show(){cout<<first<<"this is particial specalizaton"<<std::endl;}
                friend void count(Pair<double,int>& p);
                friend void countTemp<>(Pair<T1,int>& p);
};


    template<typename T>
    void countTemp(T &t)
{
    cout<<"this is temp"<<t.first<<std::endl;
}
void count(Pair<double,int>& p)
{
    cout<<p.first<<p.second<<std::endl;
}
}
