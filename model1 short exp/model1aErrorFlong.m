function Error = model1aErrorFlong(tspan,IC,trial) %cost funtion
p.k1=trial(1); %define the parameter
p.r=trial(2);
p.a1=trial(3);
p.b1=trial(4);
p.c1=trial(5);
p.d1=trial(6);
p.d=trial(7);

p.pi=trial(8);
p.R=trial(9);
p.a2=trial(10);
p.b2=trial(11);
p.c2=trial(12);
p.d2=trial(13);
p.pi1=trial(14);

% disp('hello');
tic
[~,solw]=ode23s(@model1aLongDE,tspan,IC,[],p); % go to use DE model
toc
%t1=t(2);
%t2=t(3);   % solw(3,1) means time 3 variable 1 in solw function
Error=(((solw(3,1)+solw(3,2)+solw(3,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+(((solw(4,1)+solw(4,2)+solw(4,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+...
    (((solw(5,1)+solw(5,2)+solw(5,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+(((solw(6,1)+solw(6,2)+solw(6,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+...
    (((solw(7,1)+solw(7,2)+solw(7,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+(((solw(8,1)+solw(8,2)+solw(8,3))./(solw(2,1)+solw(2,2)+solw(2,3)))-1).^2+... %Long term total mTOR
    ((solw(2,3)./solw(2,3))-1).^2+((solw(3,3)./solw(2,3))-0.828108282).^2+((solw(4,3)./solw(2,3))-0.768559285).^2+((solw(5,3)./solw(2,3))-0.507015385).^2+...
    ((solw(6,3)./solw(2,3))-0.6).^2+((solw(7,3)./solw(2,3))-0.766).^2+((solw(8,3)./solw(2,3))-1).^2+...  %Long term pmTOR
    ((solw(2,4)./solw(2,4))-1).^2+((solw(3,4)./solw(2,4))-4.117865).^2+((solw(4,4)./solw(2,4))-7.595804).^2+((solw(5,4)./solw(2,4))-8.9161114).^2+((solw(6,4)./solw(2,4))-9).^2+((solw(7,4)./solw(2,4))-9).^2+((solw(8,4)./solw(2,4))-9).^2;
