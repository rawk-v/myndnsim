function[ditch_r1,ditch_r2,ditch_r3]=cal_ditch_r2r3(lamdaf1,lamdaf2,betaf1,K,alpha,cs_ratio,a,rtt,ttl,Ni)







interest_ratio_layer1=cal_interest_ratio(K,alpha);
%------------第一层非法请求包-   向量----%
illegal_interest_r1_f1=lamdaf1*betaf1*interest_ratio_layer1;
%----------第一层合法请求包-----------%

legal_interest_r1_f1=lamdaf1*(1-betaf1)*interest_ratio_layer1;
legal_interest_r1_f2=lamdaf2*interest_ratio_layer1;
legal_interestlayer1=legal_interest_r1_f1+legal_interest_r1_f2;
%-第一层命中率



hit_ratior1=cal_hit_ratio(K,100,1,legal_interestlayer1,cs_ratio);
% 第一层丢包率

ditch1layer=cal_ditch(K,100,cs_ratio,1,1.2,legal_interestlayer1,illegal_interest_r1_f1,rtt,ttl,Ni);

ditch(1)=ditch1layer+cal_ditch_2nd(legal_interestlayer1,illegal_interest_r1_f1);


% %-----------第一层命中率-   向量---%  命中率由合法包计算出合法包
% hit_ratiolayer1=cal_hit_ratio(K,100,1,legal_interestlayer1,0.01);



for rank=1:K
    betaf1;
    betaf2=0;
%     legal_interestlayer2r2(rank)=legal_interestlayer1(rank)*(1-hit_ratiolayer1(rank))*(1-betaf1)*exp(-a*(rank-1));
%     legal_interestlayer2r3(rank)=legal_interestlayer1(rank)*(1-hit_ratiolayer1(rank))*(1-(1-betaf1)*exp(-a*(rank-1)));
%     illegal_interestlayer2r2(rank)=illegal_interestlayer1(rank)*(1-betaf1)*exp(-a*(rank-1));
%     illegal_interestlayer2r3(rank)=illegal_interestlayer1(rank)*(1-(1-betaf1)*exp(-a*(rank-1)));

   
  legal_interest_r2(rank)=(1-ditch1layer)*legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-betaf1)*exp(-a*(rank-1))+(1-ditch1layer)*legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-betaf2)*exp(-a*(rank-1));
   
  legal_interest_r3(rank)=(1-ditch1layer)*legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-(1-betaf1)*exp(-a*(rank-1)))+(1-ditch1layer)*legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-(1-betaf2)*exp(-a*(rank-1)));
  
  illegal_interest_r2(rank)=(1-ditch1layer)*illegal_interest_r1_f1(rank)*(1-betaf1)*exp(-a*(rank-1));
  
  illegal_interest_r3(rank)=(1-ditch1layer)*illegal_interest_r1_f1(rank)*(1-(1-betaf1)*exp(-a*(rank-1)));
  
  
    
end
% sum(legal_interest_r2)
% 
% sum(legal_interest_r3)
% 
% sum(illegal_interest_r2)
% 
% sum(illegal_interest_r3)







% save('tmp.mat','legal_interest_r2','legal_interest_r3');






%----------计算丢包率






ditchr2=cal_ditch_ratio_2_parts(legal_interest_r2,illegal_interest_r2,betaf1,cs_ratio,rtt,ttl,Ni);



ditchr3=cal_ditch_ratio_2_parts(legal_interest_r3,illegal_interest_r3,betaf1,cs_ratio,rtt,ttl,Ni);




%ditch1layer=cal_ditch(K,100,cs_ratio,1,1.2,legal_interestlayer1,illegal_interest_r1_f1,rtt,ttl,Ni);

ditch_1st_r2=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r2,illegal_interest_r2,rtt,ttl,Ni);
ditch_1st_r3=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r3,illegal_interest_r3,rtt,ttl,Ni);
%hit_ratior1=cal_hit_ratio(K,100,1,legal_interestlayer1,cs_ratio);



hit_ratio_r2=cal_hit_ratio(50,100,legal_interest_r2,cs_ratio);
hit_ratio_r3=cal_hit_ratio(50,100,legal_interest_r3,cs_ratio);



legal_interest_r2_to_r4=legal_interest_r2.*(1-hit_ratio_r2)*(1-ditch_1st_r2)*0.5;
legal_interest_r2_to_r5=legal_interest_r2_to_r4;
illegal_interest_r2_to_r4=illegal_interest_r2*(1-ditch_1st_r2)*0.5;
illegal_interest_r2_to_r5=illegal_interest_r2_to_r4;



legal_interest_r3_to_r4=legal_interest_r3.*(1-hit_ratio_r3)*(1-ditch_1st_r3)*0.5;
legal_interest_r3_to_r5=legal_interest_r3_to_r4;
illegal_interest_r3_to_r4=illegal_interest_r3*(1-ditch_1st_r3)*0.5;
illegal_interest_r3_to_r5=illegal_interest_r3_to_r4;



ditch(2)=ditchr3+ditchr2;

%-------------------第三层

legal_interest_r4=legal_interest_r2_to_r4+legal_interest_r3_to_r4;
illegal_interest_r4=illegal_interest_r3_to_r4+illegal_interest_r2_to_r4;




llegal_interest_r5=legal_interest_r2_to_r5+legal_interest_r3_to_r5;
illegal_interest_r5=illegal_interest_r2_to_r5+illegal_interest_r3_to_r5;

%ditch1layer=cal_ditch(K,100,cs_ratio,1,1.2,legal_interestlayer1,illegal_interest_r1_f1,rtt,ttl,Ni);

ditch_r4=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r4,illegal_interest_r4,rtt,ttl,Ni)+cal_ditch_2nd(legal_interest_r4,illegal_interest_r4);

ditch_r5=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r5,illegal_interest_r5,rtt,ttl,Ni)+cal_ditch_2nd(legal_interest_r5,illegal_interest_r5);


ditch(3)=ditch_r4+ditch_r5;






% 
% legal_interest_r3_to_r4=legal_interest_r2.*(1-hit_ratio_r3)*(1-ditch_1st_r3)*0.5;



























































end
