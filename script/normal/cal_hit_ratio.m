function[hit_ratio]=cal_hit_ratio(m,interest,cs_ratio,ti)
K=numel(interest);
chunck=1;
for i=1:K
    hit_ratio(i)=1-exp(-interest(i)*ti/m);
end
end
