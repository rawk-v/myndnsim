clc;
clear;

load('yingao.mat');

music1=[d(1),d(1)];
t1=[0.75,0.74];

music2=[d(1),d(5)-12,d(3)];
t2=[1,1,1];

music3=[d(3),d(1),d(1),d(3)];
t3=[1,1,0.5,0.5];

music4=[d(5),d(5),d(4),d(3)];
t4=[1,1,0.5,0.5];

music5=[d(2),0,d(2),d(3)];
t5=[1,1,0.5,0.5];

music=[music1,music2,music3,music4,music5];
t=[t1,t2,t3,t4,t5];

fs=8000;
size=3;
y=0;
for i=1:numel(music)
    tmp=key(music(i),t(i),size,fs);
    y=[y,tmp];
end
sound(y,fs);
