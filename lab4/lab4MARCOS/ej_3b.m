load ('datos3b.mat');


# y = x / (Ax + B) =>   x/y = (Ax + B)

cc = polyfit(x, x./y, 1);
A = cc(1);
B = cc(2);

plot(x, x./((A .* x) .+ B), 'b-', 'linewidth', 2,
     x, y, 'r.', 'linewidth', 1);
ylim([0, 250]);

# Para ver la recta que mejora aprixima a x/y, descomentar lo siguiente:
# ylim([-1, 1]); plot(x, x./y, x, polyval(cc, x));


legend(sprintf ('f(x) ~ x/((%.4f)x + %.4f)', A, B),'datos3b.mat');

