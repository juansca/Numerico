function S = intenumcomp(fun, a, b, N, regla)
    switch  regla
        case 'trapecio'
            printf("Se estimará con la regla del trapecio\n");
            S = trapecio(fun, a, b, N);
        case 'pm'
            printf("Se estimará con la regla del punto medio\n");
            S = pm(fun, a, b, N);
        case 'simpson'
            printf("Se estimará con la regla de Simpson\n");
            S = simpson(fun, a, b, N);
        otherwise
            error ('so un gil');
        endswitch
endfunction


function S = trapecio(fun, a, b, N)
    h = (b - a) / N;
    xs = linspace(a, b, N + 1);
    fa = fun(xs(1));
    fb = fun(xs(end));
    xs = xs(2:end-1);
    mid = 2 * sum(arrayfun(@(x) fun(x), xs));

    S = (h/2) * (fa + mid + fb);
endfunction

function S = pm(fun, a, b, N)
    h = (b - a) / N;
    xs = linspace(a, b, N + 1);
    xs += h / 2;
    xs = xs(1:end-1);
    S = h * sum(arrayfun(fun, xs));
endfunction

function S = simpson(fun, a, b, N)
    h = (b - a) / N;
    xs = linspace(a, b, N + 1);
    fa = fun(xs(1));
    fb = fun(xs(end));
    xs = xs(2:end-1);

    par_xs = xs(2:2:end);
    impar_xs = xs(1:2:end);

    par = 2 * sum(arrayfun(@(x) fun(x), par_xs));

    impar = 4 * sum(arrayfun(@(x) fun(x), impar_xs));

    S = (h/3) * (fa + par + impar + fb);
endfunction
