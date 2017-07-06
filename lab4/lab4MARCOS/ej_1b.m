
# y = 3/4 x - 1/2 => x = 4/3 * (y + 1/2)
#                 => x = 4/3 * y  + 2/3

A = 1; B = 10; N = 20;
yy = A .+ (B-A) .* rand(1,N);

#              +-- coef de y^1
#              |
#              |    +-- coef de y^0 (término independiente)
#              |    |
#              v    v

xx = polyval([4/3, 2/3], yy);

# coeficientes del polinomio de grado 1 que minimiza la distancia a los datos
# en el sentido de cuadrados mínimos
c = polyfit(xx, yy, 1);

app_xx = linspace(min(xx) - 1, max(xx) + 1);
app_yy = polyval(c, app_xx);

plot(xx, yy, 'r*', 'linewidth', 2,
     app_xx, app_yy, 'b-');
grid on;

