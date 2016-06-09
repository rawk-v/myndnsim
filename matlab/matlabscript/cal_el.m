function[EL]=cal_el(interest,beta,hit_ratio,tRtt,tTtl)
K=numel(interest);


sum_tmp=0;
for i=1:K
    sum_tmp=sum_tmp+interest(i)*(1-beta)*tRtt*(1-hit_ratio(i))+interest(i)*beta*tTtl;
end
EL=sum_tmp;
end
   