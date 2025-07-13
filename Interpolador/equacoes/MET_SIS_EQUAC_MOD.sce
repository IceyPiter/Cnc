///////////////////////////////////////////////////////////////////////////////
// Interpolação polinomial por sistema linear - Ver. Modularizada
//.............................................................................
clc(); clear(); clf()
printf("\n** Interpolação por sistema de equações - Ver. Modularizada **\n");
//=========================== trabalho 2 parte 1 - 1 ===========================
// [0] Carregamento das funções modularizadas
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Trabalho 2\equacoes\Gauss.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Trabalho 2\equacoes\vander_matrix.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Trabalho 2\equacoes\avaliar_polinomio.sce",-1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\plotar_interpolador2.sce", -1)
//===
// [1] Entrada de dados
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
grau_polinomio = n - 1

printf("\n[1] Tabela de dados:\n")
for i = 1:n
    printf("     x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end


// ====================[2] Montagem de Matriz de vandermonde==================== 
Vander = vander_matrix(X)

printf("\n[2] Matriz de vandermonde:\n")
disp(Vander)


// ====================[3] Resolução do sistema linear via Gauss====================
COEF = Gauss(Vander, Y)

printf("\n[3] COEFICIENTES DO POLINÔMIO:\n")
coef_labels = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5']
for i = 1:n
    mprintf("   %s = %.6f\n", coef_labels(i), COEF(i))
end


// ====================[4] Construção do polinomio interpolador====================
Pol = poly(COEF, 'x', 'c')

printf("\n[4] Polinômio interpolador:\n")
disp(Pol)


// ====================[5] Avaliação do Polinômio nos pontos 2, 4 e 5====================
deff('y = f(x)',   ['y = horner(Pol, x)']) //definição da função para testar o ponto

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
    [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, xi, valor_real)
    printf("\n[5] Valor aproximado: p(%.2f) = %.6f\n", xi, valor_aprox)
    printf("[6] Erro percentual: %.4f%%\n", erro_percentual)
end


// ===
// [6] Gráfico do polinômio interpolador
// ===
plotar_interpolador(X, Y, COEF, pontos)

//
printf("\n***** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES*****\n")
//
