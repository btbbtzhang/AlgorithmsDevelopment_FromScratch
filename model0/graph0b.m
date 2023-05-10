clear all
close all

IC(1)=.1;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=0;
IC(3)=1.5;
IC(4)=.4;
IC(5)=.6;

 %define the parameter
p.r=0.119279896614001;
p.a1=0.046744872000074;
p.b1=0.024667180593441;
p.c1=0.098310695650192;



p.pi=5.995528158130276;
p.a2=4.153028552713420;
p.b2=3.588650704584774;
p.c2=51.634337157686050;

t=[0 50000];
[t,x]=ode45(@DEwithout2,t,IC,[],p);



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