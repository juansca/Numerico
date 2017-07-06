function [x_1, x_2] = buena(a, b, c)
    delta = sqrt(b ^ 2 - 4 * a * c);
    if c == 0
        x_1 = (-b + abs(b)) / (2*a);
        x_2 = (-b - abs(b)) / (2*a);
        return;
    endif
    if sign(b) == 1
        x_1 = (2 * c) / (- b - delta);
        x_2 = (- b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a);
    else
        x_1 = (- b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a);
        x_2 = (2 * c) / (- b + delta);
    end
endfunction

[r,xs] = buena(1, 1000, 1);
