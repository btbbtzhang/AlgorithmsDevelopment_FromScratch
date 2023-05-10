function dydt = model3aDE(~,y,p) %the model system
M =y(1);             % M=mTOR
P2=y(2);             % P2=pmTOR
P3=y(3);             % P3=NMT
P4=y(4);             % P4=pNMT

dMdt = -(p.a1*M)./(p.a2+M)+(p.b1*P2)./(p.b2+P2)-p.d;
dP2dt = (p.a1*M)./(p.a2+M)-(p.b1*P2)./(p.b2+P2);
dP3dt = -(p.c1*P2*P3)./(p.c2+P3)+(p.d1*P4)./(p.d2+P4)+p.pi;
dP4dt=(p.c1*P2*P3)./(p.c2+P3)-(p.d1*P4)./(p.d2+P4)-p.r*P4;


dydt = [dMdt;dP2dt;dP3dt;dP4dt];