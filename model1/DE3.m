function dydt = DE3(~,y,p)
M =y(1);
P1=y(2);
P2=y(3);
P3=y(4);
P4=y(5);

dMdt = -p.k1*p.R*M-(p.a1*M)/(p.a2+M)+(p.b1*P2)/(p.b2+P2);
dP1dt = p.k1*p.R*M;
dP2dt = (p.a1*M)/(p.a2+M)-(p.b1*P2)/(p.b2+P2);
dP3dt = -(p.c1*P2*P3)/(p.c2+P3)+(p.d1*P4)/(p.d2+P4)+p.pi;
dP4dt=(p.c1*P2*P3)/(p.c2+P3)-(p.d1*P4)/(p.d2+P4)-p.r*P4;


dydt = [dMdt;dP1dt;dP2dt;dP3dt;dP4dt];