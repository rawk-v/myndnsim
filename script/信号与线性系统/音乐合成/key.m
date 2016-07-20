function[f4]=key(p,n,size,fs)
t=0:1/fs:n/size;

tt=n/size:-1/fs:0;
f1=(sin(2*pi*freq(p)*t)).*decrese(t,n/size);

f2=0.2*sin(2*pi*2*freq(p)*t);

f3=0.1*sin(2*pi*3*freq(p)*t);


f4=f3+f2+f1;


plot(f4);
end