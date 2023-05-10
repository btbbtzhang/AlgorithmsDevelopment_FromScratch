clear all
close all



 %define the parameter
p.k1=0.5;
p.r=1;
p.a1=2;
p.b1=1;
p.c1=2;
p.d1=1;
p.k=0.5;

p.pi=0.1;
p.R=1;
p.a2=0.5;
p.b2=0.5;
p.c2=1;
p.d2=2;

IC(2)=1;
IC(3)=1;
IC(5)=1;

A=(p.a1-p.b1)*(1+((p.k1*p.R)./(p.k)));

E=((p.d1*p.pi)./(p.d2*p.r))+p.pi;


t1=[0 2500];


for i=1:1:5
    for k=1:1:5
%             for m=1:0.2:2
IC(1)=i;
IC(4)=k;
% IC(4)=m;
B=-(p.a1-p.b1)*(IC(1)+IC(2)+IC(3))-p.a1*p.b2-(1+((p.k1*p.R)./(p.k)))*p.b1*p.a2;
C=p.b1*p.a2*(IC(1)+IC(2)+IC(3));
D=IC(1)+IC(2)+IC(3)-1-(p.k1*p.R)./(p.k);

M1=(-B+sqrt(B^2-4*A*C))./(2*A);
M2=(-B-sqrt(B^2-4*A*C))./(2*A);

[t,x]=ode23s(@model2aDE,t1,IC,[],p);
hold on
plot(t,x(:,1),'red');
hold on
plot(t(end),M1,'o');
hold on
plot(t(end),M2,'*')

% figure
% plot(x(:,1),x(:,4),'black');

    end
end

% end
