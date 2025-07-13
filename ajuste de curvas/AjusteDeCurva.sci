// ===
// ===
// ===
// ===
clc(); clear(); clf()
printf("\n**** Ajuste polinomial - MQM - Ver. monolítica *****\n")

// =================================PROBLEMA 11=================================

//X = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
//Y = [0.64, 0.64, 0.64, 1.17, 2.31, 3.33, 5.08, 6.06, 7.05, 7.5, 7.78, 7.83, 7.97, 8.00]
//ordem = 1 //mude conforme necessário :)
//ordem = 2 //mude conforme necessário :)

// =================================PROBLEMA 11=================================

// =================================PROBLEMA 15=================================

//X = [1, 3, 7, 14, 21, 28, 56]
//Y = [6.2, 10.3, 18.7, 25.5, 28.1, 30.2, 32.0]
//ordem = 2 //mude conforme necessário :)
//ordem = 3 //mude conforme necessário :)

// =================================PROBLEMA 15=================================

// =================================PROBLEMA 17=================================

//X = [1, 1.5, 2.0, 2.5, 3, 3.5, 4.0]
//Y = [10.5, 18.0, 24.2, 29.7, 34.0, 37.1, 39.0]
//ordem = 2 //mude conforme necessário :)
//ordem = 3 //mude conforme necessário :)

// =================================PROBLEMA 17=================================

// =================================PROBLEMA 18=================================

X = [1, 2, 3, 4, 5, 6, 7, 8]
Y = [1.2, 2.5, 5.1, 8.9, 13.5, 18.2, 22.0, 24.3]
//ordem = 2 //mude conforme necessário :)
ordem = 3 //mude conforme necessário :)

// =================================PROBLEMA 18=================================
n = length(X)
printf("\n[1] Tabela de dados: \n")
for i = 1:n
	printf("   x = %.6f   y(x) = %.6f\n", X(i), Y(i))
end
// ===
// [2] Construção do sistema normal para MQM
// ===
grau = ordem + 1
A = zeros(grau, grau)
B = zeros(grau, 1)

// Monta a matriz A
for i = 1:grau
	for j = 1:grau
		for k = 1:n
			A(i, j) = A(i, j) + X(k) ^ (i-1 + j-1)
		end
	end
end
printf("\n[2] Matriz do sistema normal (A): \n")
disp(A)

// Monta o vetor B
for i = 1:grau
    for k = 1:n
        B(i) = B(i) + X(k)^(i-1) * Y(k)
    end
end
printf("\n[3] Vetor dos termos independentes (B):\n")
disp(B)

// === Resolução do sistema linear via operador barra invertida
M = A \ B

printf("\n[4] Coeficientes do polinômio de ajuste: \n")
for i = 1:grau
    printf("   a_%d = %.6f\n", i-1, M(i))
end
// ===
// [4] Construção do polinômio ajustado
// ===
Pol_ajuste = poly(M, 'x', 'c')

printf("\n[5] Polinômio de ajuste:")
disp(Pol_ajuste)
// ===
// [5] Cálculo do coeficiente de determinação R² e SSR
// ===
Ybar = mean(Y)
SSR = 0
SST = 0
for i = 1:n
    ajuste = horner(Pol_ajuste, X(i))
    SSR = SSR + (Y(i) - ajuste)^2
    SST = SST + (Y(i) - Ybar)^2
end
R2 = 1 - SSR / SST

printf("\n[6] Soma dos quadrados dos resíduos (SSR): %.6f\n", SSR)
printf("\n[7] Coeficiente de determinação R^2: %.6f\n", R2)
// ===
// [6] Geração do gráfico de ajuste
// ===
xx = linspace(min(X), max(X), 300)
yy = horner(Pol_ajuste, xx)

plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3)
xgrid()
xtitle("Ajuste polinomial por MQM", "x", "y(x)")
legend(["Dados observados", "Curva ajustada"], 2)

printf("\n***** FIM DO AJUSTE POLINOMIAL POR MQM *****\n")
////
