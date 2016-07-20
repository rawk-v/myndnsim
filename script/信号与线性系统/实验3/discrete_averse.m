function[k,f]=discrete_averse(f1,k1)
f=fliplr(f1);k=-fliplr(k1);
stem(k,f,'filled')
axis([min(k)-1,max(k)+1,min(f)-0.5,max(f)+0.5]);
end
