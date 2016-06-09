function[ditch_ratio]=cal_ditch_ratio_2_parts(legal_interest,illegal_interest,betaf1,cs_ratio,rtt,ttl,Ni)

illegal_ratio=sum(illegal_interest)/sum(legal_interest+illegal_interest);



% legal_sum=sum(legal_interest)
% illegal_sum=sum(illegal_interest)


K=numel(legal_interest);

%------通过legal_interest计算第二层及以上各级命中率－

% hit_ratio_base=cal_hit_ratio(K,100,1,legal_interest,cs_ratio);
%-----------假设第一层不存在　命中率为０,

hit_ratio_base(1:K)=0;
hit_ratio=hit_ratio_base;




interest=legal_interest;
layer=8;
for i=2:layer

    % ------------------计算第i 层　分类兴趣包数量%
    
        interest_current=(1-hit_ratio(i-1,:)).*interest((i-1),:);
%         lamda_current=sum(interest_current);
        
%         lamda=[lamda;lamda_current];
        interest=[interest;interest_current];
        
%         ti_current=cal_ti(K,m,chunck,interest(i,:),cs_ratio);
      
        hit_ratio_current=cal_hit_ratio(K,100,1,interest(i,:),cs_ratio);

%         ti=[ti;ti_current];
        
        hit_ratio=[hit_ratio;hit_ratio_current];
        
end

real_hit_ratio=cal_hit_ratio_real(hit_ratio);

% save('tmp_ratio.mat','real_hit_ratio','hit_ratio');


























%-----------pit-------资源耗尽

m=100;
[ditch1,tmp]=cal_ditch(K,m,cs_ratio,1,1.2,legal_interest,illegal_interest,rtt,ttl,Ni);




% hit_ratio=cal_hit_ratio_uplayer(K,1.2,100,1,0.01,10000,layer);


%------------计算流行度占比------％
tmp_sum=sum(legal_interest);

for rank=1:K
    interest_ratio(rank)=legal_interest(rank)/tmp_sum;
end



h=fix(ttl/rtt);
betas=0.2;


%----------计算第二层超时丢包（分类）-----%
for rank=1:K  
    
    ditch2(rank)=illegal_ratio*(1-ditch1);
   
end

%-----计算超时丢包的数学期望---%

expected_value=sum(ditch2.*interest_ratio);



ditch_ratio=expected_value+ditch1;

end









