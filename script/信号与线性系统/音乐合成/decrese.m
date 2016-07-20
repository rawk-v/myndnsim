function[y]=decrese(t,size)

size=1;
t=t/size;

y1=7.5.*t.*(heaviside(t)-heaviside(t-1/5));
y2=(-15/4.*t+9/4).*(heaviside(t-1/5)-heaviside(t-1/3));
y3=heaviside(t-1/3)-heaviside(t-2/3);

y4=(-3.*t+3).*(heaviside(t-2/3)-heaviside(t-1));

y=y1+y2+y3+y4;
end
