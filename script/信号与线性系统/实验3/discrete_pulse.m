function[k,y]=discrete_pulse(k1,k2,k0)

k=k1:k2;
n=length(k);
y=zeros(1,n);
y(1,-k0-k1+1)=1;
end