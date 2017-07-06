function x = sollu(A, b)
    [L, U, P] = lu(A);
    y = soltrinf(L, P*b);
    x = soltrsup(U, y);
endfunction
