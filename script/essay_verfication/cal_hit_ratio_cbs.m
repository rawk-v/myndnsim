function[hit_ratio]=cal_hit_ratio_cbs(m,interest,ti,verifyp,validp)
K=numel(interest);
chunck=1;
for i=1:K
    f=1-exp(-interest(i)*ti/m);
    numerator=verifyp*validp*f;
    denominator=1+verifyp*validp*f-f;
    hit_ratio(i)=numerator/denominator;


end
