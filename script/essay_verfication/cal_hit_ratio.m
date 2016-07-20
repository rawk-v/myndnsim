function[hit_ratio]=cal_hit_ratio(m,interest,ti,verifyp,validp)

K=numel(interest);
chunck=1;

for i=1:K
    f=1-exp(-interest(i)*ti/m);
    
    numerator=(verifyp*validp+1-verifyp)*f;
    denominator=1+(verifyp*validp-verifyp)*f;
    hit_ratio(i)=numerator/denominator;









% for i=1:K
%     hit_ratio(i)=1-exp(-interest(i)*ti/m);
% end
end