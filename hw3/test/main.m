%
% This MATLAB script computes a root of the equation: 
%
% x^2 - 3 = 0 in range of: [0.5, 3.5] 
%
% using one of the root finding methods. It outputs a list of approximate
% solutions and their correcponding errors. 
f=inline('x^2-3');
fprime=inline('2*x'); %fprime=f'

g=inline('x-(x^2-3)*(3^(0.5)/4)');
%the coefficient of (x^2-3) should in interval (0, 3^(0.5)/4);

tol=1e-12; %error
maxiter=100; %total iteractionn
a=0.5;
b=3.5;
x0=0.5;%initial value

%method option:
%Prompt the user for a method.
%
method = input('1: bisection, 2: secant, 3: newton, 4 fixed point\nWhich method? ' );
switch method 
  case 1,
    x = bisection(f,a,b,tol,maxiter); %using bisection
  case 2,
    x = secant(f,a,b,tol,maxiter); %using secant
  case 3,
    x = newton(f,fprime,a,tol,maxiter); %using newton
  case 4,
    x = fixedpoint(g,a,tol,maxiter); %using fixpoint
end;
%
% Output results in a table.
%
% Note: I used 1.6 for the power in the heading of one of the ratios, but % it should really be (1+sqrt(5))/2 in the ratio calculation.
%
n = length(x);
e(1) = abs(x(1) - sqrt(3));
fprintf('\nIteration         x_k             e_k      e_k/e_{k-1}   e_k/e_{k-1}^1.6   e_k/e_{k-1}^2\n');
fprintf('%5d %21.14f %12.4e\n',1,x(1),e(1));

for k = 2:n,

%
  e(k) = abs(x(k) - sqrt(3)); 
% You compute these:
%
  ratio1 = e(k)/e(k-1);
  ratio2 = e(k)/e(k-1)^((1+sqrt(5))/2);
  ratio3 = e(k)/e(k-1)^2;
%
  fprintf('%5d %21.14f %12.4e %13.4e %14.4e %16.4e\n',k,x(k),e(k),ratio1,ratio2,ratio3);

end;