%the bisection function:
function x1= bisection(f,a,b,tol,maxiter)
%This function computes a root of f in the interval [a, b]

x1=[];%define the new matrix with void value
while abs(b-a)>=tol
    mean=(a+b)/2%the interval of b is too large, change the interval
    x1=[x1, mean];
    %add the new approximate root in the array;
    
    if length(x1)==maxiter
        break
    elseif f(a)*f(mean)<=0
            a=a;
            b=mean;%now the new interval is a~mean left interval
    else
        a=mean;
        b=b; %now using the right half interval
    end
end
    
end