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

if isempty(tol)
  tol = 0.00001;
end

Ea = 1000;  %randomly large relative approximate error
n = 1;      %iteration counter

arr = zeros(1,2); %saving values
arr2 = zeros(1,2); %counter

while Ea > tol  % make this 0.01 value more small to get more accurate result 
  xRoot = x_low - (((x_up-x_low) * myFunction(x_low))/(myFunction(x_up)-myFunction(x_low))); % calculating root 
  xLowDif = abs(xRoot - x_low);
  xUpDif = abs(xRoot - x_up);
    if xLowDif < xUpDif   % if its closer to x up
        x_up = xRoot ;
    else                        % else its closer to x low
        x_low = xRoot;
    end
  Ea = abs((x_up-x_low)/x_up);
  arr(n) = xRoot;
  arr2(n) = n;
  n = n + 1;
  
end

plot(arr2,arr);
fprintf('Root is   =\n');
disp (xRoot)  % displaying root value
disp (arr);
fprintf('Number of iterations   =\n');
disp(n)   %number of iterations 