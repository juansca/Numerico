# Algortimo de Newton para encontrar raíces de funciones
function [hx, hf] = rnewton(fun, x0, e, m)
    x = x0;
    [fx, fdx] = fun(x);

    for k = 1:m
        old_x = x;
        x = old_x - (fx / fdx);

        if abs(x - old_x) / abs(x) < e || abs(fx) < e
            break;
        endif

        [fx, fdx] = fun(x);
        hf(k) = fx; hx(k) = x;
    endfor
endfunction


function [fx, fdx] = fun(x)
    a = 100;
    fx = x^3 - a;
    fdx = 3 * x^2;
endfunction

e = 1e-6;

[hx, hf] = rnewton(@fun, 2, e, 1000);

xs = linspace(0, 20, 200);

ys = arrayfun(@fun, xs);
plot(xs, ys, 'b', hx, hf, '.r');
pause();
