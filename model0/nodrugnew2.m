%% cost function
function Error = nodrugnew2(tspan,IC,trial) %cost funtion
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
[~,solw]=ode45(@DEwithout2,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);
for i=2:1:9
Error=sum(((((solw(i,3)+solw(i,1))./(solw(2,3)+solw(2,1)))-1).^2)+((solw(i,3)./solw(2,3)-1).^2)+((solw(i,4)./solw(2,4)-1).^2));
end