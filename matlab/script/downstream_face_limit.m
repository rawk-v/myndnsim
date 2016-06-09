function[ditch_r1,ditch_2layer,illegal_interest_ratio]=downstream_face_limit(lamdaf1,lamdaf2,betaf1,K,alpha,cs_ratio,a,rtt,ttl,Ni)







lamdaf1=lamdaf1*(1-betaf1);


interest_ratio_layer1=cal_interest_ratio(K,alpha);

illegal_interest_r1_f1=lamdaf1*betaf1*interest_ratio_layer1;




legal_interest_r1_f1=lamdaf1*(1-betaf1)*interest_ratio_layer1;
legal_interest_r1_f2=lamdaf2*interest_ratio_layer1;
legal_interest_r1=legal_interest_r1_f1+legal_interest_r1_f2;












hit_ratior1=cal_hit_ratio(K,100,1,legal_interest_r1,cs_ratio);

ditch1layer=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r1,illegal_interest_r1_f1,rtt,ttl,Ni);

ditch_r1=ditch1layer+cal_ditch_2nd(legal_interest_r1,illegal_interest_r1_f1);


hit_ratior1=cal_hit_ratio(K,100,1,legal_interest_r1,cs_ratio);
% 第一层丢包率

ditch1layer=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r1,illegal_interest_r1_f1,rtt,ttl,Ni);

ditch_r1=ditch1layer+cal_ditch_2nd(legal_interest_r1,illegal_interest_r1_f1);


for rank=1:K
    betaf1;
    betaf2=0;
%     legal_interestlayer2r2(rank)=legal_interestlayer1(rank)*(1-hit_ratiolayer1(rank))*(1-betaf1)*exp(-a*(rank-1));
%     legal_interestlayer2r3(rank)=legal_interestlayer1(rank)*(1-hit_ratiolayer1(rank))*(1-(1-betaf1)*exp(-a*(rank-1)));
%     illegal_interestlayer2r2(rank)=illegal_interestlayer1(rank)*(1-betaf1)*exp(-a*(rank-1));
%     illegal_interestlayer2r3(rank)=illegal_interestlayer1(rank)*(1-(1-betaf1)*exp(-a*(rank-1)));

   
  legal_interest_r2(rank)=legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-betaf1)*exp(-a*(rank-1))+legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-betaf2)*exp(-a*(rank-1));
   
  legal_interest_r3(rank)=legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-(1-betaf1)*exp(-a*(rank-1)))+legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-(1-betaf2)*exp(-a*(rank-1)));
  
  illegal_interest_r2(rank)=illegal_interest_r1_f1(rank)*(1-betaf1)*exp(-a*(rank-1));
  
  illegal_interest_r3(rank)=illegal_interest_r1_f1(rank)*(1-(1-betaf1)*exp(-a*(rank-1)));
  
  
    
end



lamda_ratio_r2=0;

beta_r1=sum(illegal_interest_r1_f1)/(lamdaf1+lamdaf2);


interest_ratio_r1=(legal_interest_r1+illegal_interest_r1_f1)/sum(illegal_interest_r1_f1+legal_interest_r1);
for rank=1:K
    
    
    lamda_ratio_r2=lamda_ratio_r2+(1-beta_r1)*exp(-a*(rank-1))*interest_ratio_r1(rank);
    
    
end


% lamda_ratio_r2=sum(legal_interest_r2+illegal_interest_r2)/sum(legal_interest_r3+legal_interest_r2+illegal_interest_r3+illegal_interest_r2);
lamda_ratio_r3=1-lamda_ratio_r2;

ditch_r2=cal_ditch_ratio_2_parts(legal_interest_r2,illegal_interest_r2,cs_ratio,0.008,0.024,60);

% ditch_r2

ditch_r3=cal_ditch_ratio_2_parts(legal_interest_r3,illegal_interest_r3,cs_ratio,0.008,0.024,60);
% ditch_r3
ditch_2layer=lamda_ratio_r2*ditch_r2+lamda_ratio_r3*ditch_r3;
illegal_interest_ratio=sum(illegal_interest_r2+illegal_interest_r3)/sum(legal_interest_r2+illegal_interest_r2+legal_interest_r3+illegal_interest_r3);




end