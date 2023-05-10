function dydt = model0ashortDE(~,y,p) %the model system
P2=y(1);             % P2=pmTOR
P3=y(2);             % P3=NMT
P4=y(3);             % P4=pNMT


dP2dt = (p.a1*(p.c-P2))./(p.a2+p.c-P2)-(p.b1*P2)./(p.b2+P2);
dP3dt = -(p.c1*P2*P3)./(p.c2+P3)+(p.d1*P4)./(p.d2+P4)+p.pi;
dP4dt=(p.c1*P2*P3)./(p.c2+P3)-(p.d1*P4)./(p.d2+P4)-p.r*P4;


dydt = [dP2dt;dP3dt;dP4dt];