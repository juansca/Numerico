function x = soltrinf(A, b)
    if det(A) == 0
        error ("A es singular")
    endif
    sizeA = size(A);
    n = sizeA(1);
    x = zeros(n, 1);
    for i = 1:n
        x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1)) / A(i, i);
    endfor
endfunction
