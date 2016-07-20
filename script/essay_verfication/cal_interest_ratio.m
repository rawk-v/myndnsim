function[interest_ratio]=cal_interest_ratio(K,alpha)
sum_tmp=0;
for i=1:K
    sum_tmp=sum_tmp+1/i^alpha;
end
for i=1:K
    interest_ratio(i)=(1/i^alpha)/sum_tmp;
    
   
end
end