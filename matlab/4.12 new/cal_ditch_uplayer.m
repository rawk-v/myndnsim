function[ditch_uplayer,firstlayer,fifthlayer]=cal_ditch_uplayer(lamda,hit_ratio_real,m,cs_ratio,chunck,alpha,beta,tRtt,tTtl,Ni)

[layer,K]=size(hit_ratio_real);










%----------计算分层到达率--------%

%----------计算第一类到达率－－－－－－－－－－－％




interest_ratio1=cal_interest_ratio(K,alpha);

lamda_first_layer=lamda*(1-beta)*interest_ratio1;

illegal_interest_1_layer=lamda*beta*interest_ratio1;



%------第一类分层命中率----%

real_hit_1_rank=hit_ratio_real(:,1)';

lamda_1_rank(1)=lamda_first_layer(1);

for i=2:layer
    
    %--第一类分层到达比率计算--%
    lamda_ratio_uplayer(i)=1-sum(real_hit_1_rank(1:i-1));
    %----第一类分层到达速率----%
    
    lamda_1_rank(i)=lamda_first_layer(1)*lamda_ratio_uplayer(i);   
end


%-----存入第一类%
 


lamda_rank_uplayer=lamda_1_rank;

for rank=2:K
    
    %----------提取K 类分层命中率%
    
    real_hit_Krank=hit_ratio_real(:,rank)';
    real_hit_Krank;
    %----------   K 类第一层到达速率%
    lamda_Krank(1)=lamda_first_layer(rank);
    for i=2:layer
        
        lamda_ratio_uplayer(i)=1-sum(real_hit_Krank(1:i-1));
        lamda_Krank(i)=lamda_first_layer(rank)*lamda_ratio_uplayer(i);
        
    end


    
    lamda_rank_uplayer=[lamda_rank_uplayer;lamda_Krank];
        
end
lamda_per_layer=lamda_rank_uplayer';


save('demo.mat','lamda_per_layer');
test=lamda_per_layer(1,:);

        
    
for layer_current=1:layer
    interest=lamda_per_layer(layer_current,:);
    
    
    
    ditch_uplayer(layer_current)=cal_ditch(K,m,cs_ratio,chunck,alpha,interest,illegal_interest_1_layer,tRtt,tTtl,Ni);
end
        


fifthlayer=ditch_uplayer(5);
firstlayer=ditch_uplayer(1);























    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
        
        
        
        










































end