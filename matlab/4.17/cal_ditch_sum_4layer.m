function[ditch_sum]=cal_ditch_sum_4layer(lamdaf1,lamdaf2,betaf1,rtt,ttl,Ni)


K=50;
m=100;
cs_ratio=0.01;
chunck=1;
alpha=1.2;


interest_ratio_r1=cal_interest_ratio(K,alpha);
%------------第一层非法请求包-   向量----%
illegal_interest_r1=lamdaf1*betaf1*interest_ratio_r1;
%----------第一层合法请求包-----------%

legal_interest_r1_f1=lamdaf1*(1-betaf1)*interest_ratio_r1;
legal_interest_r1_f2=lamdaf2*interest_ratio_r1;
legal_interest_r1=legal_interest_r1_f1+legal_interest_r1_f2;
%-第一层命中率


hit_ratio_r1=cal_hit_ratio(K,100,1,legal_interest_r1,cs_ratio);
%----第一层第一部分丢包率
ditch_1st_r1=cal_ditch(K,100,cs_ratio,1,1.2,legal_interest_r1,illegal_interest_r1,rtt,ttl,Ni);


ditch_r1=ditch_1st_r1+cal_ditch_2nd(legal_interest_r1,illegal_interest_r1);








%r2

legal_interest_r2=legal_interest_r1.*(1-hit_ratio_r1)*(1-ditch_1st_r1)*0.5;
illegal_interest_r2=illegal_interest_r1*(1-ditch_1st_r1)*0.5;



hit_ratio_r2=cal_hit_ratio(K,100,1,legal_interest_r2,cs_ratio);
ditch_1st_r2=cal_ditch(K,m,cs_ratio,chunck,alpha,legal_interest_r2,illegal_interest_r2,rtt,ttl,Ni);



legal_interest_r2_to_r4=legal_interest_r2.*(1-hit_ratio_r2)*(1-ditch_1st_r2)*0.5;
legal_interest_r2_to_r5=legal_interest_r2_to_r4;


illegal_interest_r2_to_r4=illegal_interest_r2*(1-ditch_1st_r2)*0.5;


illegal_interest_r2_to_r5=illegal_interest_r2_to_r4;




ditch_r2=ditch_1st_r2+cal_ditch_2nd(legal_interest_r2,illegal_interest_r2);











%-----r3

legal_interest_r3=legal_interest_r2;
% illegal_interest_r3=illegal_interests_r1*(1-ditch_r1)*0.5;
illegal_interest_r3=illegal_interest_r2;



hit_ratio_r3=cal_hit_ratio(K,100,1,legal_interest_r3,cs_ratio);
ditch_1st_r3=cal_ditch(K,m,cs_ratio,chunck,alpha,legal_interest_r3,illegal_interest_r3,rtt,ttl,Ni);

legal_interest_r3_to_r4=legal_interest_r3.*(1-hit_ratio_r3)*(1-ditch_1st_r3)*0.5;
legal_interest_r3_to_r5=legal_interest_r3_to_r4;

illegal_interest_r3_to_r4=illegal_interest_r3*(1-ditch_1st_r3)*0.5;


illegal_interest_r3_to_r5=illegal_interest_r3_to_r4;

ditch_r3=ditch_1st_r3+cal_ditch_2nd(legal_interest_r3,illegal_interest_r3);




%----------r4

legal_interest_r4=legal_interest_r2_to_r4+legal_interest_r3_to_r4;
illegal_interest_r4=illegal_interest_r2_to_r4+illegal_interest_r3_to_r4;

ditch_1st_r4=cal_ditch(K,m,cs_ratio,chunck,alpha,legal_interest_r4,illegal_interest_r4,rtt,ttl,Ni);
ditch_r4=ditch_1st_r4+cal_ditch_2nd(legal_interest_r4,illegal_interest_r4);











%-----r5
legal_interest_r5=legal_interest_r4;

illegal_interest_r5=illegal_interest_r4;
ditch_r5=ditch_r4;







ditch_sum(1)=ditch_r1;
ditch_r2
ditch_r3
ditch_sum(2)=ditch_r2+ditch_r3;
ditch_r4
ditch_r5
ditch_sum(3)=ditch_r4+ditch_r5;













end