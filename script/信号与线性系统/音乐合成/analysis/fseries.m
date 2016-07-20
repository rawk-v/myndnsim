

function [an,bn,f]=fseries(fx,x,n,a,b)
%傅里叶级数展开
%
%an为fourier余弦项系数
%bn为fourier正弦项系数
%f为展开表达式
%f为给定函数
%x为自变量
%n为展开系数
%a,b为x的区间,默认为[-pi,pi]
%
% by dynamic of Matlab技术论坛
% see also http://www.matlabsky.com
% contact me matlabsky@gmail.com
% 2009-08-27 10:37:25
 
if nargin==3
    a=-pi;
    b=pi;
end
l=(b-a)/2;
if a+b
    fx=subs(fx,x,x+l+a);
end
an=int(fx,x,-l,l)/l;
bn=[];
f=an/2;
for ii=1:n
     ann=int(fx*cos(ii*pi*x/l),x,-l,l)/l;
    bnn=int(fx*sin(ii*pi*x/l),x,-l,l)/l;
    an=[an,ann];
    bn=[bn,bnn];
    f=f+ann*cos(ii*pi*x/l)+bnn*sin(ii*pi*x/l);
end
if a+b
    f=subs(f,x,x-l-a);
end
end
    