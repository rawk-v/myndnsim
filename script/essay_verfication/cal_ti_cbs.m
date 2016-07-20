function[ti]=cal_ti_cbs(m,interest,cs_ratio,verifyp,validp)

K=numel(interest);
chunck=1;
right_hand=K*cs_ratio/chunck;

ti_low=0;
ti_up=10;


d1=cal_differ_cbs(right_hand,m,interest,ti_low,verifyp,validp);
d2=cal_differ_cbs(right_hand,m,interest,ti_up,verifyp,validp);

while(abs(ti_up-ti_low)>10^(-7))
   
    ti_middle=(ti_low+ti_up)/2;
    
    if((cal_differ_cbs(right_hand,m,interest,ti_low,verifyp,validp))*(cal_differ_cbs(right_hand,m,interest,ti_middle,verifyp,validp)<0))
        ti_up=ti_middle;
    else
        if((cal_differ_cbs(right_hand,m,interest,ti_middle,verifyp,validp))*(cal_differ_cbs(right_hand,m,interest,ti_up,verifyp,validp)<0))
            ti_low=ti_middle;
        end
    end
end
ti=(ti_up+ti_low)/2;
    
end