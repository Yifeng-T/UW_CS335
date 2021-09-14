%secant
function x2=secant(f, a, b, tol, maxiter)

index1=a; %defined the boundary point a
index2=b; %definedn the boundary point b

x2=[]; %define the initial matrix with void value

i=1; %set the initial value
while i<=maxiter&&tol<=abs(index2-index1)  
    %when not exceed the total iteration value and 
    %the new range within the interval, do the loop 
    
    %define the 3rd indicatior->delta_x
    indexn=index2-index1;
    %define the 4th indicatior->delta_y
    indexd=f(index2)-f(index1);
    %find the new narror interval
    index1=index2;
    index2=index1-f(index1)*(indexn/indexd);
    x2(i)=index2;
    i=i+1;
end
end

