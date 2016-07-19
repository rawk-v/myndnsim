function[hit_ratio]=cal_hit_ratio(m,interest,cs_ratio,ti,verifyp,validp)

K=numel(interest);
chunck=1;

for i=1:K
    numerator=(verifyp*validp+1-verifyp)*(1-exp(-interest(i)*ti/m));
    denominator=1+(verifyp*validp-verifyp)*(1-exp(-interest(i)*ti/m));
    hit_ratio(i)=numerator/denominator;









% for i=1:K
%     hit_ratio(i)=1-exp(-interest(i)*ti/m);
% end
end