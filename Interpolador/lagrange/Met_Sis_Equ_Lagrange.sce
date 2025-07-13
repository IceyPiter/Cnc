///
/// interploação polinomial por lagrange ver. modularizada
//
clc(); clear(); clf();
printf("\n** Interpolação pelo método de lagrange - Ver. Modularizada ** \n")

exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Trabalho 2\lagrange\lagrange_poly.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Trabalho 2\lagrange\avaliar_polinomio.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\plotar_interpolador2.sce", -1)
//===
//[1] entrada de variáveis
// ===
// ==================================PROBLEMA 1==================================
//X = [0, 1, 3, 6]
//Y = [0, 95, 260, 510]
// ==================================PROBLEMA 1==================================

// ==================================PROBLEMA 4==================================
//X = [100, 200, 400, 800]
//Y = [30.5, 45, 70.2, 120]
// ==================================PROBLEMA 4==================================

// ==================================PROBLEMA 10==================================
X = [0, 10, 20, 40]
Y = [22, 28, 31, 30]
// ==================================PROBLEMA 10==================================

n = length(X)
grau_polinomio = n-1

printf("\n[1] Tabela de dados:\n")
for i = 1:n
    printf("  x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end
// ===
// [2] cálculo do polnimomio de lagrange
// ===
[PolLagrange, CoefLagrange] = lagrange_poly(X, Y)

printf("\n[2] Polinômios de base de lagrange:\n")
for i = 1:n
    pol_str = pol2str(CoefLagrange(i))
    printf("  L_%d(x) = %s\n", i-1, pol_str)
end

printf("\n[3] Polinômio interpolador por lagrange\n")
disp(PolLagrange)
// ===
// [3] Avaliiação do polinomio em umponto especíico
// ===
deff('y = f(x)',   ['y = horner(PolLagrange, x)']) //definição da função para testar o ponto

// ==================================PROBLEMA 1==================================
//pontos = [2.0, 4.0, 5.0]
// ==================================PROBLEMA 1==================================


// ==================================PROBLEMA 4==================================
//pontos = [300, 600]
// ==================================PROBLEMA 4==================================

// ==================================PROBLEMA 10==================================
pontos = [15, 30]
// ==================================PROBLEMA 10==================================

for k=1:length(pontos)
    xi = pontos(k)
    valor_real = f(xi)
    [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, xi, valor_real)
    printf("\n[4] Valor aproximado: p(%.2f) = %.6f\n", xi, valor_aprox)
    printf("[5] Erro percentual: %.4f%%\n", erro_percentual)
end

Xint = [2, 4, 5]
// ===
// [4] Gráfico do polinomio interpolador
// ===
plotar_interpolador(X, Y, PolLagrange, pontos)

//
printf("\n********** Fim de interpolação por lagrange **********\n")
///////////////////////////////////////////////////////////////////////////////
