function[Y]=cal_y(interest,beta,hit_ratio,tRtt,tTtl)

K=numel(interest);




sum_tmp=0;


%-----------------number of entries  el--------------%
for i=1:K
    sum_tmp=sum_tmp+interest(i)*(1-beta)*tRtt*(1-hit_ratio(i))+interest(i)*beta*tTtl;
end
EL=sum_tmp;


rate=cal_rate(interest,hit_ratio,beta);
%interest
%hit_ratio,beta
ES=EL/rate;
Y=1/ES;
    









end

    