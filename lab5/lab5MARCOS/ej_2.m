run('ej_1.m');

# función a integrar
f = @(x) e.^(-x);

# limites de integración
a = 0;
b = 1;

# valor exacto de la integral entre 0 y 1 de e^(-x) dx
int = (e - 1) / e;

# reglas a usar
reglas = {'pm', 'trapecio', 'simpson'};

# cantidad de intervalos para integrar
N = [4, 10, 20];

# matriz para guardar los errores
errores = zeros(3);

printf('\nError absoluto de integración numérica\n\n');
printf('   integral entre 0 y 1 de e^(-x)dx\n\n');

printf('  =================================\n');
printf('   N | %s', list_in_columns(reglas));
printf('  =================================\n');
for i=1:3
    for j=1:3
        errores(i, j) = abs (int - intenumcomp (f, a, b, N(i), reglas{j}));
    end
    printf('%4d | %f  %f  %f\n', N(i), errores(i,:));
end



