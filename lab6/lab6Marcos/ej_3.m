run('ej_1.m');
function x = sollu (A, b)
    [L, U, P] = lu(A);

    # las matrices devueltas por esta función cumplen que
    # L*U = P*A

    # Además
    # Ax = b  =>  PAx = Pb

    # Notar que si tuviera y tal que Ly = Pb, entonces
    # todo se resumiría a resolver Ux=y, ya que
    # PAx = LUx = L(Ux) = Ly = Pb


    y = soltrinf(L, P*(b));
    x = soltrsup(U, y);
end
