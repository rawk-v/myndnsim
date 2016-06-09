function[all_ditch,ditchr2,ditchr3]=cal_ditch_r2r3(lamdaf1,lamdaf2,betaf1,K,alpha,cs_ratio,a,rtt,ttl,Ni)







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




% %-----------第一层命中率-   向量---%  命中率由合法包计算出合法包
% hit_ratiolayer1=cal_hit_ratio(K,100,1,legal_interestlayer1,0.01);



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







save('tmp.mat','legal_interest_r2','legal_interest_r3');






%----------计算丢包率

ditchr2=cal_ditch_ratio_2_parts(legal_interest_r2,illegal_interest_r2,betaf1,cs_ratio,rtt,ttl,Ni);


ditchr3=cal_ditch_ratio_2_parts(legal_interest_r3,illegal_interest_r3,betaf1,cs_ratio,rtt,ttl,Ni);

all_ditch=ditchr3+ditchr2;





















































end
