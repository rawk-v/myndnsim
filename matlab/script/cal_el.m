function[EL]=cal_el(interest,illegal_interest,hit_ratio,tRtt,tTtl)
K=numel(interest);


sum_tmp=0;
for i=1:K
    sum_tmp=sum_tmp+interest(i)*tRtt*(1-hit_ratio(i))+illegal_interest(i)*tTtl;
end
EL=sum_tmp;
end
   