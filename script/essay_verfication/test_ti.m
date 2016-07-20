clc;
clear;
K=20;
m=100;
chunck=1;
verifyp=0.29;
validp=0.77;
cs_ratio=0.1;
i=1;


    interest_ratio=cal_interest_ratio(50,1.2);
    lamda=10^5;
    interest=interest_ratio*lamda;


    ti=cal_ti(m,interest,cs_ratio,verifyp,validp);
    hit=cal_hit_ratio(m,interest,ti,verifyp,validp);
    ti_cbs=cal_ti_cbs(m,interest,cs_ratio,verifyp,validp);
    
   
    
    


    

    


