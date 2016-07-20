clc;
clear;

y(1)=1;
y(2)=1;
for i=1:100
    y(i+2)=y(i)+y(i+1);
    if y(i+2)>10000
        result=y(i+2);
        break;
    end
end
