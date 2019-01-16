



fprintf('Welcome in finding root methods!\n');
fprintf('Kindly choose the method you want to apply \n');
fprintf('1- Bisection\n');
fprintf('2- Fixed point iteration\n');
fprintf('3- Newton’s\n');
fprintf('4- False Position\n');
choose = input('');

switch (choose)
  case 1
    Bisection
  case 2
    fixed
  case 3 
    Newton
  case 4
    fals
  otherwise
    fprintf('Wrong choise !!!!!!\n');
    welcome
endswitch
