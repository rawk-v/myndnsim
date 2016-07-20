function[y]=y_generator(p,n,psize)

t=0:1/8000:n/psize;
tt=n/psize:-1/8000:0;
y=0;
switch p
    case 0
        f=0;
        y=0.*t;
    case 1
        f=261.63;
        fi=2*pi*f.*t;
        
        
        y=sin(fi)+0.466*sin(2*fi)+0.281*sin(3*fi);
         
        
    case 2
        f=293.66;
          fi=2*pi*f.*t;
          
         y=sin(fi)+1.044*sin(2*fi)+0.234*sin(3*fi);
        
    case 3
        f=329.63;
          fi=2*pi*f.*t;
          
        y=sin(fi)+1.25*sin(2*fi)+1.17*sin(3*fi);
    case 4
        f=349.63;
          fi=2*pi*f.*t;
        
        y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);
    case 5
        f=392;
          fi=2*pi*f.*t;
          
        y=sin(fi)+0.633*sin(2*fi)+0.255*sin(3*fi);
    case 6
        f=440;
         fi=2*pi*f.*t;
          
         y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);
    case 7
        f=493.88;
         fi=2*pi*f.*t;
         
         y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);
    case  11
        f=523.25;
          fi=2*pi*f.*t;
        y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);
    case 22
        f=587.33;
          fi=2*pi*f.*t;
          
        y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);
    case 33
        f=659.25;
          fi=2*pi*f.*t;
        y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);
    case 44
        f=698.81;
          fi=2*pi*f.*t;;
        y=sin(fi)+0.426*sin(2*fi)+0.233*sin(3*fi);

end
y=y.*exp(tt);
end
      
        
