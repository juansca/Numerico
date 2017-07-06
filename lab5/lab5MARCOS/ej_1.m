
function S = intenumcomp(f, a, b, N, regla)

    switch regla
        case {'pm'}
            x = linspace(a, b, max(2, N));
            h = x(2) - x(1);
            S = h * sum(arrayfun (@(i) f (1/2 * (x(i) + x(i-1))), 2:length(x)));
        case {'trapecio'}
            x = linspace(a, b, max(2, N));
            h = x(2) - x(1);
            y = f(x);
            n = length(y);
            S = h/2 * (y(1) + 2 * sum(y(2:n-1)) +  y(n));
        case {'simpson'}
            # para un subintervalo necesito tres puntos,
            # para dos subintervalos necesito cinco puntos,
            # para tres subintervalos necesito siete puntos,
            # ...
            x = linspace(a, b, N * 2 + 1);
            h = x(2) - x(1);
            y = f(x);
            n = length(y);
            S = h/3 * (y(1) + 4 * sum(y(2:2:n-1)) + 2 * sum(y(3:2:n-1)) + y(n));
        otherwise
            error('Regla desconocida');
    endswitch
end
