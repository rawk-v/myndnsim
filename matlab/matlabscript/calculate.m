clear;
clc;
%ranks;
% K=input('input K:');
K=50;
% content per rank;
% m=input('input m:');
m=100;
%cs/content avalable;
% cs_ratio=input('input cs_ratio:');
cs_ratio=0.01;
%chuncks per file;
chunck=1;
%alpha;
% alpha=input('input alpha:');
alpha=1.2;
% arriving rate first layer;
% lamda=input('input lamda:');
lamda=10000;
 beta=input('input beta:');
tRtt=input('input tRtt:');
tTtl=input('input tTtl:');
%max number of entry in pit;
Ni=input('input Ni1:');
layer=input('input layer:');
betas=input('input betas:');



hit_ratio=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda,layer);

real_hit_ratio=cal_hit_ratio_real(hit_ratio);

% [ditch_uplayer,ditch1_prob,ditch3_prob]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta,tRtt,tTtl,Ni);


ditch1layer(3,K)=0;
ditch7layer(3,K)=0;
ditch5layer(3,K)=0;

% for rank=1:K
%     tmp_sum=sum(real_hit_ratio(4:3+h,rank));
%   
%     ditch2(rank)=(1-tmp_sum*(1-betas))*(1-ditch3_prob);
% end
    
x=1;


 
h=2;

for betas_current=0.2:0.3:0.8
   [ditch_uplayer,ditch1_prob,ditch5_prob]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta,tRtt,tTtl,Ni);
    for rank=1:K
        tmp_sum1=sum(real_hit_ratio(2:1+h,rank));
        ditch1(rank)=(1-(1-betas_current)*tmp_sum1)*(1-ditch1_prob);
        tmp_sum3=sum(real_hit_ratio(6:5+h,rank));
        ditch5(rank)=(1-(1-betas_current)*tmp_sum3)*(1-ditch5_prob);
    end
    ditch1layer(x,:)=ditch1;
    ditch5layer(x,:)=ditch5;
    x=x+1;
end
% 
% 
% for ttl_current=0.008:0.008:0.024
%     
%       h=fix(ttl_current/tRtt);
%     [ditch_uplayer,ditch1_prob,ditch5_prob]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta,tRtt,ttl_current,Ni);
%     
%         for rank=1:K
%         tmp_sum1=sum(real_hit_ratio(2:1+h,rank));
%         ditch1(rank)=(1-(1-betas)*tmp_sum1)*(1-ditch1_prob);
%         tmp_sum3=sum(real_hit_ratio(6:5+h,rank));
%         ditch5(rank)=(1-(1-betas)*tmp_sum3)*(1-ditch5_prob);
%         end
%         ttl(x)=ttl_current;
%     ditch1layer(x,:)=ditch1;
%     ditch5layer(x,:)=ditch5;
%     x=x+1;
% end

%     
















% for beta_current=0.2:0.3:0.8
%     [ditch_uplayer,ditch1_prob,ditch5_prob]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta_current,tRtt,tTtl,Ni);
%     for rank=1:K
%         h=fix(tTtl/tRtt);
%         tmp_sum1=sum(real_hit_ratio(2:1+h,rank));
%         ditch1(rank)=(1-(1-betas)*tmp_sum1)*(1-ditch1_prob);
%         tmp_sum5=sum(real_hit_ratio(6:5+h,rank));
%         ditch5(rank)=(1-(1-betas)*tmp_sum5)*(1-ditch5_prob);
%     end
%     ditch1layer(x,:)=ditch1;
%     ditch5layer(x,:)=ditch5;
%     x=x+1;
% end

%     
%         
        
        
        

        
































% %Ni=50;
% 
hit_ratio=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda,layer);
real_hit_ratio=cal_hit_ratio_real(hit_ratio);
% 
% % for beta_current=0.1:0.1:0.9
% %     x=1;  
% %     for Ni_current=20:30:90
% %     
% %     [ditch_p,el1]=cal_ditch(K,m,cs_ratio,chunck,alpha,lamda1,beta_current,tRtt,tTtl,Ni_current);
% %     
% %     ditch_prob(x,y)=ditch_p;
% %     
% %     el(x,y)=el1;
% %     beta(x,y)=beta_current;
% %    Ni(x,y)=Ni_current;
% %     x=x+1;
% %     end
% %     y=y+1;
% %     
% % end




% x=1;y=1;
% for lamda_current=10000:1000:20000
%      x=1;  
%     for beta_current=0.2:0.2:0.9
%     [ditch_uplayer,ditch1_prob(x,y),ditch3_prob(x,y)]=cal_ditch_uplayer(lamda_current,real_hit_ratio,m,cs_ratio,chunck,alpha,beta_current,tRtt,tTtl,Ni);
% 
% 
%    
%     beta(x,y)=beta_current;
% %     lamda(x,y)=lamda_current;
%    
% %Ni(x,y)=Ni_current;
% 
% 
%     x=x+1;
%     end
%     y=y+1;
% end

  


















% %----------first layer---------------%
% interest_ratio1=cal_interest_ratio(K,alpha);
% 
% interest1=lamda1*interest_ratio1;
% ti1=cal_ti(K,m,chunck,interest1,cs_ratio);
% hit_ratio1=cal_hit_ratio(K,m,chunck,interest1,cs_ratio);
% 
% rate1=cal_rate(interest1,hit_ratio1,beta);
% y1=cal_y(interest1,beta,hit_ratio1,tRtt,tTtl);
% 
% ditch_p1=cal_piN(rate1,y1,Ni1);
% 
% el1=cal_el(interest1,beta,hit_ratio1,tRtt,tTtl);
% 

%--------------beta  Ni-----------------%
x=1;
y=1;
%ditch_prob(8,9)=0;


%----- ttl----------%
% for ttl_current=0.008:0.001:0.030
%     [ditch_p,el1]=cal_ditch(K,m,cs_ratio,chunck,alpha,lamda,beta,tRtt,ttl,Ni);
%     ditch_prob(x)=ditch_p;
%     ttl(x)=ttl_current;
%     el(x)=el1;
%     x=x+1;
% end







%-------------beta lamda---%

% for lamda_current=10000:1000:20000
%     x=1;  
%     for beta_current=0.2:0.2:0.8
%     
%     [ditch_p,el1]=cal_ditch(K,m,cs_ratio,chunck,alpha,lamda_current,beta_current,tRtt,tTtl,Ni);
%     
%     ditch_prob(x,y)=ditch_p;
%     
%     el(x,y)=el1;
%     beta(x,y)=beta_current;
%   % Ni(x,y)=Ni_current;
%     lamda(x,y)=lamda_current;
%     x=x+1;
%     end
%     y=y+1;
%     
% end









%---------------------the second layer-------------%
% for i=1:K
%     interest2(i)=interest1(i)*(1-hit_ratio1(i));
% end
% ti2=cal_ti(K,m,chunck,interest2,cs_ratio);
% lamda2=cal_lamda(interest2);
% hit_ratio2=cal_hit_ratio(K,m,chunck,interest2,cs_ratio);


    