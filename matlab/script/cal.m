function[ditch_3layer]=cal_ditch_3layer_strategy_2(interest_info,a)
1
legal_interest_r2=interest_info(1,:);
2
illegal_interest_r2=interest_info(2,:);
legal_interest_r3=interest_info(3,:);
illegal_interest_r3=interest_info(4,:);


interest_ratio_r2=(legal_interest_r2+illegal_interest_r2)/sum(legal_interest_r2+illegal_interest_r2);

K=numel(legal_interest_r2);

m=100;
cs_ratio=0.01;chunck=1;alpha=1.2;

rtt=0.008;
ttl=0.024;
Ni=60;

ditch_1st_r2=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r2,illegal_interest_r2,rtt,ttl,Ni);
ditch_1st_r3=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r3,illegal_interest_r3,rtt,ttl,Ni);


beta_r2=sum(illegal_interest_r2)/sum(illegal_interest_r2+legal_interest_r2);
5
hit_ratio_r2=cal_hit_ratio(K,100,1,legal_interest_r2,0.01);

% 
%    
%   legal_interest_r2(rank)=(1-ditch1layer)*legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-betaf1)*exp(-a*(rank-1))+(1-ditch1layer)*legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-betaf2)*exp(-a*(rank-1));
%    
%   legal_interest_r3(rank)=(1-ditch1layer)*legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-(1-betaf1)*exp(-a*(rank-1)))+(1-ditch1layer)*legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-(1-betaf2)*exp(-a*(rank-1)));
%   
%   illegal_interest_r2(rank)=(1-ditch1layer)*illegal_interest_r1_f1(rank)*(1-betaf1)*exp(-a*(rank-1));
%   
%   illegal_interest_r3(rank)=(1-ditch1layer)*illegal_interest_r1_f1(rank)*(1-(1-betaf1)*exp(-a*(rank-1)));



%cal_ditch(K,m,cs_ratio,chunck,alpha,interest1,illegal_interest,tRtt,tTtl,Ni1)

lamda_ratio_r4=0;

for rank=1:K
    
   legal_interest_r4(rank)=(1-ditch_1st_r2)*legal_interest_r2(rank)*(1-hit_ratio_r2(rank))*(1-beta_r2)*exp(-a*(rank-1));
   
   illegal_interest_r4(rank)=(1-ditch_1st_r2)*illegal_interest_r2(rank)*(1-hit_ratio_r2(rank))*(1-beta_r2)*exp(-a*(rank-1));
   
   legal_interest_r5(rank)=(1-ditch_1st_r2)*legal_interest_r2(rank)*(1-hit_ratio_r2(rank))*(1-(1-beta_r2)*exp(-a*(rank-1)));
   
    illegal_interest_r5(rank)=(1-ditch_1st_r2)*illegal_interest_r2(rank)*(1-hit_ratio_r2(rank))*(1-(1-beta_r2)*exp(-a*(rank-1)));
    lamda_ratio_r4=lamda_ratio_r4+(1-beta_r2)*exp(-a*(rank-1))*interest_ratio_r2(rank);
    
    
    
end

ditch_r4=cal_ditch_ratio_2_parts(legal_interest_r4,illegal_interest_r4,cs_ratio,0.008,0.024,60);
ditch_r5=cal_ditch_ratio_2_parts(legal_interest_r5,illegal_interest_r5,cs_ratio,0.008,0.024,60);


lamda_ratio_r5=1-lamda_ratio_r4;


ditch_3layer=lamda_ratio_r4*ditch_r4+lamda_ratio_r5*ditch_r5;





56















end