%the bisection function:
function root_bis= bisection(f,a,b,tol,maxiter)
%This function computes a root of f in the interval [a, b]

root_bis=[];
while abs(b-a)>tol
    mean=(a+b)/2%the interval of b is too large, change the interval
    root_bis=[root_bis, mean];
    %add the new approximate root in the array;
    
    if length(root_bis)==maxiter
        break
    elseif f(a)*f(mean)<=0
            a=a;
            b=mean;%now the new interval is a~mean
    else
        a=mean;
        b=b;
       end
end
    if length(root_bis)<maxiter
        x=(a+b)/2
        root_bis=[root_bis, x];
    end
end

      



