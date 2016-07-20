function[t,x]= chongji(t1,t2,t0)
dt=0.01;
t=t1:dt:t2;
n=length(t);
x=zeros(1,n);

x(1,(t0-t1)/dt+1)=1/dt;

%stairs(t,x);
%axis([t1,t2,0,1.2/dt])
%title('单位冲激信号');
end