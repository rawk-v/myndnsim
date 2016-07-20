function[y1]=rearray(y)


y=resample(y,250,243);
%生成 10*25 矩阵
tmp=reshape(y,25,10); 
size(tmp)
%求10 个周期对应值的平均
for i=1:25
     mean_(i)=mean(tmp(i,:));
end
tmp_=mean_;
for i=1:9
    tmp_=[tmp_,mean_];
end
y1=resample(tmp_,243,250);





end