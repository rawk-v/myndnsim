function[k,y]=discrete_step(k1,k2,k0)
k_1=k1:k0-1;
k_2=k0:k2;
n=length(k_1);
nn=length(k_2);
u=zeros(1,n);   
uu=ones(1,nn); 
y=[u,uu];
k=[k_1,k_2];
end
