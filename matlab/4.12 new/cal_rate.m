function[rate]=cal_rate(interest,illegal_interest,hit_ratio)
sum_tmp=0;
K=numel(interest);
for i=1:K    %-----合法包%
    sum_tmp=sum_tmp+interest(i)*(1-hit_ratio(i))+illegal_interest(i);
end
rate=sum_tmp;
end