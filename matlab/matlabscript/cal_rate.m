function[rate]=cal_rate(interest,hit_ratio,beta)
sum_tmp=0;
K=numel(interest);
for i=1:K    %-----合法包%
    sum_tmp=sum_tmp+interest(i)*(1-beta)*(1-hit_ratio(i))+interest(i)*beta;
end
rate=sum_tmp;
end