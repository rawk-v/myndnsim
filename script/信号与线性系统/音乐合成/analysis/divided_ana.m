clear;
clc;
divide_script;

load('guitarana.mat');

gate=20;
for i=1:30
    eval(strcat('music=divided',num2str(i),';'));

eval(strcat('figure(',num2str(i),')',';'));
len=numel(music);
t=(0:len-1)/fs;



tmp=music;

for l=1:15
    
    music=[music,tmp];
end

music=music/16;

new_len=numel(music);


new_F=abs(fft(music));

new_F=new_F(1:new_len/2);

new_freq=(0:new_len/2-1)*fs/new_len;


max_F=max(new_F);


 subplot(2,1,1);
 plot(t,tmp);
 subplot(2,1,2);
 plot(new_freq,new_F);







for v=1:new_len/2-1
    k(v)=new_F(v)/new_freq(v);
end


index=0;

freq_fun_and_con=0;
for m=1:new_len/2-1
    tmp=new_F(m);
    if tmp>gate
        index=[index,m];
        freq_fun_and_con=[freq_fun_and_con,tmp];
    end
end
        
index(1)=[];
freq_fun_and_con(1)=[];
freq_pos=floor(index*fs/new_len)




saveas(gcf,[num2str(i),'.bmp'],'bmp');
end

% subplot(2,1,2);
% stem(freq_pos,freq_fun_and_con,'filled');






        
%         
% k_max_index=find(max(k)==k);
% fundamental_freq=(k_max_index-1)*fs/new_len
% 
% index=find(new_F==max(new_F));
% fundamental_freq=(index-1)*fs/new_len

