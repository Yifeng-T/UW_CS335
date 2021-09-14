%this is the helper function for main function:
function [rhe]=A4Q2i(N)
%define the initial value; nearlly same as the previous code:
sigma=0.3;
r=0.04;
T=1.5;
K=100;
S0=100;
u=0.08;
%define the initial matrix for variables:
Por=zeros(N,1);
alpha=zeros(N,1);
B=zeros(N,1);
S=zeros(N,1);
V=zeros(N,1);
stock=zeros(N,1);
delt=T/N;
t=zeros(N,1);

S(1)=S0;
Por(1)=0;%initial portfolio value
[call,pv]=blsprice(100,100,0.04,1.5,0.3);
V(1)=call;%vector fro call options value
[cd,pd]=blsdelta(100,100,0.04,1.5,0.3);
alpha(1)=cd;
B(1)=V(1)-alpha(1)*S(1);
stock(1)=alpha(1)*S(1);

for i=2:N
    %the change of stock price
    S(i)=S(i-1)*exp((u-sigma^2/2)*delt+sigma*randn(1,1)*sqrt(delt));
    %the change of option value:
    [V(i),pv(i)]=blsprice(S(i),100,0.04,T-(i-2)*delt,0.3);
    [alpha(i),pd(i)]=blsdelta(S(i),100,0.04,T-(i-2)*delt,0.3);
    %change of bank account
    B(i)=exp(r*delt)*B(i-1)-S(i)*(alpha(i)-alpha(i-1));
    stock(i)=alpha(i)*S(i);
    %change of portfolio
    Por(i)=-V(i)+alpha(i)*S(i)+B(i);
    t(i)=t(i-1)+delt;
end
    rhe=exp(-r*T)*Por(end)/V(1);
end
