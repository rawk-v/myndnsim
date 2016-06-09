function[ditch_r3r4,ditch_r3,ditch_r4]=cal_ditch_r3r4(lamda_r1_f1,lamda_r1_f2,lamda_r2_f1,lamda_r2_f2,beta_r1_f1,beta_r1_f2,beta_r2_f1,beta_r2_f2,K,alpha,cs_ratio,a1,a2,rtt,ttl,Ni)
beta_r1_f2=0;
beta_r2_f2=0;
interest_ratio_layer1=cal_interest_ratio(K,alpha);
%---------r1,r2 非法请求包都来自f1,　　　f2　全部为合法兴趣包
%--------r1的非法请求包 向量
illegal_interest_r1_f1=lamda_r1_f1*beta_r1_f1*interest_ratio_layer1;
%----------r2的非法请求包　　向量
illegal_interest_r2_f1=lamda_r2_f1*beta_r2_f1*interest_ratio_layer1;


%-------r1  的合法兴趣包情况　向量
legal_interest_r1_f1=lamda_r1_f1*(1-beta_r1_f1)*interest_ratio_layer1;
legal_interest_r1_f2=lamda_r1_f2*interest_ratio_layer1;
legal_interest_r1=legal_interest_r1_f1+legal_interest_r1_f2;

%--------r2 的合法兴趣包情况　　向量

legal_interest_r2_f1=lamda_r2_f1*(1-beta_r1_f1)*interest_ratio_layer1;
legal_interest_r2_f2=lamda_r2_f2*interest_ratio_layer1;
legal_interest_r2=legal_interest_r2_f1+legal_interest_r2_f2;

%--------r1 r2　命中率
hit_ratio_r1=cal_hit_ratio(K,100,1,legal_interest_r1,illegal_interest_r1_f1,rtt,ttl,Ni);
hit_ratio_r2=cal_hit_ratio(K,100,1,legal_interest_r2,illegal_interest_r2_f1,rtt,ttl,Ni);

for rank=1:K
   
%   legal_interest_r2(rank)=legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-betaf1)*exp(-a*(rank-1))+legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-betaf2)*exp(-a*(rank-1));
%    
%   legal_interest_r3(rank)=legal_interest_r1_f1(rank)*(1-hit_ratior1(rank))*(1-(1-betaf1)*exp(-a*(rank-1)))+legal_interest_r1_f2(rank)*(1-hit_ratior1(rank))*(1-(1-betaf2)*exp(-a*(rank-1)));
%   
%   illegal_interest_r2(rank)=illegal_interest_r1_f1(rank)*(1-betaf1)*exp(-a*(rank-1));
%   
%   illegal_interest_r3(rank)=illegal_interest_r1_f1(rank)*(1-(1-betaf1)*exp(-a*(rank-1)));



legal_interest_r3_from_r1(rank)=legal_interest_r1_f1(rank)*(1-hit_ratio_r1(rank))*(1-beta_r1_f1)*exp(-a1*(rank-1))+legal_interest_r1_f2(rank)*(1-hit_ratio_r1(rank))*(1-beta_r1_f2)*exp(-a1*(rank-1));
legal_interest_r3_from_r2(rank)=legal_interest_r2_f1(rank)*(1-hit_ratio_r2(rank))*(1-beta_r2_f1)*exp(-a2*(rank-1))+legal_interest_r2_f2(rank)*(1-hit_ratio_r2(rank))*(1-beta_r2_f2)*exp(-a2*(rank-1));    


legal_interest_r4_from_r1(rank)=legal_interest_r1_f1(rank)*(1-hit_ratio_r1(rank))*(1-(1-beta_r1_f1)*exp(-a1*(rank-1)))+legal_interest_r1_f2(rank)*(1-hit_ratio_r1(rank))*(1-(1-beta_r1_f2)*exp(-a1*(rank-1)));
legal_interest_r4_from_r2(rank)=legal_interest_r2_f1(rank)*(1-hit_ratio_r2(rank))*(1-(1-beta_r2_f1)*exp(-a2*(rank-1)))+legal_interest_r2_f2(rank)*(1-hit_ratio_r2(rank))*(1-(1-beta_r2_f2)*exp(-a2*(rank-1)));

illegal_interest_r3_from_r1(rank)=illegal_interest_r1_f1(rank)*(1-beta_r1_f1)*exp(-a1*(rank-1));
illegal_interest_r3_from_r2(rank)=illegal_interest_r2_f1(rank)*(1-beta_r2_f1)*exp(-a2*(rank-1));


illegal_interest_r4_from_r1(rank)=illegal_interest_r1_f1(rank)*(1-(1-beta_r1_f1)*exp(-a1*(rank-1)));
illegal_interest_r4_from_r2(rank)=illegal_interest_r2_f1(rank)*(1-(1-beta_r2_f1)*exp(-a2*(rank-1)));

    
end

legal_interest_r3=legal_interest_r3_from_r1+legal_interest_r3_from_r2;
legal_interest_r4=legal_interest_r4_from_r1+legal_interest_r4_from_r2;

illegal_interest_r3=illegal_interest_r3_from_r1+illegal_interest_r3_from_r2;
illegal_interest_r4=illegal_interest_r4_from_r1+illegal_interest_r4_from_r2;



ditch_r3=cal_ditch_ratio_2_parts(legal_interest_r3,illegal_interest_r3,beta_r1_f1,cs_ratio,rtt,ttl,Ni);
ditch_r4=cal_ditch_ratio_2_parts(legal_interest_r4,illegal_interest_r4,beta_r2_f1,cs_ratio,rtt,ttl,Ni);

ditch_r3r4=ditch_r3+ditch_r4;























end