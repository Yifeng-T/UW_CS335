%fixed point method:

function x4=fixedpoint(g, a, tol, maxiter);

%set the initial function a and gx
index1=a;
index2=g(a);
x4=[index2];

i=1;%set the initial value of index
while i<=maxiter&&abs(index2-index1)>=tol 
    
    index1=index2; %set the new index
    index2=g(index1);
    x4=[x4,index2];
    
    i=i+1;
    
end
end
