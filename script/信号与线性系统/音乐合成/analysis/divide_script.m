
clc;
clear;
analysis_gui

gap=100;
dif_min=0.06;
length_min=19;
len=numel(f);
lenN=ceil(len/gap);



FMT=f';

FMT_temp1=[FMT;zeros(gap*lenN-len,1)];

FMT_temp2=reshape(FMT_temp1,gap,lenN);
FMT_max=(max(FMT_temp2))';

positionN=zeros(size(FMT_max));

id=1;
n=1;

positionN(1)=1;

while id<lenN
    increase=0;
    while id<lenN&&FMT_max(id)<FMT_max(id+1)
        increase=increase+1;
        id=id+1;
    end
 
    if(FMT_max(id)-FMT_max(id-increase)>dif_min&&id-positionN(n)>=length_min)
        n=n+1;
        positionN(n)=id;
    end
    id=id+1;
end

position=zeros(n+1,1);
position(1:n)=(positionN(1:n)-1)*gap+1;
position(n+1)=len;
cut=0*FMT;
cut(position)=1;


for i=1:numel(position)-1
    eval(strcat('divided',num2str(i),'=f(position(',num2str(i),'):position(',num2str(i),'+1));'));
    
end


save('guitarana.mat');



