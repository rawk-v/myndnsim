function[hit_ratio_real]=cal_hit_ratio_real(hit_ratio)
[layer,K]=size(hit_ratio);

tmp=0;

rank=1;
hit=hit_ratio(:,1);
tmp=hit';
for i=2:layer
    tmp(i)=(1-sum(tmp(1:i-1)))*tmp(i);
end
hit_ratio_real=tmp';










for rank=2:K
    hit=hit_ratio(:,rank);
    tmp=hit';
    for i=2:layer
        tmp(i)=(1-sum(tmp(1:i-1)))*tmp(i);
    end
    hit_ratio_real=[hit_ratio_real,tmp'];
end
    






end
