function[expected_value]=cal_ditch_2nd(legal_interest,illegal_interest)
K=numel(legal_interest);
illegal_ratio=sum(illegal_interest)/sum(legal_interest+illegal_interest);

[ditch1,tmp]=cal_ditch(K,100,0.01,1,1.2,legal_interest,illegal_interest,0.008,0.024,60);
legal_interest_ratio=legal_interest/sum(legal_interest);

for rank=1:K
    ditch_2nd(rank)=illegal_ratio*(1-ditch1);
end

expected_value=sum(ditch_2nd.*legal_interest_ratio);















end