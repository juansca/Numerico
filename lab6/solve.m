function solve(fun, A, b)
    tol = 2 * eps;
    x = fun(A, b);
    if abs(A*x - b) > tol
        disp('The method did not work for this matrix:')
        disp(A);
    else
        printf('.');
    endif
endfunction
