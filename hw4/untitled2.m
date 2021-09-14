%define the simulations and timesteps:
M=[1000,2000,4000,8000,16000,32000,64000];
delt=[5/250, 2.5/250, 1/250];

for i=1:length(delt)
    for j=1:length(M)
        [c(j,i),p(j,i)]=A4Q1(M(j),delt(i));
    end
end

[blsc,blsp]=blsprice(100,100,0.05,1.00,0.2);
%---------------------------------------------
%draw the graph for delta=5/250
%call option:
subplot(3,2,1)
plot(M,blsc*ones(size(M)));
title('EuCall with t=5/250');
hold on;
plot(M,c(:,1));
hold off;
%put option:
subplot(3,2,2)
plot(M,blsp*ones(size(M)));
title('EuPut with t=5/250');
hold on;
plot(M,p(:,1));
hold off;

%--------------------------------------------
%draw the graph for delta=2.5/250
%call option:
subplot(3,2,3)
plot(M,blsc*ones(size(M)));
title('EuCall with t=2.5/250');
hold on;
plot(M,c(:,2));
hold off;
%put option:
subplot(3,2,4)
plot(M,blsp*ones(size(M)));
title('EuPut with t=2.5/250');
hold on;
plot(M,p(:,2));
hold off;

%-----------------------------------------------
%draw the graph for delta=1/250
%call option:
subplot(3,2,5)
plot(M,blsc*ones(size(M)));
title('EuCall with t=1/250');
hold on;
plot(M,c(:,3));
hold off;
%put option:
subplot(3,2,6)
plot(M,blsp*ones(size(M)));
title('EuPut with t=1/250');
hold on;
plot(M,p(:,3));
hold off;

