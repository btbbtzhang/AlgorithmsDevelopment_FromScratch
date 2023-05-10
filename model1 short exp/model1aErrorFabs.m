function Error = model1aErrorFabs(tspan,IC,trial) %cost funtion
p.k1=trial(1); %define the parameter
p.r=trial(2);
p.a1=trial(3);
p.b1=trial(4);
p.c1=trial(5);
p.d1=trial(6);

p.pi=trial(7);
p.R=trial(8);
p.a2=trial(9);
p.b2=trial(10);
p.c2=trial(11);
p.d2=trial(12);
% disp('hello');
tic
[~,solw]=ode45(@model1aDE,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);
Error=abs(((solw(2,1)+solw(2,2)+solw(2,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1)+abs(((solw(3,1)+solw(3,2)+solw(3,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1.01432)+...
    abs(((solw(4,1)+solw(4,2)+solw(4,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-0.937635)+abs(((solw(5,1)+solw(5,2)+solw(5,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-0.758317)+...
    abs((solw(2,3)./solw(2,3))-1)+abs((solw(3,3)./solw(2,3))-0.828108282)+abs((solw(4,3)./solw(2,3))-0.768559285)+abs((solw(5,3)./solw(2,3))-0.507015385)+...
    abs((solw(2,4)./solw(2,4))-1)+abs((solw(3,4)./solw(2,4))-4.117865)+abs((solw(4,4)./solw(2,4))-7.595804)+abs((solw(5,4)./solw(2,4))-8.9161114);
