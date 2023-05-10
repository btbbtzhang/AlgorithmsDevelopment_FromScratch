clear all
close all

IC(1)=1;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=0;
IC(3)=1;
IC(4)=1;
IC(5)=1;



trial=load('ResultPshortmodel0aLS0502e.mat');
trial=cell2mat(struct2cell(trial));
 %define the parameter
p.r=trial(1,1);
p.a1=trial(1,2);
p.b1=trial(1,3);
p.c1=trial(1,4);
p.d1=trial(1,5);


p.pi=trial(1,6);
p.a2=trial(1,7);
p.b2=trial(1,8);
p.c2=trial(1,9);
p.d2=trial(1,10);
t1=60;t2=300;t3=600;t4=1800; 
tspan=[0,t1,t2,t3,t4];
[t,x]=ode45(@model0aDE,tspan,IC,[],p);
t60=find(abs(t-60)<3,1,'first');
% score=model0aErrorF(tspan,IC,trial);



hold all
plot(t(t60:end),(x(t60:end,1)+x(t60:end,3))./(x(t60,1)+x(t60,3)),'blue');
plot(t(t60:end),x(t60:end,3)./x(t60,3),'black');

plot(60,1,'red*');
plot(300,1,'red*');
plot(600,1,'red*');
plot(1800,1,'red*');
% plot(3600,1,'red*');
% plot(10800,1,'red*');
% plot(21600,1,'red*');
% plot(43200,1,'red*');
hold off
legend('total mTOR','p-mTOR')
% axis([0 30000 0 15]);

figure
plot(t(t60:end),x(t60:end,4)./x(t60,4),'red');
hold on
plot(60,1,'red*');
plot(300,1,'red*');
plot(600,1,'red*');
plot(1800,1,'red*');
hold off
legend('NMT')
