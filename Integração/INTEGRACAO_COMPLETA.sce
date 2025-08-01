clear();clc();
exec("C:\Users\Pedro.Michalski\Downloads\Integração\01-trapezio_dados.sce", -1)
exec("C:\Users\Pedro.Michalski\Downloads\Integração\02-simpson_1_3_dados.sce", -1)
exec("C:\Users\Pedro.Michalski\Downloads\Integração\03-simpson_3_8_dados.sce", -1)
exec("C:\Users\Pedro.Michalski\Downloads\Integração\04-trapezio_funcao.sce", -1)

//Problema 5, não solução analitica com funções elementares, resolvido a integral exata com o mathematica
X = [0, 1, 2, 3, 4, 5, 6]
Y = [1, 0.44, -0.23, -0.47, -0.24, 0.13, 0.27]
integral_exata = 0.0557713

printf("\n>>> Método do Trapézio Generalizado (dados tabulados):");
Trapezio_Dados(X, Y, integral_exata);

printf("\n>>> Método de Simpson 1/3 Generalizado (dados tabulados):");
Simpson_1_3_Dados(X, Y, integral_exata);

printf("\n>>> Método de Simpson 3/8 Generalizado (dados tabulados):");
Simpson_3_8_Dados(X, Y, integral_exata);

deff('y = f(x)', 'y=exp(-0.2*x)*cos(x)');
x0 = 0.0;
xn = 6.0;
n = 1000;

printf("\n>>> Método do Trapézio Generalizado (função dada ou calculada):");
Trapezio_Funcao(f, x0, xn, n, integral_exata);

printf("///////////////////// FIM INTEGRAÇÃO NUMÉRICA /////////////////////")
