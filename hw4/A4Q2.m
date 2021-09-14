function [a]=A4Q2(N)
%define the initial value
sigma=0.3; %volatility
r=0.04; %risk-free rate
T=1.5; %total time length T
K=100; %strike price
S0=100; %initial price of stock
u=0.08; %return
Por=zeros(N,1); %portfolio initial matrix
alpha=zeros(N,1); %define the alpha value

%define the initial matrix for variables:
B=zeros(N,1);
S=zeros(N,1);
V=zeros(N,1);
stock=zeros(N,1);
delt=T/N;
t=zeros(N,1);

S(1)=S0; %define the stock price at t=1
Por(1)=0; %define the portfolio value at t=1

%use the black-shole to calculate the call and put option value:
[call,pv]=blsprice(100,100,0.04,1.5,0.3);
V(1)=call;
[cd,pd]=blsdelta(100,100,0.04,1.5,0.3);
alpha(1)=cd;
B(1)=V(1)-alpha(1)*S(1);
stock(1)=alpha(1)*S(1);

for i=2:N
    %as time goes, the new value of stock prices:
    S(i)=S(i-1)*exp((u-sigma^2/2)*delt+sigma*randn(1,1)*sqrt(delt));
    %the new option value casued by the new prices
    [V(i),pv(i)]=blsprice(S(i),100,0.04,T-(i-2)*delt,0.3);
    [alpha(i),pd(i)]=blsdelta(S(i),100,0.04,T-(i-2)*delt,0.32);
    B(i)=exp(r*delt)*B(i-1)-S(i)*(alpha(i)-alpha(i-1));
    stock(i)=alpha(i)*S(i);
    %the new portfolio value
    Por(i)=-V(i)+alpha(i)*S(i)+B(i);
    t(i)=t(i-1)+delt;
end
%draw the plot:
plot(t,S)
hold on
plot(t,B)
hold on
plot(t,stock)
hold on
plot(t,Por)
hold off
