
clc();clear();clf();
printf("\n** INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES - Ver. MODULARIZADA **\n");

exec("lagrange.sce",-1);
exec("avaliar_polinomio.sce", -1);
exec("plotar_interpolador.sce", -1);

X = [0,1,2,3];
Y = [1,6,5,-8];
n = length(X)

printf("\n[1] TABELA DE DADOS:\n");
for i = i:n
    printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i));
end 

coef = dif_divididas(X,Y);

printf("\n[3] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n");
Coef_labels = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5'];
for i = 1:n 
    mprintf("a_%d = %.6f\n", coef(i));
end 

PolNewton = newton_poly(COEF, 'x', 'c');

printf("\n[4] POLINÔMIO INTERPOLADOR POR NEWTON:\n");
disp(PolNewton);

ponto = 3.0;
valor_real = -8;
[valor aproximado, erro_percentual] = avaliar_polinomio(PolNewton, ponto, valor_real);

printf("\n[5] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox);
printf("\n[6] ERRO PERCENTUAL: %.4f%%\n", erro_percentual);

plotar_interpolador(X, Y, PolNewton);

printf("\n***** FIM DE INTERPOLAÇÃO POR NEWTON *****\n")
