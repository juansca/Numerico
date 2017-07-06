function p = horn(coefs, x)
    p = 0;
    for a = coefs
        p = a + p * x;
    endfor
endfunction

p = horn([1,5,3], 2);
