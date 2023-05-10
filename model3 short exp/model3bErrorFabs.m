function Error = model3bErrorFabs(tspan,IC,trial) %cost funtion
%define the parameter
p.r=trial(1);
p.a1=trial(2);
p.b1=trial(3);
p.c1=trial(4);
p.d1=trial(5);

p.d=trial(6);
p.pi=trial(7);
p.a2=trial(8);
p.b2=trial(9);
p.c2=trial(10);
p.d2=trial(11);
% disp('hello');
tic
[~,solw]=ode45(@model3bDE,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);
Error=abs(((solw(2,1)+solw(2,2))./(solw(2,1)+solw(2,2)))-1)+abs(((solw(3,1)+solw(3,2))./(solw(2,1)+solw(2,2)))-1.01432)+...
    abs(((solw(4,1)+solw(4,2))./(solw(2,1)+solw(2,2)))-0.937635)+abs(((solw(5,1)+solw(5,2))./(solw(2,1)+solw(2,2)))-0.758317)+...
    abs((solw(2,2)./solw(2,2))-1)+abs((solw(3,3)./solw(2,2))-0.828108282)+abs((solw(4,3)./solw(2,2))-0.768559285)+abs((solw(5,3)./solw(2,2))-0.507015385)+...
    abs((solw(2,3)./solw(2,3))-1)+abs((solw(3,3)./solw(2,3))-4.117865)+abs((solw(4,3)./solw(2,3))-7.595804)+abs((solw(5,3)./solw(2,3))-8.9161114);