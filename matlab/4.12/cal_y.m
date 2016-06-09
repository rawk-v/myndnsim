function[Y]=cal_y(interest,illegal_interest,hit_ratio,tRtt,tTtl)

K=numel(interest);




sum_tmp=0;


%-----------------number of entries  el--------------%
for i=1:K
    sum_tmp=sum_tmp+interest(i)*tRtt*(1-hit_ratio(i))+illegal_interest(i)*tTtl;
end
EL=sum_tmp;


rate=cal_rate(interest,illegal_interest,hit_ratio);
%interest
%hit_ratio,beta
ES=EL/rate;
Y=1/ES;
    









end

    