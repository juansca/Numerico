x_coef = [3/4, - 0.5]; # f = @(x) (3/4) * x - 0.5

y_coef = [4/3, 2/3];


xs = linspace(0, 10, 20);
ys = randn(1, 20) + polyval(x_coef, xs);


aprox_xs = linspace(min(xs), max(xs), length(xs));

coef_pol = polyfit(xs, ys, 1);
pol_ys = polyval(coef_pol, aprox_xs);

true_func = polyval(x_coef, aprox_xs);

plot(xs, ys, '.b;data;', aprox_xs, pol_ys, 'g;polyfit;', aprox_xs, true_func, 'r;true_func;');
pause();
