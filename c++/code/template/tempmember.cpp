#include<iostream>
#include<string>
using namespace std;
template <typename T>
class beta{
    private:
        template<typename V>
            class hold{
                private:
                    V val;
                public:
                    hold(V v):val(v){  }
                    V& getValue() {return val;}
                    void show() const {std::cout<<val<<std::endl;}
                   // ostream& operator<<(ostream& os,hold<V>& h){ os<<h.val<<std::endl; }
            };

        hold<int> m_hint;
        hold<double> m_hdou;
        hold<T> m_hsr;

    public:
        beta(T t,int m_int,double m_double):m_hint(m_int),m_hdou(m_double),m_hsr(t){  }
        //void show(){std::cout<<m_hint<<m_hsr<<m_hdou<<std::endl;}
        void show(){m_hint.show();m_hdou.show();m_hsr.show();}
};


int main()
{   string name="hello";
    beta<std::string>  demo(name,50,60.0);
    demo.show();
}
