function Error = model4aErrorFls(tspan,IC,trial) %cost funtion
 %define the parameter
p.r=trial(1);
p.a1=trial(2);
p.b1=trial(3);
p.c1=trial(4);
p.d1=trial(5);

p.pi=trial(6);
p.a2=trial(7);
p.b2=trial(8);
p.c2=trial(9);
p.d2=trial(10);
% disp('hello');
tic
[~,solw]=ode45(@model4aDE,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);
Error=(((solw(2,1)+solw(2,2)+solw(2,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+(((solw(3,1)+solw(3,2)+solw(3,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1.01432).^2+...
    (((solw(4,1)+solw(4,2)+solw(4,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-0.937635).^2+(((solw(5,1)+solw(5,2)+solw(5,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-0.758317).^2+...
    ((solw(2,3)./solw(2,3))-1).^2+((solw(3,3)./solw(2,3))-0.828108282).^2+((solw(4,3)./solw(2,3))-0.768559285).^2+((solw(5,3)./solw(2,3))-0.507015385).^2+...
    ((solw(2,4)./solw(2,4))-1).^2+((solw(3,4)./solw(2,4))-4.117865).^2+((solw(4,4)./solw(2,4))-7.595804).^2+((solw(5,4)./solw(2,4))-8.9161114).^2;
