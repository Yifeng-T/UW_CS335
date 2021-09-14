%DEFINE THE initial value for mean:
mean1=mean(A4Q3(0,1));
mean2=mean(A4Q3(0,0.5));
mean3=mean(A4Q3(0,2));
mean4=mean(A4Q3(85,2));
mean5=mean(A4Q3(85,4));

%define the initial value for std:
std1=std(A4Q3(0,1));
std2=std(A4Q3(0,0.5));
std3=std(A4Q3(0,2));
std4=std(A4Q3(85,2));
std5=std(A4Q3(85,4));

%define the C-var:
r1=A4Q3(0,1);
r2=A4Q3(0,0.5);
r3=A4Q3(0,2);
r4=A4Q3(85,2);
r5=A4Q3(85,4);

v1=quantile(r1,0.05);
v2=quantile(r2,0.05);
v3=quantile(r3,0.05);
v4=quantile(r4,0.05);
v5=quantile(r5,0.05);
cv1=mean(r1(r1<v1));
cv2=mean(r2(r2<v2));
cv3=mean(r3(r3<v3));
cv4=mean(r4(r4<v4));
cv5=mean(r5(r5<v5));

%draw the graph:
T=2;
R0=1/250;
subplot(5,1,1);
histogram(r1,-T:R0:T,'Normalization','pdf');
ylim([0,6]);
subplot(5,1,2);
histogram(r2,-T:R0:T,'Normalization','pdf');
ylim([0,6]);
subplot(5,1,3);
histogram(r3,-T:R0:T,'Normalization','pdf');
ylim([0,6]);
subplot(5,1,4);
histogram(r4,-T:R0:T,'Normalization','pdf');
ylim([0,6]);
subplot(5,1,5);
histogram(r5,-T:R0:T,'Normalization','pdf');
ylim([0,6]);

%Now lets do the CI table:
categ=["0,1";"0,0.5";"0,2";"85,2";"85,4"];
meann=[mean1;mean2;mean3;mean4;mean5];
std=[std1;std2;std3;std4;std5];
variance=[v1;v2;v3;v4;v5];
c_variance=[cv1;cv2;cv3;cv4;cv5];
A4Q3table=table(categ,meann,std,variance,c_variance);

disp(A4Q3table);






