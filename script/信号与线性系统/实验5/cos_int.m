function[y]=cos_int(w,a,b)
syms t;
x=time_fun_x(t);
y=int(x*cos(w*t),t,a,b);
end