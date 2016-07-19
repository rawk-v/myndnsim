
function[differ]=cal_differ(right_hand,K,m,interest,ti,verifyp,validp)

% 计算误差
% veryfiyp=1;
% validplidp=1;

sigma_tmp=0;
for i=1:K
    f=1-exp(-interest(i)*ti/m);
    p=(verifyp*validp+1-verifyp)*f/(1+(verifyp*validp-verifyp)*f);
    sigma_tmp=sigma_tmp+p;
end
    


% for i=1:K
%     sigma_tmp=sigma_tmp+(1-exp(-interest(i)*ti/m));
% end





differ=right_hand-sigma_tmp;
end









