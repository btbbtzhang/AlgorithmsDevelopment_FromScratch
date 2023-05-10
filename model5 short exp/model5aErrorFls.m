function Error = model5aErrorFls(tspan,IC,trial) %cost funtion
%define the parameter
p.r=trial(1);
p.c1=trial(2);
p.d1=trial(3);

p.pi=trial(4);
p.c2=trial(5);
p.d2=trial(6);
% disp('hello');
tic
[~,solw]=ode45(@model5aDE,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);
Error=((solw(2,1)./solw(2,1))-1).^2+((solw(3,1)./solw(2,1))-4.117865).^2+((solw(4,1)./solw(2,1))-7.595804).^2+((solw(5,1)./solw(2,1))-8.9161114).^2;
