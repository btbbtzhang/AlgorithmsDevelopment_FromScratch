clear all
close all

IC(1)=2;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=.3;



trial=load('ResultPshortmodel3a0321.mat');
trial=cell2mat(struct2cell(trial));
 %define the parameter
p.k1=trial(1,1);
p.r=trial(1,2);
p.a1=trial(1,3);
p.b1=trial(1,4);
p.c1=trial(1,5);
p.d1=trial(1,6);
p.k=trial(1,7);

p.pi=trial(1,8);
p.R=trial(1,9);
p.a2=trial(1,10);
p.b2=trial(1,11);
p.c2=trial(1,12);
p.d2=trial(1,13);

% Time_Cesure=10800;

t1=[0 2500];
[t1,x]=ode45(@model2aDE,t1,IC,[],p);
t60=find(abs(t1-60)<1.2,1,'first');


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
legend('total mTOR-short time','pmTOR-short time')%,'NMT-short time'
% axis([0 2500 0 40]);

figure;
hold all
plot(t1(t60:end),x(t60:end,4)./x(t60,4),'red');
% plot(t2,y(:,4)./y(1,4),'red--');
legend('NMT-short time') %,'NMT-long time'
plot(60,1,'red+');
plot(300,4.117865,'red+');
plot(600,7.595804,'red+');
plot(1800,8.9161114,'red+');
% plot(10800,1,'red+');
% plot(21600,0.75467188458,'red+');
% plot(43200,0.864036089,'red+');
hold off


