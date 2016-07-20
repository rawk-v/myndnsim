function[differ]=cal_differ_cbs(right_hand,m,interest,ti,verifyp,validp)
K=numel(interest);
sigma_tmp=0;
% for i=1:K
%     sigma_tmp=sigma_tmp+(1-exp(-interest(i)*ti/m));
% end


for i=1:K
    f=1-exp(-interest(i)*ti/m);
    numerator=verifyp*validp*f;
    denominator=1+verifyp*validp*f-f;
    sigma_tmp=sigma_tmp+numerator/denominator;
    



end

differ=right_hand-sigma_tmp;
end