
% Finding the nontrivial root of 
% f(x) = sin(x) - x^2
% using the Simple Fixed-Point Iteration  
syms x
%e = 'Enter the equation please !';
fprintf('Enter the equation =\n');
Fun = input('');
myFunction = function_handle(Fun); %the origin
Fun2 = diff(myFunction(x));
myFunction2 = function_handle(Fun2); %the dervative



fprintf('Enter the initial guess =\n');
x_low = input('')


fprintf('Enter the tolerance  =\n');
tol = input('')

if isempty(tol)
  tol = 0.00001;
end




%x = 1.0     %initial guess
%Es = 0.1    %tolerance
Ea = 1000;  %randomly large relative approximate error
xOld = x_low;   
n = 1;      %iteration counter

arr = zeros(1,2); %saving values
arr2 = zeros(1,2); %counter

while Ea > tol
    xNew = xOld - (myFunction(xOld)/myFunction2(xOld));
    Ea = abs((xNew-xOld)/xNew);
    xOld = xNew;
    arr(n) = xNew;
    arr2(n) = n;
    n = n + 1;
end
plot(arr2,arr);
fprintf('Root is   =\n');
xNew  %the root
disp (arr);
fprintf('Number of iterations   =\n');
disp(n)  %number of iterations