function hx = ripf(fun, x0, e, m)
    x = x0;
    for k = 1:m
        x_old = x;
        x = fun(x);
        if abs(x_old - x) < e
            break;
        endif
        if isinf(x)
            printf("No converge\n");
            break
        endif
        hx(k) = x;
    endfor
endfunction


function ret = fun(x)
    ret = 2^x - 2*x

x0s = [-10:0.2:5 ; 5:5:40 ; 40:15:150 ; 150:100:1500]

for x0 = x0s
    hx = ripf(@fun, x0, 1e-5, 1000);
endfor
