clear all
close all

IC(1)=.1;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=0;
IC(3)=1.5;
IC(4)=.4;
IC(5)=.6;

 %define the parameter
p.r=0.3066054470740879;
p.a1=0.25630349546248365;
p.b1=0.018433144253221456;
p.c1=0.001054672340244285;
p.d1=0.0031266029509208694;


p.pi=59.88129527405221;
p.a2=8.702370896898525;
p.b2=5.285373777348885;
p.c2=19.995158301993246;
p.d2=1.7790947166307822;
t=[0 50000];
[t,x]=ode45(@DEwithout,t,IC,[],p);


plot(t,x(:,4)./x(60,4),'green');
hold all
plot(t,x(:,3)./x(60,3),'black');
plot(t,(x(:,1)+x(:,3))./(x(60,1)+x(60,3)),'blue');
plot(60,1,'red*');
plot(300,1,'red*');
plot(600,1,'red*');
plot(1800,1,'red*');
plot(3600,1,'red*');
plot(10800,1,'red*');
plot(21600,1,'red*');
plot(43200,1,'red*');
hold off
legend('NMT','p-mTOR','total mTOR','Location','northwest')
axis([0 50000 0 2]);