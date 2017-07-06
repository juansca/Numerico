function [x, k] = jacobi (A, b, e, M)
    [m, n] = size(A);

    if m != n || any(size (b) != [n, 1])
        error(sprintf(strcat('Error de dimensiones en los argumentos ',
                             'A = (%d x %d) y b = (%d x %d)'),
                             m, n, size(b)(1), size(b)(2)));
    end
    k = 0;
    x_prev = zeros(n, 1);
    x = zeros(n, 1);

    do
        k = k + 1;
        x_prev = x;
        for i=1:n
            x(i) = (b(i) - sum(A(i,1:n ~= i) .* x_prev(1:n ~= i)')) / A(i, i);
        endfor
    until (k >= M || norm(x - x_prev, Inf) <= e)
end




function [x, k] = gseidel (A, b, e, M)
    [m, n] = size(A);

    if m != n || any(size (b) != [n, 1])
        error(sprintf(strcat('Error de dimensiones en los argumentos ',
                             'A = (%d x %d) y b = (%d x %d)'),
                             m, n, size(b)(1), size(b)(2)));
    end
    k = 0;
    x_prev = zeros(n, 1);
    x = zeros(n, 1);

    do
        k = k + 1;
        x_prev = x;
        for i=1:n
            x(i) = (b(i) - sum(A(i,1:i-1) .* x(1:i-1)') - sum(A(i,i+1:n) .* x_prev(i+1:n)')) / A(i, i);
        endfor
    until (k >= M || norm(x - x_prev, Inf) <= e)
end
