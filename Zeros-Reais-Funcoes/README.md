<b>*Como Utilizar cada método da pasta de Zeros-Reais-Funções*</b>

<b>Primeiro Método: "IsolarRaizesFuncao"</b>
> Código:

```
clear();clc();clf();
printf("\n **** MÉTODO GRÁFICO PARA ISOLAR AS RAÍZES DA FUNÇÃO ***** \n");
printf("\n ************* EXEMPLO COM A FUNÇÃO PADRÃO *************** \n");
x = -3:0.1:3                          //Intervalo é colocado aqui, parametros, intervalo inicial, sla, intervalo final, respectivamente...
y = x^2-3                             //Função do gráfico
plot2d(x,y)                           //Início do gráfico
xtitle("Gráfico de fx=x^2-3",...
  "Valores do domínio [-3;3]",...
  "Valores da função f")
xgrid()                               //final do gráfico
```

<b>Segundo Método: "Bisseção"</b>
> Código:

```
clear();clc();clf();
printf("*** APROXIMAÇÃO PELO MÉTODO DA BISSECÇÃO ***\n")

deff('y = f(x)', 'y=x^3-9*x+3')                                 //Função f(x)
ak = 0.0                                                        //Intervalos da Função
bk = 1.0                                                        //Intervalos da Função

epsilon1 = 1e-02
epsilon2 = 1e-02
k = 0                                                           //Iteração Atual
nMax = 100                                                      //Número Max de iterações
xm = 0.5*(ak + bk)                                              //Ponto médio do intervalos

printf(" k |      zm    | abs(bk-ak) |  f(xm  |    \n")
while (k < nMax) & (abs(bk - ak) > epsilon1) & (abs(f(xm)) > epsilon2)
    xm = 0.5*(ak + bk)
    k = k + 1
    printf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xm, abs(bk-ak), f(xm))
    if f(ak) * f(xm) < 0 then
        bk = xm
    else
        ak = xm
    end
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações", xm, k)
```

<b>Terceiro Método: "FalsaPosição"</b>
> Código:

```
clear();clc();clf();
printf("*** APROXIMAÇÃO PELO MÉTODO DA FALSA POSIÇÃO ***\n")

deff('y = f(x)', 'y=x^3-9*x+3')                                 //Função f(x)
ak = 0.0                                                        //Intervalos da Função
bk = 1.0                                                        //Intervalos da Função

epsilon1 = 1e-05
epsilon2 = 1e-05
k = 0                                                           //Iteração Atual
nMax = 100                                                      //Número Max de iterações

xk = (ak*f(bk) - bk*f(ak)) / (f(bk) - f(ak))                    //Ponto médio do intervalos


printf(" k |      xk    | abs(xb-xa) |  f(xk)  |    \n")
while (k < nMax) & (abs(bk - ak) > epsilon1) & (abs(f(xk)) > epsilon2)
    xk = (ak*f(bk) - bk*f(ak)) / (f(bk) - f(ak))
    k = k + 1
    printf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xk, abs(bk-ak), f(xk))
    if f(ak) * f(xk) < 0 then
        bk = xk
    else
        ak = xk
    end
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações", xk, k)
```

