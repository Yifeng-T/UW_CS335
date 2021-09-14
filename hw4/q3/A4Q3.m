function X=A4Q3(F,M)
%DEFINE the initial values:
sigma=0.3;
T=2;
u=0.1;
P0=100;
r=0.05;
R0=1/250;
B=100;
alpha=0;
S0=100;
simulation=8*10^4;
N=T/R0;

%define the initial vector for stock value:
s_old=zeros(simulation,1);
s_new=zeros(simulation,1);
s_old(1:8*10^4,1)=S0;

%set the value for bank account:
b_old=zeros(simulation,1);
b_new=zeros(simulation,1);
b_old(1:8*10^4,1)=B;

%set the value for portfolio:
p_old=zeros(simulation,1);
p_new=zeros(simulation,1);
p_old(1:8*10^4,1)=P0;

%set the value for asset:
a_old=zeros(simulation,1);
a_new=zeros(simulation,1);
a_old(1:simulation,1)=alpha;

%when the time=0;
X=zeros(simulation,1);

%consider as the time goes->
for i=1:N %where N=T/R0
    %the change of stock price:
    s_new(:,1)=s_old.*exp((u-sigma^2/2)*X+sigma*randn(simulation,1)*sqrt(R0));
    s_new(:,1)=max(s_new(:,1),0);
    %the change of bank account:
    a_new(:,1)=M*(max(0,b_old(:,1).*exp(r*R0)+a_old(:,1).*s_new(:,1)-F))./s_new(:,1);
    b_new(:,1)=b_old(:,1).*exp(r*R0)-(a_new(:,1)-a_old(:,1)).*s_new(:,1);
    %the change of portfolio:
    p_new(:,1)=b_new(:,1)+a_new(:,1).*s_new(:,1);
    s_old(:,1)=s_new(:,1);
    a_old(:,1)=a_new(:,1);
    b_old(:,1)=b_new(:,1);
end
X(:,1)=log(p_new(:,1)./P0);
end





