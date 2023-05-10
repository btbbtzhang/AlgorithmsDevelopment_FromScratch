%%% Main function (genetic algorithm)
close all;
clear all;

F = 0.9;        %difference posibility
CR = .1;        %cross posibility
D  = 8;        %dimension 
NP = 20;        %running times in one generation
maxgen = 1000;  %max generation     
cost=1E6.*ones(NP*maxgen,1); %build initial cost funtion with random values
x1=zeros(NP,D);
trial=zeros(1,D);
x2=zeros(NP,D);

for i=1:1:NP    %build parameter searching space
   for j=1:1:4
        x1(i,j)=rand*rand*rand;
   end
      for k=5:1:D
        x1(i,k)=1E-3+(1E2-1E-3).*rand.*rand.*rand;
      end 
   
end
t1=60;t2=300;t3=600;t4=1800;t5=3600;t6=10800;t7=21600;t8=43200;
tspan=[0,t1,t2,t3,t4,t5,t6,t7,t8]; %build time range
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
       %disp(trial);
       score=nodrugnew2(tspan,IC,trial); %go to use fitness funtion to evaluate the error
       if score<=cost(i+(count-1)*NP,1)    
%            disp('GOOD');
            
            x2(i,1:1:D)=trial(1:1:D); %in order to update searching space x1
            cost(i+1+(count-1)*NP,1)=score; %evolve cost funtion to make the error smaller and smaller
            
       else
%            disp('BAD');
               cost(i+1+(count-1)*NP,1)=cost(i+(count-1)*NP,1); % if error doesnt decrease, keep the same value of cost
               
               x2(i,1:1:D)=x1(i,1:1:D);
               
               
       end
   end
 %update searching space x1 (like an evolve system, learning by itself)
        x1=x2;
    
disp(count);
    
end    

save('ResultFittingmodel0b.mat','trial');
