function [hx, hf] = bisection(fun, I, e, m)
    # Simplemente renombramos los parámetros para mejor manipulación y
    # entendimiento
    a = I(1);
    b = I(2);
    niter = m;

    fa = fun(a);
    fb = fun(b);
    # Longitud del intervalo inicial
    len = b - a;
    # Haremos a lo sumo niter (m) iteraciones
    for k = 1:niter
        # En cada iteración, la longitud disminuye a la mitad
        len = len / 2;

        # 'a + len' representa el punto medio
        # Guardamos en ambos historiales los valores
        hx(k) = a + len;
        hf(k) = fun(hx(k));
        # Si el valor es suficienmente cercano a la raíz, paramos
        if abs(hf(k)) < e
            break;
        endif
        # Si f(a) * f(c) > 0 entonces nos movemos al "subintervalo derecho"
        if sign(fa) == sign(hf(k))
            fa = hf(k);
            a = hx(k);
        endif
    endfor
endfunction


my_tan = @(x) tan(x) - 2*x;
a1 = 0.8;
b1 = 1.4;
error = 1e-5
niter = 100
[hx, hf] = bisection(my_tan, [a1, b1], error, niter);
xs = linspace(a1, b1, 1000);
plot(xs, my_tan(xs), 'b', hx, hf, '.r');
pause();


my_root = @(x) x^2 - 3;
a2 = 0;
b2 = 2;
error = 1e-5
niter = 100
[hx, hf] = bisection(my_root, [a2, b2], error, niter);
xs = linspace(a2, b2, 1000);
roots = arrayfun(my_root, xs)
plot(xs, roots, 'b', hx, hf, '.r');
pause();
