clc
clear all
close all


p.r=1;
p.a1=1;
p.b1=3;
p.c1=1;
p.d1=1;

p.pi=.1;
p.a2=2;
p.b2=0.5;
p.c2=1;
p.d2=2;
p.c=300;

IC=ones(3,1);
t1=[0 50000];


A=p.b1-p.a1;
B=p.a1*p.b2+p.b1*p.a2+(p.b1-p.a1)*p.c;
C=p.a1*p.b2*p.c;
D=(p.d1*p.pi)./(p.r*p.d2+p.pi)+p.pi;
a=D/p.c1;
if A>0
    for i=0:100:500
        for j=0:.5:5
        IC(1)=i;
        IC(2)=j;
[t,x]=ode23s(@model0ashortDE,t1,IC,[],p);
X1=(B+sqrt(B^2-4*A*C))./(2*A)
X2=(B-sqrt(B^2-4*A*C))./(2*A)
Y1=(D*p.c2)./(p.c1*X1-D)
Y2=(D*p.c2)./(p.c1*X2-D)
display(x(end,1))
display(x(end,2))
plot(X1,Y1,'r*');
hold on
plot(X2,Y2,'r*')

hold on
plot(x(:,1),x(:,2),'LineWidth',1)

plot(x(end,1),x(end,2),'ko')
xlabel('P2');
ylabel('P3')
        end
    end
end




