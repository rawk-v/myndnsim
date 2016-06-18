#ifndef TEMPLATE_HPP
#define TEMPLATE_HPP


#include<iostream>

template<typename T,int n>
  class Stack
{
     private:
         enum {size=50};

         T array[n];
         int top;

         public:
         Stack();
          T pop();
          void push(T element);
          virtual T&operator[](int i);
          virtual T operator[] const (int i);
};





template<typename T,int n>
Stack<T,n>::Stack():top(0)
{
    ;
}

template<typename T,int n>
void Stack<T,n>::push(T element)
{    if(top>=n)
    {
        std::cout<<"full"<<std::endl;
        return;
    }
    else
    array[top++]=element;
}
template<typename T,int n>
 T &Stack<T,n>::operator(int i)
{

    return array[i];

}

template<typename T,int n>
T Stack<T,n>::operator(int i)
{
     return array[i];
}

template<typename T,int n>
T Stack<T,n>::pop()
{
     if(top<=0)
     {
         std::cout<<"empty!"<<std::endl;
         return 0;
     }
     else
         return array[top--];
}
#endif,int n
