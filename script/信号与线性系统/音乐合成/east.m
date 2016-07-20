clc;
clear;
load('yingao.mat');

yinyue=[f(5),f(5),f(6),f(2),f(1),f(1),f(6)-12,f(2)];

paishu=[1,0.5,0.5,2,1,0.5,1,0.5,2];

fs=8000;
size=1;
y=0;
for i=1:numel(yinyue)
    tmp=key(yinyue(i),paishu(i),3,fs);
   
    y=[y,tmp];
end


sound(y,fs);
audiowrite('happynewyear.flac',y,fs);


