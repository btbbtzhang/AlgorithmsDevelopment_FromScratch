close all;
clear all;


F = 0.2;        %difference posibility
CR = .8;        %cross posibility
D  = 14;        %dimension 
NP = 20;        %running times in one generation
maxgen = 2000;  %max generation     
cost=1E6.*ones(NP*maxgen,1); %build initial cost funtion with random values
x1=zeros(NP,D);
trial=zeros(1,D);
x2=zeros(NP,D);

for i=1:1:NP    %build parameter searching space
   for j=1:1:7
        x1(i,j)=rand*rand*rand;
   end
      for k=8:1:D
        x1(i,k)=1E-3+(1E2-1E-3).*rand.*rand.*rand;
      end 
   
end
t1=60;t2=300;t3=600;t4=1800;t5=10800;t6=21600;t7=43200; %;t5=10800;t6=21600;t7=43200;
tspan=[0,t1,t2,t3,t4,t5,t6,t7]; %build time range ,t5,t6,t7
BBCon=5;          %build initial conditions for each reactant, eg. for M, P1, P2...
IC=ones(BBCon,1);


for count=1:1:maxgen  
   for i=1:1:NP
       a=floor(rand*(NP-1))+1;  %pick up three random numbers
       b=floor(rand*(NP-2))+2;
       c=floor(rand*(NP-3))+3;
       j=floor(rand*D)+1;       %pick up a random
       for k=1:1:D              %chose one random parameter from parameter space and put into trial(best 12 parameter vector) 
           if(rand< CR || k==D) 
               trial(j)=x1(c,j)+F.*(x1(a,j)-x1(b,j));  %the way how to update the trail vector from x1(parameter space)
               if trial(j)<=0
                   trial(j)=x1(i,j);
               else
                   trial(j)=trial(j);
               end
           else
                trial(j)=x1(i,j);
              %j=mod(j+1,D);
           end
       j=mod(j,D)+1;       %go to the next parameter in parameter space
       end
%        if (count==1 && i==1)
%            trial=load('ResultPshortmodel1a0705.mat');
%            trial=cell2mat(struct2cell(trial)); %zeros(1,D);
%        end
       %disp(trial);
%        trial(6)=0; trial(12)=0; %K_m^*=K_n^*=0;
       score=model1aErrorFlong(tspan,IC,trial); %go to use Error funtion to evaluate the error
       if score<=cost(i+(count-1)*NP,1)    
%            disp('GOOD');
            
            x2(i,1:1:D)=trial(1:1:D); %in order to update searching space x1
            cost(i+1+(count-1)*NP,1)=score; %evolve cost funtion to make the error smaller and smaller
            trial0(1:1:D)=trial(1:1:D);  %save the best parameters into trial 0
       else
%            disp('BAD');
               cost(i+1+(count-1)*NP,1)=cost(i+(count-1)*NP,1); % if error doesnt decrease, keep the same value of cost
               
               x2(i,1:1:D)=x1(i,1:1:D);
               
               
       end
       disp(cost(i+(count-1)*NP+1,1));    

   end
 %update searching space x1 (like an evolve system, learning by itself)
        x1=x2;
disp(count);
    
end    

save('ResultPshortmodel1aLong0622.mat','trial0');
