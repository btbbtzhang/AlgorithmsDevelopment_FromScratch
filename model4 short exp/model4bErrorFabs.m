function Error = model4bErrorFabs(tspan,IC,trial) %cost funtion
 %define the parameter
p.r=trial(1);
p.a1=trial(2);
p.b1=trial(3);
p.c1=trial(4);

p.pi=trial(5);
p.a2=trial(6);
p.b2=trial(7);
p.c2=trial(8);

% disp('hello');
tic
[~,solw]=ode45(@model4bDE,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);
% for i=2:1:5
% Error=sum(((((solw(i,3)+solw(i,1))./(solw(2,3)+solw(2,1)))-1).^2)+((solw(i,3)./solw(2,3)-1).^2)+((solw(i,4)./solw(2,4)-1).^2));
% end

Error=abs(((solw(2,1)+solw(2,2))./(solw(2,1)+solw(2,2)))-1)+abs(((solw(3,1)+solw(3,2))./(solw(2,1)+solw(2,2)))-1.01432)+...
    abs(((solw(4,1)+solw(4,2))./(solw(2,1)+solw(2,2)))-0.937635)+abs(((solw(5,1)+solw(5,2))./(solw(2,1)+solw(2,2)))-0.758317)+...
    abs((solw(2,2)./solw(2,2))-1)+abs((solw(3,3)./solw(2,2))-0.828108282)+abs((solw(4,3)./solw(2,2))-0.768559285)+abs((solw(5,3)./solw(2,2))-0.507015385)+...
    abs((solw(2,3)./solw(2,3))-1)+abs((solw(3,3)./solw(2,3))-4.117865)+abs((solw(4,3)./solw(2,3))-7.595804)+abs((solw(5,3)./solw(2,3))-8.9161114);
