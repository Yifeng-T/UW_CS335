function [c,p,stdc,stdp]=A4Q1(M, delt)
%generate the stable graph
randn('state', 100);

%define the initial value
sigma=0.20; %volatility
r=0.05; %risk-free rate
T=1.0; %total time T
K=100; %strike price
S0=100; %initial stock price
N=T/delt; %define the total number of N


%define the initial matrix:
S_old=zeros(M,1);
S_new=zeros(M,1);

S_old(1:M,1)=S0; 

for i=1:N %time step loop
    S_new(:,1)=S_old(:,1)+S_old(:,1).*(r*delt+sigma*sqrt(delt)*randn(M,1));
    S_new(:,1)=max(0, S_new(:,1)); %consider the different cases for future
    %stock price
    S_old(:,1)=S_new(:,1); 
end

%the payoff of the option:
payoffcall=max((S_new-K),0);
payoffput=max((K-S_new),0);

%get the value and std of the option
c=exp(-r*T)*(sum(payoffcall))/M;
p=exp(-r*T)*(sum(payoffput))/M;
stdc=std(exp(-r*T)*max((S_new-K),0));
stdp=std(exp(-r*T)*max((K-S_new),0));

end


