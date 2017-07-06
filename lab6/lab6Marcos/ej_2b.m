run('ej_1.m');  # define soltrsup
run('ej_2a.m'); # define egauss

function x = soleg (A, b)
    [U, y] = egauss(A, b);
    x = soltrsup(U, y);
end
