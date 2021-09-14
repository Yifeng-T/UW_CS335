%newton
function x3=newton(f, fprime, a, tol, maxiter)
i=1; %set the interaction index
%define the Newton's recursion formuala:
x1=a-f(a)/fprime(a);

%set the two boundary points:
index1=a;
index2=x1;

%give value to x3
x3=[index2];
index3=index2-index1;

while abs(index3)>=tol && i<=maxiter %iteraction
    index1=index2;
    %do the recursion
    index2=index1-f(index1)/fprime(index1);
    x3=[x3,index2];
    index3=index2-index1;
    i=i+1;
    
end
end
