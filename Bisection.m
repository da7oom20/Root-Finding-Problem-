%myFunction = @ (x) 5*x^3 - 5*x^2 + 6*x -2 ; % anonymous fucntion to specify our equation

syms x
fprintf('Enter the equation =\n');
Fun = input('');
myFunction = function_handle(Fun);

% initial values

fprintf('Enter the X low =\n');
x_low = input('')

%x_low = 0 ;
fprintf('Enter the X up =\n');
x_up = input('')
%x_up = 1;

if x_low > x_up
    error('MATLAB:incorrectValue',...
        'X upper must be bigger than X lower');
end
if myFunction(x_low)*myFunction(x_up)>0
    error('MATLAB:incorrectValue',...
        'function values of endpoints must differ in sign');
end

fprintf('Enter the tolerance  =\n');
tol = input('')

x_mid = (x_low+x_up)/2; % calculating mid 

arr = zeros(1,2); %saving values
arr2 = zeros(1,2); %counter
n = 1;      %iteration counter
while abs (myFunction(x_mid)) > tol  % make this 0.01 value more small to get more accurate result 
    if myFunction(x_mid) < 0   % if the sign is (-)
        x_low = x_mid ;
    else                        % else , the sign is (+)
        x_up = x_mid;
    end
    
    x_mid = (x_low+x_up)/2;
    arr(n) = x_mid;
    arr2(n) = n;
    n = n + 1;
end
plot(arr2,arr);
fprintf('Root is   =\n');
disp (x_mid)  % displaying root value
disp (arr);
fprintf('Number of iterations   =\n');
disp(n)   %number of iterations 