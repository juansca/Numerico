
xx = rand(1, 50);
yy = asin(xx);



# arcsen(x)
subplot(3, 2, 1);
plot(xx, yy, 'r*', 'linewidth', 2)
axis([-1/20, 21/20, -1/8, 13/8]);
grid on;
title('f(x) = arcsen(x)');

# aproximaciones
app_xx = linspace(0, 1);
cc = {};

for n=1:5
    cc{n} = polyfit(xx, yy, n);
    subplot(3, 2, n + 1);
    plot(xx, yy, 'r*', 'linewidth', 2,
         app_xx, polyval(cc{n}, app_xx), 'b', 'linewidth', 2);
    axis([-1/20, 21/20, -1/8, 13/8]);
    grid on;
    t = 'g(x) = ';
    for i = 1:n
        t = sprintf('%s (%.2f)x^%d +', t, cc{n}(i), n + 1 - i);
    end
    t = sprintf('%s (%.2f)', t, cc{n}(n + 1));

    err = norm(polyval(cc{n}, xx) - yy, 2);
    t = sprintf('%s\n Error de aproximación ~ %.5f', t, err);
    title (t);
end
