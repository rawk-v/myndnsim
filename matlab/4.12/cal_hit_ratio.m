function[hit_ratio]=cal_hit_ratio(K,m,chunck,lamda,cs_ratio)









ti=cal_ti(K,m,chunck,lamda,cs_ratio);
for i=1:K
    hit_ratio(i)=1-exp(-lamda(i)*ti/m);
end
end