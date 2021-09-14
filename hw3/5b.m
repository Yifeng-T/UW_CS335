%define the initial value:
sigma=0.3; %define the volatility
r=0.04; %define the risk free rate
T=2.0; %define the time to expiry
K=100; %define the strike price
s0=100; %define the current asset price s0
out_n=30*10^6; %define the shares outstanding n
warr_m=7*10^6; %define the warrants outstanding m
%From the question, we found both the R and W are vectors:
%black-s sensitivity analysis:
[call, put]=blsdelta(s0,K,r,T,sigma);
R=zeros(1, K);
%%
%
%
W=zeros(1, K);
for i=1:10^2
    W(i+1)= W(i)-((out_n/(warr_m+out_n))*blsprice(s0+(warr_m/out_n)*W(i),K,r,T,sigma)-W
(i))/(out_n/(out_n+warr_m)*(warr_m/out_n)*call-1);
    R(i)=W(i)-out_n/(out_n+warr_m)*blsprice(s0+warr_m/out_n*W(i),K,r,T,sigma);
    if 10^(-8)>abs(W(i+1)-W(i)) %check the error range
break end
end
whole_column=(0:1:i-1)';
r_colum=R(1,1:i)';
w_colum=W(1,1:i)';
%build the table:
x=table(whole_column, w_colum, r_colum);
display(x);