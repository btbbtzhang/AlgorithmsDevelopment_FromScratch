clc
clear all
close all



 %define the parameter
p.k1=0.5;
p.r=1;
p.a1=2;
p.b1=1;
p.c1=4;
p.d1=1;
p.k=0.5;

p.pi=0.1;
p.R=1;
p.a2=5000;
p.b2=0.5;
p.c2=1;
p.d2=2;
p.c=300;

%IC=ones(5,1);
IC=ones(4,1);


A=(p.a1-p.b1)*(1+((p.k1*p.R)./(p.k)));

if A>0
    E=p.c1*(p.d2*p.r+p.pi);
    n=(p.k1*p.R)./(p.k);
    t1=[0 50000];
    for i=1:300:p.c
        for j=1:300:p.c-i
            for k=1:100:100
                IC(3)=k;%(4)
                %IC(3)=j;
                IC(1)=i;
                IC(2)=p.c-i-j;
                B=-(p.a1-p.b1)*(p.c)-p.a1*p.b2-(1+((p.k1*p.R)./(p.k)))*p.b1*p.a2;
                if B<0
                    C=p.b1*p.a2*(p.c);
                    D=p.pi*(p.d1+p.d2*p.r+p.pi);
                    a=(E*p.c-D)./(E*(1+n));
                    
                   
                    %M1=(-B+sqrt(B^2-4*A*C))./(2*A)
                    M2=(-B-sqrt(B^2-4*A*C))./(2*A)
                    %P31=p.c2*D/(E*p.c-D-E*(1+n)*M1)
                    P32=p.c2*D/(E*p.c-D-E*(1+n)*M2)
                    if(M2-a>0)
                    [t,x]=ode23s(@model2aShortDE,t1,IC,[],p);
                    hold on
                    %plot(x(:,1),x(:,3),'LineWidth',1)
                    hold on
                    %plot(x(end,1),x(end,3),'ko')
                    plot(t,x(:,1),'red',t,x(:,3),'g');
                    hold on
                    display(x(end,1))
                    %plot(M1,P31,'ro');
                    hold on
                    plot(M2,P32,'r*')
                    xlabel('M');
                    ylabel('P_3')
                    end
                end
            end
        end
    end
    
end

% end
