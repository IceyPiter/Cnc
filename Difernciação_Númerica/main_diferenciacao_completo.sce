// ===
// Script principal: main_diferenciacao_completo.sce
// ===
clear ;clc;
printf("\n///////////////////////////////////////////////////")
printf("\n//////Diferenciação numérica - módulo completo //////")
printf("\n///////////////////////////////////////////////////")
// ===
// Carregamento das funções modularizadas
// ===
exec("01-progressiva_1a_ordem.sce", -1)
exec("02-regressiva-1a_ordem.sce", -1)
exec("03-centrada_2a_ordem_1aderv.sce", -1)
exec("04-centrada_2a_ordem_2aderv.sce", -1)
exec("05-lagrange_1o_caso.sce", -1)
exec("06-lagrange_2o_caso.sce", -1)
exec("07-lagrange_3o_caso.sce", -1)
exec("08-imprimir_erro.sce", -1)
exec("09-erro_truncamento.sce", -1)
// ===
// Entrada dos dados
// ===

// =====================================================================
// ===
// Entrada dos dados (Problema 1)
// ===
/*X = [1.6, 1.8, 2.0, 2.2, 2.4];
Y = [3.244909, 3.583519, 3.953032, 4.356755, 4.798624];
k = 3;  // índice onde X(k) = 2.0

// Derivadas analíticas de D(t) = sqrt(t^3 + 9)
t0 = X(k);
derivada_1a_exata = 3*t0^2 / (2 * sqrt(t0^3 + 9));  
derivada_2a_exata = 3*t0*(t0^3 + 36) / (4 * (t0^3 + 9)^(3/2));  
derivada_3a_exata = (-6*t0^6 - 1080*t0^3 + 3888) / (16 * (t0^3 + 9)^(5/2));  
derivada_4a_exata = (45*t0^8 + 3240*t0^5 - 3888*t0^2 - 31104) / (32 * (t0^3 + 9)^(7/2));  */
// =====================================================================

// =====================================================================
// ===
// Entrada dos dados (Problema 4)
// ===
X = [1.6, 1.8, 2.0, 2.2, 2.4];
Y = [0.955512, 1.029619, 1.098612, 1.163151, 1.223775];
k = 3;  // índice onde X(k) = 2.0

// Derivadas analíticas de s(t) = ln(t+1)
t0 = X(k);
derivada_1a_exata = 1 / (t0 + 1);
derivada_2a_exata = -1 / (t0 + 1)^2;
derivada_3a_exata =  2 / (t0 + 1)^3;
derivada_4a_exata = -6 / (t0 + 1)^4;
// =====================================================================

// =====================================================================
// ===
// Entrada dos dados (Problema 6)
// ===
/*X = [260, 280, 300, 320, 340];
Y = [34.743087, 38.962293, 43.472382, 48.312596, 53.523059];
k = 3;  // índice onde X(k) = 300

// Derivadas analíticas de T(n) = 0.00048 * n^2
n0 = X(k);
derivada_1a_exata = 0.00096 * n0;  // T'(n)
derivada_2a_exata = 0.00096;       // T''(n)
derivada_3a_exata = 0;             // T'''(n)
derivada_4a_exata = 0;             // T⁽⁴⁾(n)*/
// =====================================================================

// =====================================================================
// ===
// Entrada dos dados (Problema 3)
// ===
/*X = [4.6, 4.8, 5.0, 5.2, 5.4]
Y = [35.777857, 38.285845, 41.0, 43.967944, 47.240617]
k = find(X==5) // índice do ponto a ser avaliado

// Derivadas analíticas de T(n) = 0.00048 * n^2
x=X(k) //x == ponto a ser avaliado
derivada_1a_exata = 2*x + 5*cos(x)
derivada_2a_exata = 2 - 5*sin(x)
derivada_3a_exata = -5*cos(x)*/
//derivada_4a_exata =(x+4)*exp(x)
// =====================================================================

// ===
// Execução dos métodos
// ===
printf("\n>>> Progressiva de 1ª ordem:")
Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n>>> Regressiva de 1ª Ordem:")
Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n>>> Centrada de 2ª Ordem (1ª derivada):")
Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)

printf("\n>>> Centrada de 2ª Ordem (2ª derivada):")
Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)

printf("\n>>> Lagrange - 1º Caso:")
Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)

printf("\n>>> Lagrange - 2º Caso:")
Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)

printf("\n>>> Lagrange - 3º Caso:")
Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)

printf("\n/////////////// FIM DIFERENCIAÇÃO NUMÉRICA ///////////////\n")
