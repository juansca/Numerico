# Este método soluciona ecuaciones de 2do grado evitando la cancelación
# de dígitos significativos
function [x_1, x_2] = buena(a, b, c)
    # el delta de baskhara
    delta = sqrt(b ^ 2 - 4 * a * c);
    # Si c es cero, no hay problemas de cancelación
    if c == 0
        x_1 = (-b + abs(b)) / (2*a);
        x_2 = (-b - abs(b)) / (2*a);
        return;
    endif
    # Dependiendo del signo de b tendremos que tratar uno u otro término
    # de la ecuación de baskhara
    if sign(b) == 1
        x_1 = (2 * c) / (- b - delta);
        x_2 = (- b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a);
    else
        x_1 = (- b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a);
        x_2 = (2 * c) / (- b + delta);
    end
endfunction

[r,xs] = buena(1, 1000, 1);
