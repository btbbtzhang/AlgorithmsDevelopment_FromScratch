clear all
close all

IC(1)=3;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=.3;
IC(3)=.5;
IC(4)=1.4;
IC(5)=.6;

 %define the parameter
p.k1=0.246765309637288;
p.r=0.005819164608886;
p.a1=0.336916939433165;
p.b1=0.241360924182277;
p.c1=0.142580042534090;
p.k=0.036206276492166;

p.pi=2.510076792865187;
p.R=3.014672644617437;
p.a2=20.397235611161930;
p.b2=17.973938250488104;
p.c2=18.526602713296583;

% Time_Cesure=10800;

t1=[0 2500];
[t1,x]=ode45(@model2bDE,t1,IC,[],p);
t60=find(abs(t1-60)<0.2,1,'first');


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
% axis([0 2500 0 35]);

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


