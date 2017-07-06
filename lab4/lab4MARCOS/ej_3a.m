load ('datos3a.mat');

# y = Cx^A => log(y) = log(Cx^A)
#             log(y) = log(C) + log(x^A)
#             log(y) = log(C) + A * log(x)

cc = polyfit(log(x), log(y), 1);
C = e^cc(2); A = cc(1);

plot(x, C.*(x.^A), 'b-', 'linewidth', 7,
     x, y, 'r.', 'linewidth', 1);

legend(sprintf ('f(x) ~ %.4fx^{%.4f}', C, A),'datos3a.mat');

