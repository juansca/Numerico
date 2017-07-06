function [U, y] = egauss(A,b)
    n = length(A);

    ma = [A b];
    for k = 1:n
        for i = k+1:n
            ma(i, k) /= ma(k, k);
            ma(i, k+1:end) -= ma(i, k) * ma(k, k+1:end);
        endfor
    endfor
    U = triu(ma(:, 1:n));
    y = ma(:, n+1);
endfunction
