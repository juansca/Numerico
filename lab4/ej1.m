load('datos1a.mat');

A = ones(length(xd), 2);

A(1:end, 1) = xd;


a =  A \ yd';


xs = linspace(min(xd), max(xd), length(xd));

poly = polyfit(xd, yd, 1);
pol_ys = polyval(poly, xs);
ys = polyval(a, xs);

plot(xs, ys, 'r;aproximation;', xd, yd, '.b;real;', xs, pol_ys, 'g;polyfit;');
pause();
