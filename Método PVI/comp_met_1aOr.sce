clc(); clear()
//carregamento dos métodos e da função de visualização
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Método PVI\1-euler_1aOr.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Método PVI\2-euler_1aMOD.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Método PVI\3-taylor_2aOr.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Método PVI\4-RK3_3aOr.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Método PVI\5-RK4_4aOr.sce", -1)
exec("C:\Users\Fabiano\OneDrive\Documentos\CNC\Método PVI\6-plotar_resultados.sce", -1)

//definição do pvi com solução exata conhecida

//=========PROB. 1=========
/*a = 0.0; b = 1.0    //a = x0 e b = xn (ponto desejado)
x0 = a; y0 = 50
k = 1.5; Tmax = 200 
*/
//=========PROB. 2=========
/*a = 0.0; b = 5.0    //a = x0 e b = xn (ponto desejado)
x0 = a; y0 = 20
*/
//=========PROB. 8=========
//a = 0.0; b = 10.0    //a = x0 e b = xn (ponto desejado)
//x0 = a; y0 = 0.5

//h = 0.1            //ESPAÇAMENTO!! precisa mexer pra um estudo - é a OBS 2
//n = int((b-a) / h) //garante numero inteiro de passos

//=========PROB. 10=========
a = 0.0; b = 4.0    //a = x0 e b = xn (ponto desejado)
x0 = a; y0 = 0.0

h = 0.1            //ESPAÇAMENTO!! precisa mexer pra um estudo - é a OBS 2
n = int((b-a) / h) //garante numero inteiro de passos

//funções do pvi
//ex 6.12
//dy = x-2*y            //y'
//d2y = 1 - 2*x + 4*y   //y''
//yex = x/2 - 1/4 + 5/4*exp(-2*x)

//=========PROB. 1=========

/*function dy = f(x,y)        //y'
    dy = k*(Tmax - y)
endfunction

function d2y = df(x, y)     //y''
    d2y = -k^2*(Tmax - y)
endfunction

function yex = y_exata(x)   //solução analítica da equação diferencial
    yex = Tmax - (Tmax - y0) * exp(-k*x)
endfunction
*/

//=========PROB. 2=========
/*function dy = f(x,y)        //y'
    dy = (50-y) / 10
endfunction

function d2y = df(x, y)     //y''
    d2y = -(1/10) * ((50-y) / 10)
endfunction

function yex = y_exata(x)   //solução analítica da equação diferencial
    yex = 50 - 30 * exp(-x/10)
endfunction
*/

//=========PROB. 8=========
//function dy = f(x,y)        //y'
//    dy = 0.1*y*(1-y)
//endfunction

//function d2y = df(x, y)     //y''
//    d2y = 0.1*(0.1*y*(1-y))*(1-2*y)
//endfunction

//function yex = y_exata(x)   //solução analítica da equação diferencial
//    yex = 1 ./ (1+exp(-0.1*x))  //seila o scilab não quis fazer com /
//endfunction

//=========PROB. 10=========
function dy = f(x,y)        //y'
    dy = log(x+1)
endfunction

function d2y = df(x, y)     //y''
    d2y = 1/(x+1)
endfunction

function yex = y_exata(x)   //solução analítica da equação diferencial
    yex = (x+1).*log(x+1)-x  //seila o scilab não quis fazer com /
endfunction

//métodos numéricos
[x1, y1] = euler_1a_ordem(f, x0, y0, h, n)
[x2, y2] = euler_modificado(f, x0, y0, h, n)
[x3, y3] = taylor_2a_ordem(f, df, x0, y0, h, n)
[x4, y4] = rk3_3a_ordem(f, x0, y0, h, n)
[x5, y5] = rk4_4a_ordem(f, x0, y0, h, n)

//solução exata
yex = y_exata(x1)

//cálculo de erro absoluto
printf("\n======================== ERROS FINAIS EM y(x0) ========================\n")
mprintf("Metodo                   y(x)        Erro Relativo (%%)\n")
mprintf("---------------------------------------------------------\n")
mprintf("Euler 1a Ordem       %9.6f     %10.6f\n", y1($), 100 * abs((y1($) - yex($)) / yex($)))
mprintf("Euler Modificado     %9.6f     %10.6f\n", y2($), 100 * abs((y2($) - yex($)) / yex($)))
mprintf("Taylor 2a Ordem      %9.6f     %10.6f\n", y3($), 100 * abs((y3($) - yex($)) / yex($)))
mprintf("Runge-Kutta 3a Ordem %9.6f     %10.6f\n", y4($), 100 * abs((y4($) - yex($)) / yex($)))
mprintf("Runge-Kutta 4a Ordem %9.6f     %10.6f\n", y5($), 100 * abs((y5($) - yex($)) / yex($)))
mprintf("---------------------------------------------------------\n")
mprintf("Solução Exata            %9.6f\n", yex($))
printf("======================== ERROS FINAIS EM y(x0) ========================\n\n")

//grafico comparativo
clf()
plot(x1, y1, 'r-o', x2, y2, 'g-x', x3, y3, 'm-+', x4, y4, 'c-s', x5, y5, 'b-*', x1, yex, 'k--')

xgrid(1)
xtitle("Comparação de Métodos para o PVI: Problema 10 (h = 0,1)", "x", "Solução y(x)")
legend(["Euler 1a Ordem", "Euler Modificado", "Taylor 2a Ordem", "Runge-Kutta 3a Ordem", "Runge-Kutta 4a Ordem", "Solução Exata"], "in_upper_left")
