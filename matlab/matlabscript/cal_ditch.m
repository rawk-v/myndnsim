function[ditch_p,el1]=cal_ditch(K,m,cs_ratio,chunck,alpha,interest1,beta,tRtt,tTtl,Ni1)




ti1=cal_ti(K,m,chunck,interest1,cs_ratio);
hit_ratio1=cal_hit_ratio(K,m,chunck,interest1,cs_ratio);

rate1=cal_rate(interest1,hit_ratio1,beta);
y1=cal_y(interest1,beta,hit_ratio1,tRtt,tTtl);
el1=cal_el(interest1,beta,hit_ratio1,tRtt,tTtl);
ditch_p=cal_piN(rate1,y1,Ni1);



end
