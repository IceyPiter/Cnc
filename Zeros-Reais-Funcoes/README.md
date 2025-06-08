<b>*Como Utilizar cada método da pasta de Zeros-Reais-Funções*</b>

<b>Primeiro Método: "IsolarRaizesFuncao"</b>
> Código:

<code>clear();clc();clf();
printf("\n **** MÉTODO GRÁFICO PARA ISOLAR AS RAÍZES DA FUNÇÃO ***** \n");
printf("\n ************* EXEMPLO COM A FUNÇÃO PADRÃO *************** \n");
x = -3:0.1:3 //Intervalo é colocado aqui, parametros, intervalo inicial, sla, intervalo final, respectivamente...
y = x^2-3 //Função do gráfico
plot2d(x,y) //Início do gráfico
xtitle("Gráfico de fx=x^2-3",...
----"Valores do domínio [-3;3]",...
----"Valores da função f")
xgrid()//final do gráfico</code>

