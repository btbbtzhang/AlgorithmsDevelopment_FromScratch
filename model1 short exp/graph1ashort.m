clear all
close all

IC(1)=1;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=1;
IC(3)=1;
IC(4)=1;
IC(5)=1;

 %define the parameter
p.k1=0.036201541171990;
p.r=0.007808565846484;
p.a1=0.038800343332455;
p.b1=0.231637677381386;
p.c1=0.166913499029819;
p.d1=0.084327002482640;

p.pi=8.883857123422871;
p.R=52.467527330768750;
p.a2=6.909720019745754;
p.b2=0.793623350139165;
p.c2=11.866108440267405;
p.d2=39.219019397209530;

% Time_Cesure=10800;
t1=60;t2=300;t3=600;t4=1800; %;t5=3600;t6=21600;t7=43200;
tspan=[0,t1,t2,t3,t4]; %build time range ,t5,t6,t7
%tspan=[0 2500];
[t,x]=ode45(@model1aDE,tspan,IC,[],p);
t60=find(abs(t1-60)<0.3,1,'first');


trial(1)=p.k1; %define the parameter
trial(2)=p.r;
trial(3)=p.a1;
trial(4)=p.b1;
trial(5)=p.c1;
trial(6)=p.d1;
trial(7)=p.pi;
trial(8)=p.R;
trial(9)=p.a2;
trial(10)=p.b2;
trial(11)=p.c2;
trial(12)=p.d2;
score=model1aErrorF(t,IC,trial);



% IC1(1)=x(end,1);
% IC1(2)=x(end,2);
% IC1(3)=x(end,3);
% IC1(4)=x(end,4);
% IC1(5)=x(end,5);
% 
% t2=[Time_Cesure 50000];
% [t2,y]=ode45(@DE3,t2,IC1,[],p);

plot(t1(t60:end),(x(t60:end,1)+x(t60:end,2)+x(t60:end,3))./(x(t60,1)+x(t60,2)+x(t60,3)),'blue');
hold all
% plot(t2,(y(:,1)+y(:,2)+y(:,3))./(y(1,1)+y(1,2)+y(1,3)),'b--');


plot(t1(t60:end),x(t60:end,3)./x(t60,3),'black');
% plot(t2,y(:,3)./y(1,3),'black--');

% plot(t1,x(:,4)./x(t60,4),'red');

plot(60,1,'blue*');
plot(300,1.01432,'blue*');
plot(600,0.937635,'blue*');
plot(1800,0.758317,'blue*');
% plot(10800,1,'blue*');
% plot(21600,0.730521617,'blue*');
% plot(43200,1.07610502727,'blue*');

plot(60,1,'blacko');
plot(300,0.828108282,'blacko');
plot(600,0.768559285,'blacko');
plot(1800,0.507015385,'blacko');
% plot(10800,1,'blacko');
% plot(21600,0.7274467391,'blacko');
% plot(43200,1.9615832196,'blacko');

% plot(60,1,'red+');
% plot(300,4.117865,'red+');
% plot(600,7.595804,'red+');
% plot(1800,8.9161114,'red+');

hold off
legend('total mTOR-short time','pmTOR-short time') %,'NMT-short time'
% axis([0 2500 0 20]);

figure;
hold all
plot(t1(t60:end),x(t60:end,4)./x(t60,4),'red');
% plot(t2,y(:,4)./y(1,4),'red--');
legend('NMT-short time'); %'NMT-long time'
plot(60,1,'red+');
plot(300,4.117865,'red+');
plot(600,7.595804,'red+');
plot(1800,8.9161114,'red+');
% plot(10800,1,'red+');
% plot(21600,0.75467188458,'red+');
% plot(43200,0.864036089,'red+');
hold off


