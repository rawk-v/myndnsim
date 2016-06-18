



#include<iostream>
#include"friend.hpp"


Tv copyTest(Tv tv){
  return tv;
}

int main()
{



    Tv* tv=new Tv(50);


    Tv tv2=*tv;
    Tv tv3(55);
    tv3=tv2;
//
//    Remote remote;
//    remote.add(*tv);
//    tv->showCurrentChannel();
//    //调用
//    Tv tvFrom=copyTest(*tv);
//    Tv tvCopy(*tv);
//
//    Tv tv2(13);
//  //:  tvFromCopyTest.showCurrentChannel();
    std::cout<<"delete tv"<<std::endl;
    delete tv;
    return 0;
}
