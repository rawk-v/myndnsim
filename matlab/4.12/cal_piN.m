function[ditch_p]=cal_piN(rate,y,Ni)
%----------------pi0-----------------%


sum_tmp=0;
for i=0:Ni
    sum_tmp=sum_tmp+((rate/y)^i)/factorial(i);
end
pi0=1/sum_tmp;



%-----------pin----------------%

for i=1:Ni
    piN(i)=pi0*((rate/y)^i)/factorial(i);
end
ditch_p=piN(Ni);
end
    

