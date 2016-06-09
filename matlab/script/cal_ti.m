function[ti]=cal_ti(K,m,chunck,lamda,cs_ratio)

right_hand=K*cs_ratio/chunck;

ti_low=0;
ti_up=10;


d1=cal_differ(right_hand,K,m,lamda,ti_low);
d2=cal_differ(right_hand,K,m,lamda,ti_up);

while(abs(ti_up-ti_low)>10^(-7))
   
    ti_middle=(ti_low+ti_up)/2;
    
    if((cal_differ(right_hand,K,m,lamda,ti_low))*(cal_differ(right_hand,K,m,lamda,ti_middle)<0))
        ti_up=ti_middle;
    else
        if((cal_differ(right_hand,K,m,lamda,ti_middle))*(cal_differ(right_hand,K,m,lamda,ti_up)<0))
            ti_low=ti_middle;
        end
    end
end
ti=(ti_up+ti_low)/2;
    
end
