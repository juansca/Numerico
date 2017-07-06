function w = ilagrange(x, y, z)
    n = length(x);

    num = @(i, z_i) prod(z_i - x(1:n != i));

    den = @(i) prod(x(i) - x(1:n != i));

    li = @(i, z_i) num(i, z_i) / den(i);

    p = @(z_i) sum(arrayfun(@(i) y(i) * li(i, z_i), 1:n));

    w = arrayfun(p, z);
endfunction



f = @(x) 1/x;

x = [1,2,3,4,5];
y = arrayfun(f, 1:5);

zj = @(j) 24/25 + j/25;
zs = arrayfun(@(j) zj(j), 1:101);

p = ilagrange(x, y, zs);
fs = arrayfun(@(x) f(x), zs);

plot(zs, fs, 'r', zs, p, 'b');
pause();
