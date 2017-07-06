function w = inewton(x, y, z)
    n = length(x);
    c = y;

    for j = 1:n
        for i = j+1:n
            c(i) = (c(i) - c(j)) / (x(i) - x(j));
        end
    end

    inter = @(k, z_k) prod(arrayfun(@(i) z_k - x(i), 1:k-1));

    p = @(z_k) sum(arrayfun(@(k) c(k) * inter(k, z_k), 1:n));

    w = arrayfun(p, z);

endfunction



f = @(x) 1/x;

x = [1,2,3,4,5];
y = arrayfun(f, 1:5);

zj = @(j) 24/25 + j/25;
zs = arrayfun(@(j) zj(j), 1:101);

pnewton = inewton(x, y, zs);
plag = ilagrange(x, y, zs);
fs = arrayfun(@(x) f(x), zs);

plot(x, y, '.r;puntos;', zs, fs, 'k;funcion;', zs, pnewton, 'm;newton;', zs, plag, 'g;lagrange;');
pause();
