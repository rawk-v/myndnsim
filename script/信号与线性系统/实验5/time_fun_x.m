function[x]=time_fun_x(t)

h=1;  
x1=sym('Heaviside(t+0.5)')*h;
x=x1-sym('Heaviside(t-0.5)')*h;
end


