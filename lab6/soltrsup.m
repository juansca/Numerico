function x = soltrsup(A, b)
    if det(A) == 0
        error ("A es singular")
    endif
    sizeA = size(A);
    n = sizeA(1);
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    endfor

endfunction
