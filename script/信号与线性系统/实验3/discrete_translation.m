function[k,f]=discrete_translation(ff,kk,k0)

k=kk+k0;f=ff;
stem(k,f,'filled');
axis([min(k)-1,max(k)+1,min(f)-0.5,max(f)+0.5]);
end