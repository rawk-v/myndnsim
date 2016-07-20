function[k,y]=discrete_conv(f1,f2,k1,k2)

y=conv(f1,f2);

k0=k1(1)+k2(1);
k3=length(k1)+length(k2)-2;
k=k0:k0+k3;

subplot(2,2,1);
stem(k1,f1);
subplot(2,2,2);
stem(k2,f2);

subplot(2,2,3);
stem(k,y);

h=get(gca,'position');
h(3)=2.5*h(3);
set(gca,'position',h);

end