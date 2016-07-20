clc;
clear;
load('Guitarexe.MAT');
[f,fs]=audioread('Guitarexe.wav');
% fs=8000;
% 
%  f=(realwave');
 tmp=f';
 f=f';
 nsamps=numel(f);
%  for i=1:31
%      f=[f,tmp];
%  end
% %  
% nsamps=numel(f);

% fs=8000;
% f=rearray(f);

% for i=1:10
%     f=[f,tmp];
% end




F_com=fft(f);

t=(1/fs)*(1:nsamps);
F=abs(fft(f));

 F=F(1:nsamps/2);

freq=fs*(0:nsamps/2-1)/nsamps;

% subplot(2,1,1);
% plot(t,f);
% subplot(2,1,2);


