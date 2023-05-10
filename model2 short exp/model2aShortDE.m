function dydt = model2aShortDE(t,y,p) %the model system
M =y(1);             % M=mTOR
P1=y(2);             % P1=Rapamycin-mTOR 
%P2=y(3);             % P2=pmTOR
P3=y(3);             % P3=NMT
P4=y(4);             % P4=pNMT

dMdt = -p.k1*p.R*M-(p.a1*M)./(p.a2+M)+(p.b1*(p.c-M-P1))./(p.b2+(p.c-M-P1))+p.k*P1;
dP1dt = p.k1*p.R*M-p.k*P1;
%dP2dt = (p.a1*M)./(p.a2+M)-(p.b1*P2)./(p.b2+P2);
dP3dt = -(p.c1*(p.c-M-P1)*P3)./(p.c2+P3)+(p.d1*P4)./(p.d2+P4)+p.pi;
dP4dt=(p.c1*(p.c-M-P1)*P3)./(p.c2+P3)-(p.d1*P4)./(p.d2+P4)-p.r*P4;


dydt = [dMdt;dP1dt;dP3dt;dP4dt];