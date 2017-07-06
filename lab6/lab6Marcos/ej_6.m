run('ej_5.m');

A = [3 1 1; 2 6 1; 1 1 4]; b = [5; 6; 9];

printf('Ej 6a)\n');
[x, k] = jacobi(A, b, 10^(-11), 1000);
printf('\nJacobi (%d iteraciones)\n', k)
x

gseidel(A, b, 10^(-11), 1000);
[x, k] = gseidel(A, b, 10^(-11), 1000);
printf('\nGauss-Seidel (%d iteraciones)\n', k)
x



A = [5 7 6 5; 7 10 8 7; 6 8 10 9; 5 7 9 10]; b = [23; 32; 33; 31];

printf('Ej 6b)\n');
[x, k] = jacobi(A, b, 10^(-4), 1000);
printf('\nJacobi (%d iteraciones)\n', k)
x

[x, k] = gseidel(A, b, 10^(-4), 1000);
printf('\nGauss-Seidel (%d iteraciones)\n', k)
x
