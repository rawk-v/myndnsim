
function[differ]=cal_differ(right_hand,K,m,lamda,ti)
sigma_tmp=0;
for i=1:K
    sigma_tmp=sigma_tmp+(1-exp(-lamda(i)*ti/m));
end
differ=right_hand-sigma_tmp;
end









