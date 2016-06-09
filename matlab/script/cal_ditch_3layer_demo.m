function[ditch_3layer]=cal_ditch_3layer_strategy(interest_2layer,a)
K=numel(interest_2layer(1,:));

cs_ratio=0.01;
rtt=0.008;
ttl=0.024;
Ni=60;

legal_interest_r2=interest_2layer(1,:);

illegal_interest_r2=interest_2layer(2,:);
legal_interest_r3=interest_2layer(3,:);
illegal_interest_r3=interest_2layer(4,:);




hit_ratio_r2=cal_hit_ratio(50,100,1,legal_interest_r2,cs_ratio);
hit_ratio_r3=cal_hit_ratio(50,100,1,legal_interest_r3,cs_ratio);



ditch_1st_r2=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r2,illegal_interest_r2,rtt,ttl,Ni);

ditch_1st_r3=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r3,illegal_interest_r3,rtt,ttl,Ni);



beta_r2=sum(illegal_interest_r2)/sum(illegal_interest_r2+legal_interest_r2);
beta_r3=sum(illegal_interest_r3)/sum(illegal_interest_r3+legal_interest_r3);


for rank=1:K

      legal_interest_r4(rank)=legal_interest_r2(rank)*(1-hit_ratio_r2(rank))*(1-ditch_1st_r2)*(1-beta_r2)*exp(-a*(rank-1))+legal_interest_r3(rank)*(1-hit_ratio_r3(rank))*(1-ditch_1st_r3)*(1-beta_r3)*exp(-a*(rank-1));
      legal_interest_r5(rank)=legal_interest_r2(rank)*(1-hit_ratio_r2(rank))*(1-ditch_1st_r2)*(1-(1-beta_r2)*exp(-a*(rank-1)))+legal_interest_r3(rank)*(1-hit_ratio_r3(rank))*(1-ditch_1st_r3)*(1-(1-beta_r3)*exp(-a*(rank-1)));
      
      
      illegal_interest_r4(rank)=illegal_interest_r2(rank)*(1-ditch_1st_r2)*(1-beta_r2)*exp(-a*(rank-1))+illegal_interest_r3(rank)*(1-ditch_1st_r3)*(1-beta_r3)*exp(-a*(rank-1));
      illegal_interest_r5(rank)=illegal_interest_r2(rank)*(1-ditch_1st_r2)*(1-(1-beta_r2)*exp(-a*(rank-1)))+illegal_interest_r3(rank)*(1-ditch_1st_r3)*(1-(1-beta_r3)*exp(-a*(rank-1)));
     
end


ditch_r4=cal_ditch_ratio_2_parts(legal_interest_r4,illegal_interest_r4,cs_ratio,rtt,ttl,Ni);

ditch_r5=cal_ditch_ratio_2_parts(legal_interest_r5,illegal_interest_r5,cs_ratio,rtt,ttl,Ni);



ditch_3layer=ditch_r4+ditch_r5;
















end