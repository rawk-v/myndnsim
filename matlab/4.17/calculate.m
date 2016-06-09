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
lamda_r1_f1=10000;
lamda_r1_f2=10000;
lamda_r2_f1=8000;
lamda_r2_f2=8000;
beta_r1_f1=0.7;


%---r1 的恶意兴趣包比率越大　a2　越小







beta_r2_f1=0.2;



beta_r1_f2=0;
beta_r2_f2=0;

beta=0.2;
%
tRtt=0.008;

tTtl=0.024;

Ni=60;

layer=8;



% [ditch_uplayer,ditch1_prob,ditch3_prob]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta,tRtt,tTtl,Ni);


% ditch1layer(3,K)=0;
% ditch7layer(3,K)=0;
% ditch5layer(3,K)=0;

% for rank=1:K
%     tmp_sum=sum(real_hit_ratio(4:3+h,rank));
%   
%     ditch2(rank)=(1-tmp_sum*(1-betas))*(1-ditch3_prob);
% end
    
x=1;


 
% h=3; 
% hit_ratio=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda,layer);
% real_hit_ratio=cal_hit_ratio_real(hit_ratio);
% for betas_current=0.2:0.3:0.8
%    [ditch_uplayer,ditch1_prob,ditch5_prob]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta,tRtt,tTtl,Ni);
%     for rank=1:K
%         tmp_sum1=sum(real_hit_ratio(2:1+h,rank));
%         ditch1(rank)=(1-(1-betas_current)*tmp_sum1)*(1-ditch1_prob);
%         tmp_sum3=sum(real_hit_ratio(6:5+h,rank));
%         ditch5(rank)=(1-(1-betas_current)*tmp_sum3)*(1-ditch5_prob);
%     end
%     ditch1layer(x,:)=ditch1;
%     ditch5layer(x,:)=ditch5;
%     x=x+1;
% end

% 
% betas=0.2
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
% %     














% betas=0.2;
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
        
x=1;
y=1;

 for a1_current=33:0.1:35
%  for a_current=30:30
 
  [all_ditch_r1(x),ditch_r1_r3(x),ditch_r1_r4(x)]=cal_ditch_r2r3(lamda_r1_f1,lamda_r1_f2,beta_r1_f1,K,1.2,cs_ratio,a1_current,tRtt,tTtl,Ni);
%   [all_ditch_r2(x),ditch_r2_r3(x),ditch_r2_r4(x)]=cal_ditch_r2r3(8000,8000,beta_r2_f1,K,1.2,cs_ratio,a_current,tRtt,tTtl,Ni);
  a(x)=a1_current;
  x=x+1;
 end
% 
% x=1;
% y=1;
% 
% beta_r1_f1
% beta_r2_f1

%     x=1;
%  for a2_current=0:1:10;
%         [ditch_r3r4(x,y),ditch_r3(x,y),ditch_r4(x,y)]=cal_ditch_r3r4(lamda_r1_f1,lamda_r1_f2,lamda_r2_f1,lamda_r2_f2,beta_r1_f1,beta_r1_f2,beta_r2_f1,beta_r2_f2,K,alpha,cs_ratio,a1_current,a2_current,tRtt,tTtl,Ni);
%         x=x+1;
%       %function[ditch_r3r4,ditch_r3,ditch_r4]=cal_ditch_r3r4(lamda_r1_f1,lamda_r1_f2,lamda_r2_f1,lamda_r2_f2,beta_r1_f1,beta_r1_f2,beta_r2_f1,beta_r2_f2,K,alpha,cs_ratio,a1,a2,rtt,ttl,Ni)  
%  end
%     y=y+1;
%  end

    
    
   
    









        

        
































% %Ni=50;
% 
hit_ratio=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda,layer);
real_hit_ratio=cal_hit_ratio_real(hit_ratio);

% for beta_current=0.1:0.1:0.9
%     x=1;  
%     for Ni_current=20:30:90
%     [ditch_uplayer,ditch1_prob(x,y),ditch3_prob(x,y)]=cal_ditch_uplayer(lamda,real_hit_ratio,m,cs_ratio,chunck,alpha,beta_current,tRtt,tTtl,Ni_current);
% %     [ditch_p,el1]=cal_ditch(K,m,cs_ratio,chunck,alpha,lamda1,beta_current,tRtt,tTtl,Ni_current);
% %     
% %     ditch_prob(x,y)=ditch_p;
% %     
% %     el(x,y)=el1;
%     beta(x,y)=beta_current;
%    Ni(x,y)=Ni_current;
%     x=x+1;
%     end
%     y=y+1;
%     
% end
% y=1;





% hit_ratio=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda,layer);
% 
% real_hit_ratio=cal_hit_ratio_real(hit_ratio);




layer=5;


x=1;y=1;
% for lamda_current=6000:1000:20000
%     hit_ratio=cal_hit_ratio_uplayer(K,alpha,m,chunck,cs_ratio,lamda_current,layer);
%     real_hit_ratio=cal_hit_ratio_real(hit_ratio);
%      x=1;  
%     for beta_current=0.2:0.2:0.9
%     [ditch_uplayer,ditch1_prob(x,y),ditch3_prob(x,y)]=cal_ditch_uplayer(lamda_current,real_hit_ratio,m,cs_ratio,chunck,alpha,beta_current,tRtt,tTtl,Ni);
%     
% 
%    
%     beta(x,y)=beta_current;
%      lamda(x,y)=lamda_current;
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
% interest_ratio=cal_interest_ratio(K,alpha);
% y=1;
% 
% for lamda_current=6000:1000:20000
%     
%     x=1;  
%     for beta_current=0.2:0.2:0.8
%          legal_current=lamda_current*(1-beta_current)*interest_ratio;
%      hit_ratio_uplayer=cal_hit_ratio_uplayer(K,alpha,100,1,cs_ratio,10000,5);
%      real_hit_ratio=cal_hit_ratio_real(hit_ratio_uplayer);
%      legal_interest3=(1-real_hit_ratio(1,:)-real_hit_ratio(2,:)).*legal_current;
%    
%     illegal_current=lamda_current*beta_current*interest_ratio;
%         
%         
%         
%     [ditch_p,el1]=cal_ditch(K,m,cs_ratio,chunck,alpha,legal_current,illegal_current,tRtt,tTtl,Ni);
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


    