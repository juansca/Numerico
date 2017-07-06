n = 3;
b1 = [ones(n, 1); zeros(n, 1)];
b2 = ones(2 * n, 1);

bs = {b1, b2};

I = eye(n);

B = diag(4 * ones(n, 1));
B -= diag(ones(n-1, 1), 1);
B -= diag(ones(n-1, 1),  - 1);

A = [B, -I; -I, B];


printf("\n\nTesting soleg...\n")

tic,
x1 = soleg(A, b1)
toc;
tic,
x2 = soleg(A, b2)
toc;
printf("\n\nTesting sollu...\n")

tic,
x1 = sollu(A, b1)
toc;
tic,
x2 = sollu(A, b2)
toc;
