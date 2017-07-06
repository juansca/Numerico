function [U, y] = egauss(A, b)
    [m, n] = size(A);

    if m != n || any(size (b) != [n, 1])
        error(sprintf('Error de dimensiones en los argumentos A = (%d x %d) y b = (%d x %d)', m, n, size(b)(1), size(b)(2)));
    elseif any(diag(A) == 0)
        error('Matriz singular')
    end

# Forma elemento por elemento (abajo, renglón por renglón)

#    U = A;
#    y = b;
#
#    for k=1:n
#        for i = k + 1:n
#            m = U(k,i) / U(k,k);
#            for j = i + 1:n
#                U(i, j) = U(i, j) - m * U(k, j);
#            end
#            y(i) = y(i) - m * y(k);
#        end
#    end

    # matriz ampliada
    ma = [A b];

    # por cada fila desde la primera hasta la penúltima
    for k=1:n-1
        # para cada una de las filas inferiores
        for i = k+1:n
             # buscar el múltiplo m de la fila k,
             # tal que al restar m veces la fila k de la fila i
             # aparezca un nuevo cero debajo de la diagonal principal
             m = ma(i,k) / ma(k,k);
             ma(i,:) = ma(i,:) - m * ma(k,:);
        end
    end

    # separar la matriz ampliada para generar el resultado tal como se pide
    U = ma(:,1:n);
    y = ma(:,n+1);
end
