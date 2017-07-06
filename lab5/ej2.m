real_value = 1 - exp(-1);

f = @(x) exp(-x);
inters = [4,10,20];

for N = inters
    rule = 'trapecio';
    s = intenumcomp(f, 0, 1, N, rule);
    error = abs(s - real_value);
    printf("N = %d Error %f \n\n", N, error);
endfor

pause();

for N = inters
    rule = 'pm';
    s = intenumcomp(f, 0, 1, N, rule);
    error = abs(s - real_value);
    printf("N = %d Error %f \n\n", N, error);
endfor

pause();

for N = inters
    rule = 'simpson';
    s = intenumcomp(f, 0, 1, N, rule);
    error = abs(s - real_value);
    printf("N = %d Error %f \n\n", N, error);
endfor
