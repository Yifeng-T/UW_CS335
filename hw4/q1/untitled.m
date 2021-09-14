%define the simulations and timesteps:
M=[1000;2000;4000;8000;16000;32000;64000];
delt=[5/250, 2.5/250, 1/250];

%compute the range for call & put options:
%call option define the initial matrix
lowcal=ones(7,1);
upcal=ones(7,1);

%put:
lowput=ones(7,1);
upput=ones(7,1);

for i=1:7
    [c(i,3),p(i,3),stdc(i,3),stdp(i,3)]=A4Q1(M(i),delt(3));
    %the formula of the CI: MIU+/- quantile*std
    lowcal(i)=c(i,3)-1.96*stdc(i,3)/sqrt(M(i));
    upcal(i)=c(i,3)+1.96*stdc(i,3)/sqrt(M(i));
    lowput(i)=p(i,3)-1.96*stdp(i,3)/sqrt(M(i));
    upput(i)=p(i,3)+1.96*stdp(i,3)/sqrt(M(i));
end

%calculate the CI for call option:
CIcall=table(M,c(:,3),lowcal,upcal);
disp(CIcall)

%calculate the CI for put option:
CIput=table(M,p(:,3),lowput,upput);
disp(CIput)




