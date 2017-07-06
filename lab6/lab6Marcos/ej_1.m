function x = soltrinf(A, b)
    [m, n] = size(A);

    if m != n || any(size (b) != [n, 1])
        error(sprintf('Error de dimensiones en los argumentos A = (%d x %d) y b = (%d x d)', m, n, size(b)(1), size(b)(2)));
    elseif any(diag(A) == 0)
        error('Matriz singular')
    end

    x = zeros(n, 1);

    for i=1:n
        x(i) = (b(i) - sum(A(i,1:i-1) .* x(1:i-1)'))/ A(i,i);
    endfor
endfunction

function x = soltrsup(A, b)
    [m, n] = size(A);

    if m != n || any(size (b) != [n, 1])
        error(sprintf('Error de dimensiones en los argumentos A = (%d x %d) y b = (%d x %d)', m, n, size(b)(1), size(b)(2)));
    elseif any(diag(A) == 0)
        error('Matriz singular')
    end

    x = zeros(n, 1);

    for i=n:-1:1
        x(i) = (b(i) - sum(A(i,i+1:n) .* x(i+1:n)'))/ A(i,i);
    end
end
