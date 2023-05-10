clear all

IC(1)=.1;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=1;
IC(3)=1.5;
IC(4)=.4;
IC(5)=.6;

 %define the parameter
p.k1=0.031942680488120;
p.r=0.350088750916890;
p.a1=0.069051887436026;
p.b1=0.130204133939600;
p.c1=0.095048864822110;


p.pi=36.656074264877184;
p.R=12.245636212611780;
p.a2=2.932768658606746;
p.b2=33.638314479034210;
p.c2=0.135270509231990;

% t=[0 50000];
% [t,z]=ode45(@DE3,t,IC,[],p);
t1=[0 12000];
[t1,x]=ode45(@DE3b,t1,IC,[],p);
t2=[12000 50000];
[t2,y]=ode45(@DE3b,t2,IC,[],p);

% plot(t,z(:,4));
plot(t1,(x(:,1)+x(:,2)+x(:,3))./(x(60,1)+x(60,2)+x(60,3)),'blue');
hold all
plot(t2,(y(:,1)+y(:,2)+y(:,3))./(y(9600,1)+y(9600,2)+y(9600,3)),'blue');
plot(t1,x(:,3)./x(60,3),'black');
% plot(t2,y(:,3)./y(9600,3),'black');
% hold all
plot(t1,x(:,4)./x(60,4),'red');
plot(t2,y(:,4)./y(9600,4),'red');
plot(60,1,'blue*');
plot(300,1.01432,'blue*');
plot(600,0.937635,'blue*');
plot(1800,0.758317,'blue*');
plot(3600,1,'blue*');
plot(21600,0.730521617,'blue*');
plot(43200,1.07610502727,'blue*');

plot(60,1,'blacko');
plot(300,0.828108282,'blacko');
plot(600,0.768559285,'blacko');
plot(1800,0.507015385,'blacko');
plot(3600,1,'blacko');
plot(21600,0.7274467391,'blacko');
plot(43200,1.9615832196,'blacko');

plot(60,1,'red+');
plot(300,4.117865,'red+');
plot(600,7.595804,'red+');
plot(1800,8.9161114,'red+');
plot(3600,1,'red+');
plot(21600,0.75467188458,'red+');
plot(43200,0.864036089,'red+');
hold off
% legend('NMT','p-mTOR','total mTOR')
axis([0 50000 0 10]);