function[k,f]=discrete_mul(f1,f2,k1,k2)
k=min(min(k1),min(k2)):max(max(k1),max(k2));
s1=zeros(1,length(k));s2=s1;
s1(find((k>=min(k1))&(k<=max(k1))==1))=f1;
s2(find((k>=min(k2))&(k<=max(k2))==1))=f2; 
f=s1.*s2;
stem(k,f,'filled');
axis([(min(min(k1),min(k2))-1),(max(max(k1),max(k2))+1),(min(f)-0.5),(max(f)+0.5)]) ;
end