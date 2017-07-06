load('datos1a.mat');

# xd y yd están disponibles


m = length (xd);
sum_xd = sum(xd);
sum_yd = sum(yd);
sum_sqxd = sum(xd .^ 2);
sum_xdyd = sum(xd .* yd);

denom = m * sum_sqxd - sum_xd ^ 2;

a0 = (sum_sqxd * sum_yd - sum_xdyd * sum_xd) / denom;
a1 = (m * sum_xdyd - sum_xd * sum_yd) / denom;

xx = linspace(min (xd), max (xd), 100);
plot(xd, yd, 'ro', 'linewidth', 2,
     xx, a0 + (a1 .* xx), 'b-');

title('Ajuste lineal por mínimos cuadrados');
grid on;
legend('Datos', 'Aproximación lineal', 'location', 'northwest');
