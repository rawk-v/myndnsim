


#ifndef FRIEND_HPP
#define FRIEND_HPP

#include<iostream>
class Tv;
class Remote
{
    public: void add(Tv& tv);

//
   Remote()=default;
    Remote(int m);

    Remote(const Remote& re){
      std::cout<<"this is remote copy";
    }

    ~Remote()
    {
    std::cout<<__FUNCTION__<<std::endl;
    }
};




class Tv{

  //class Remote;

    private:
        int nChannels;
        int currentChannel;

     Remote *remote;
    public:
        //friend class Remote;
        explicit Tv(int nchannel):nChannels(nchannel),currentChannel(0)
        {
           remote=new Remote();
        }
      ~Tv(){
         delete remote;
      }
     friend class Remote;

      Remote* getRemote()
      {
       return remote;
      }
        int getChannels()
        {
            return this->nChannels;


}
         void showCurrentChannel()
{
    std::cout<<this->currentChannel;
}
    public :
    Tv(const Tv& tv):nChannels(tv.nChannels),currentChannel(tv.currentChannel){
        std::cout<<__FUNCTION__<<std::endl;
        std::cout<<"this copy "<<std::endl;

        remote=new Remote(*(tv.remote));
    }


Tv& operator=(const Tv &tv){

   nChannels=tv.nChannels;
   currentChannel=tv.currentChannel;

    std::cout<<__FUNCTION__<<std::endl;
    return *this;

}
};


void Remote::
 add(Tv& tv){
    tv.currentChannel++;
}
Remote::Remote(int m){
    std::cout<<"this is remote constructor"<<std::endl;
}

#endif



