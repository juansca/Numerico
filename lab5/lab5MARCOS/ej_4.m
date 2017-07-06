# funciones a integrar
funciones = {@(x) x .* e.^(-x),
             @(x) x .* sin(x),
             @(x) (1 .+ (x .^ 2)).^(3/2)};

# intervalo de integración
a = 0; b = 1;

# reglas de integración
reglas = {'trapecio', 'simpson'};

# tolerancia de error
tol = 10^(-5);

# intervalos
N = zeros(3, 2);

# ERROR EN TRAPECIO:
# =================

# E_{TC} = -1/12 (1 - 0) h^2 f''(\xi) con xi en [0, 1]

# para la función (a), tenemos que f''(x) = e^(-x) (x - 2)
#             => |f''(\xi)| <= 2
# es decir, el error podría alcanzar su máximo valor si \xi = 0.
# Suponiendo que este es el caso:
#             |E_{TC}| = 1/6 h^2
#             => sqrt(|E_{TC}| 6) = h
# recordando que h = (b-a) / (n - 1)
# entonces:
#           (n-1)h = (b-a)
#           nh - h = (b-a)
#               nh = (b-a + h)
#                n = (b-a + h)/ h
#                    (b-a)/h + 1
N(1, 1) = ceil(1/sqrt(tol*6) + 1);

# para la función (b) f''(x) = 2 cos(x) -x sin(x)
#             => |f''(\xi)| <= 2
# es decir, el error podría alcanzar su máximo valor si \xi = 0.
# es decir, el caso es el mismo que para la función (a)
N(2, 1) = ceil(1/sqrt(tol*6) + 1);

# para la función (c) f''(x) =  (6 x^2 + 3)/sqrt(x^2 + 1)
#             => |f''(\xi)| <= 9/sqrt(2)
# es decir, el error podría alcanzar su máximo valor si \xi = 1.
# Suponiendo que este es el caso:
#             |E_{TC}| = 3/(4·sqrt(2)) h^2
#             => sqrt(|E_{TC}| 4/3 * sqrt(2)) = h
N(3, 1) = ceil(1/sqrt(tol*4/3 * sqrt(2)) + 1);

# dado que la regla de simpson tiene mayor precisión, podemos usar sin riesgo
# la misma cantidad de intervalos.
N(:,2) = N(:,1);

integrales = zeros(3, 2);

for i=1:3
    for j=1:2
        integrales(i, j) = intenumcomp(funciones{i}, a, b, N(i, j), reglas{j});
    end
end


printf('\n');
printf('  =====================\n');
printf('  trapecio    simpson\n');
printf('  =====================\n');
printf('  %.7f   %.7f\n', integrales');
printf('\n');
