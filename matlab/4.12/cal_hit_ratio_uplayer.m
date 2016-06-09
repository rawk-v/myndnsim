function[hit_ratio_uplayer]=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda_base,layer)




%-------计算第一层参数------%
%        第一层兴趣包比例%

interest_ratio_base=cal_interest_ratio(K,alpha);

%第一层分类兴趣包数量%
interest_base=lamda_base*interest_ratio_base;

% 第一层ti%







ti_base=cal_ti(K,m,chunck,interest_base,cs_ratio);

%第一层命中率%
hit_ratio_base=cal_hit_ratio(K,m,chunck,interest_base,cs_ratio);

%----存入第一层指标---------%

hit_ratio=hit_ratio_base;

interest_ratio=interest_ratio_base;
ti=ti_base;
lamda=lamda_base;
interest=interest_base;






for i=2:layer

    % ------------------计算第i 层　分类兴趣包数量%
    
        interest_current=(1-hit_ratio(i-1,:)).*interest((i-1),:);
        lamda_current=sum(interest_current);
        
        lamda=[lamda;lamda_current];
        interest=[interest;interest_current];
        
        ti_current=cal_ti(K,m,chunck,interest(i,:),cs_ratio);

        hit_ratio_current=cal_hit_ratio(K,m,chunck,interest(i,:),cs_ratio);

        ti=[ti;ti_current];
        
        hit_ratio=[hit_ratio;hit_ratio_current];
        
end
hit_ratio_uplayer=hit_ratio;

save('hit_ratio','ti','interest','hit_ratio','lamda');
end

        
    
    




