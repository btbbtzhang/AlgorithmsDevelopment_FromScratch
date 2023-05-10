clear all
close all

IC(1)=.1;        %build initial conditions for each reactant, eg. for M, P1, P2...
IC(2)=0;
IC(3)=.1;
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
tspan=[0 25000];
A=p.b1-p.a1;
B=-p.a1*p.b2-p.b1*p.a2-(p.b1-p.a1)*(IC(1)+IC(3));
C=p.a1*p.b2*(IC(1)+IC(3));
D=(p.d1*p.pi)./(p.r*p.d2+p.pi)+p.pi;
for i=1:5:30
    IC(5)=i;
    for j=1:2:10
        IC(4)=j;
[t,x]=ode45(@model0aDE,tspan,IC,[],p);
% t60=find(abs(t-60)<1,1,'first');
X=(-B-sqrt(B^2-4*A*C))./(2*A);



hold all
figure(1)
plot(t(1:end),x(1:end,4),'blue');
xlabel('time')
ylabel('P3')
hold off

hold all
figure(2)
plot(t(1:end),x(1:end,3),'red');
plot(t(1:end),X,'mo');
plot(t(1:end),(trial(1,5)+trial(1,6))./trial(1,4),'black');
plot(t(1:end),((trial(1,5)*trial(1,6)+trial(1,1)*trial(1,10)*trial(1,6)+trial(1,6)*trial(1,6))./(trial(1,1)*trial(1,10)+trial(1,6)*trial(1,4))),'green');
hold off

% hold all
% figure(3)
% plot(t(1:end),x(1:end,4),'m');
% hold off
% figure
% plot(t(1:end),x(1:end,4),'red');
% plot(t(t60:end),(x(t60:end,1)+x(t60:end,3))./(x(t60,1)+x(t60,3)),'blue');
% plot(t(t60:end),x(t60:end,3)./x(t60,3),'black');
% 
% plot(60,1,'red*');
% plot(300,1,'red*');
% plot(600,1,'red*');
% plot(1800,1,'red*');
% % plot(3600,1,'red*');
% % plot(10800,1,'red*');
% % plot(21600,1,'red*');
% % plot(43200,1,'red*');
% hold off
% legend('total mTOR','p-mTOR')
% % axis([0 30000 0 15]);
% 
% figure
% plot(t(t60:end),x(t60:end,4)./x(t60,4),'red');
% hold on
% plot(60,1,'red*');
% plot(300,1,'red*');
% plot(600,1,'red*');
% plot(1800,1,'red*');
% hold off
%legend('NMT')
    end
end
