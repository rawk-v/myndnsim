function [A_sym,B_sym]=CTFS

syms t  n   k  x;
T=5;tao=0.2*T;a=0.5;
if nargin<4;
    Nf=6;
end
if nargin<5;
    Nn=32;
end
%t=-8*a:0.01:T-a;
x=time_fun_x(t);
A0=2*int(x,t,-a,T-a)/T;

As=int(2*x*cos(2*pi*n*t/T)/T,t,-a,T-a);  
Bs=int(2*x*sin(2*pi*n*t/T)/T,t,-a,T-a); 
A_sym(1)=vpa(A0,Nn); 
for k=1:Nf
    %A_sym(k+1)=int(2*x*cos(2*pi*k*t/T)/T,t,-a,T-a);
   %co_cos(k+1)=cos_int(2*pi*k/T,-a,T-a)
   
   A_sym(k+1)=vpa(subs(As,n,k),Nn); %获取串数组A所对应的ASC2码数值数组
   B_sym(k+1)=vpa(subs(Bs,n,k),Nn); 
   %B_sym(k+1)=int(2*x*sin(2*pi*k*t/T)/T,t,-a,T-a); 
end%获取串数组B所对应的ASC2码数值数组'






%输出d为三角级数展开系数:  第2,3,4,...元素依次是1,2,3...次谐波sin项展开系数    

t=-8*a:0.01:T-a;
if nargout==0
c=A_sym;
disp(c);   %输出c为三角级数展开系数:第1元素是直流项，其后元素依次是1,2,3...次谐波cos项展开系数
d=B_sym;
disp(d) ;
end


f1=0.4/2+0.3742.*cos(2*pi*1*t/5)+0.*sin(2*pi*1*t/5);          % 基波
f2=0.3027.*cos(2*pi*2*t/5)+0.*sin(2*pi*2*t/5);                % 2次谐波
f3=0.2018.*cos(2*pi*3*t/5)+0.*sin(2*pi*3*t/5);                % 3次谐波
f4=0.0935.*cos(2*pi*4*t/5)+0.*sin(2*pi*4*t/5); 
% 4次谐波
f5=-0.0624.*cos(2*pi*6*t/5)+0.*sin(2*pi*6*t/5);                % 6次谐波
f6=f1+f2;          % 基波+2次谐波
f7=f6+f3;          % 基波+2次谐波+3次谐波
f8=f7+f4+f5; 
% 基波+2次谐波+3次谐波+4次谐波+6次谐波
subplot(2,2,1)
plot(t,f1),hold on
y=time_fun_e(t) ;         %调用连续时间函数-周期矩形脉冲
plot(t,y,'r:');
title('周期矩形波的形成—基波')
axis([-4,4.5,-0.5,1.3])
subplot(2,2,2);
plot(t,f6),hold on
y=time_fun_e(t);
plot(t,y,'r:');
title('周期矩形波的形成—基波+2次谐波')
axis([-4,4.5,-0.5,1.3]);
subplot(2,2,3);
plot(t,f7),hold on;
y=time_fun_e(t);
plot(t,y,'r:');
title('基波+2次谐波+3次谐波');
axis([-4,4.5,-0.5,1.3]);
subplot(2,2,4);
plot(t,f8),hold on;
y=time_fun_e(t);
plot(t,y,'r:');
title('基波+2次谐波+3次谐波+4次谐波+6次谐波')
axis([-4,4.5,-0.5,1.3]);
end





