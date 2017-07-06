function y = senint(x)
    fun = @(x) cos(x);
    estimator = @(i) intenumcomp(fun, 0, i, max(1, ceil(i*10)), 'trapecio');
    y = arrayfun(@(i) estimator(i) , x);
endfunction

xs = 0:0.5:2*pi;
ys = senint(xs);

sen = sin(xs);

plot(xs, sen, "r;sin;", xs, ys, "b;trapecio;");
pause();
