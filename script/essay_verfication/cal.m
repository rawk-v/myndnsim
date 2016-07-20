clc;
clear;

lamda=10^5;
K=50;
m=100;
cs_ratio=0.1;

alpha=1.2;
verifyp=0.5;

valid_s1=0.8;
valid_s2=0.6;



ita_r2_s1=0.6;
ita_r2_s2=0.4;

ita_r3_s1=0.5;
ita_r3_s2=0.5;

ita_r1_r2=0.5;
ita_r1_r3=0.5;

T_r2=[ita_r2_s1,ita_r2_s2]*[valid_s1,valid_s2]';
T_r3=[ita_r3_s1,ita_r3_s2]*[valid_s1,valid_s2]';

valid_r2=T_r2/(1-(1-T_r2)^2);
valid_r3=T_r3/(1-(1-T_r3)^2);


T_r1=[ita_r1_r2,ita_r1_r3]*[T_r2,T_r3]';





interest_ratio=cal_interest_ratio(K,alpha);
interest_r1=interest_ratio*lamda;


tmp=ita_r1_r2*valid_r2+ita_r1_r3*valid_r3;

ti_r1=cal_ti(m,interest_r1,cs_ratio,1-T_r1,tmp);
hit_r1=cal_hit_ratio(m,interest_r1,ti_r1,1-T_r1,tmp);


interest_r2=ita_r1_r2.*interest_r1.*(1-hit_r1);

interest_r3=ita_r1_r3.*interest_r1.*(1-hit_r1);

valid_to_r2=ita_r2_s1*valid_s1+ita_r2_s2*valid_s2;

valid_to_r3=ita_r3_s1*valid_s1+ita_r3_s2*valid_s2;


ti_r2=cal_ti(m,interest_r1,cs_ratio,1-T_r2,valid_to_r2);
hit_r2=cal_hit_ratio(m,interest_r2,cs_ratio,1-T_r2,valid_to_r2);

ti_r3=cal_ti(m,interest_r1,cs_ratio,1-T_r3,valid_to_r3);
hit_r3=cal_hit_ratio(m,interest_r2,cs_ratio,1-T_r3,valid_to_r3);


valid_to_r2_cbs=0.7;
valid_to_r3_cbs=0.7;

valid_r2_cbs=1;
valid_r3_cbs=1;

valid_to_r1=1;
verifyp_cbs=0.5;



% ti_r1_cbs=cal_ti_cbs(m,interest_r1,cs_ratio,verifyp_cbs,);






