run('ej_1.m');
senint = @(yy) arrayfun(@(b) intenumcomp(@cos, 0, b, ceil(10*b + 1), 'trapecio'), yy);

xx = 0:0.5:2*pi;

subplot(2, 1, 1);
plot(xx, sin (xx), 'r*');
title('f(x) = sin(x)');
subplot(2, 1, 2);
plot(xx, senint (xx), 'b*');
title('g(x) ~ \int_0^x cos(t) dt');
