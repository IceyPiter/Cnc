clear();clc();
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Integração\01-trapezio_dados.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Integração\02-simpson_1_3_dados.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Integração\03-simpson_3_8_dados.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Integração\04-trapezio_funcao.sce", -1)

//Problema 5, não solução analitica com funções elementares, resolvido a integral exata com o mathematica
X = [0, 1, 2, 3, 4, 5, 6]
Y = [1, 0.44, -0.23, -0.47, -0.24, 0.13, 0.27]
integral_exata = -0.471266

printf("\n>>> Método do Trapézio Generalizado (dados tabulados):");
Trapezio_Dados(X, Y, integral_exata);

printf("\n>>> Método de Simpson 1/3 Generalizado (dados tabulados):");
Simpson_1_3_Dados(X, Y, integral_exata);

printf("\n>>> Método de Simpson 3/8 Generalizado (dados tabulados):");
Simpson_3_8_Dados(X, Y, integral_exata);

//deff('y = f(x)', 'y=exp(-0.2*x)*cos(x)');
deff('y = f(x)', 'y=1 -0.2073333*x -0.5322222*x^2 +0.1904167*x^3 -0.0080556*x^4 -0.0030833*x^5 +0.0002778*x^6');
x0 = 0.0;
xn = 6.0;
n = 1000;

printf("\n>>> Método do Trapézio Generalizado (função dada ou calculada):");
Trapezio_Funcao(f, x0, xn, n, integral_exata);

printf("///////////////////// FIM INTEGRAÇÃO NUMÉRICA /////////////////////")
