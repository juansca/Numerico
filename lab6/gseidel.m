function [x, k] = gseidel(A, b, e, m)
    n = length(A);
    x_old = zeros(n,1);
    x_new = ones(n,1) * 3;
    k = 0;
    while norm(x_new - x_old, 'inf') > e && k < m
        k += 1;
        x_old = x_new;
        for i = 1:n

            lx = A(i, 1:i-1) * x_new(1:i-1);
            ux = A(i, i+1:n) * x_old(i+1:n);
            x_new(i) = (b(i) - lx - ux ) / A(i,i);
        endfor
        if any(isinf(x_new))
            warning("Gaus-Seidel does not converges for this matrix");
            break;
        endif
    endwhile
    x = x_new;
endfunction
