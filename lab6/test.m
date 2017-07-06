##########################################
printf("Testing soltrinf...\n")
for i = 1:1000
    A = randn(3);
    Ainf = tril(A);
    b = randn(3, 1);

    if det(Ainf) == 0
        continue
    endif

    solve(@soltrinf, Ainf, b);
end

##########################################
printf("\n\nTesting soltrsup...\n")
for i = 1:1000
    A = randn(3);
    Asup = triu(A);
    b = randn(3, 1);

    if det(Asup) == 0
        continue
    endif

    solve(@soltrsup, Asup, b);
end

##########################################
printf("\n\nTesting soleg...\n")

A = [2 -2  1
     1  1  3
     0  4  1];

b = [-1
      6
      9];


x = soleg(A, b)

##########################################

printf("\n\nTesting sollu...\n")

x = sollu(A, b)
