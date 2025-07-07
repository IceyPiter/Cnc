function Simpson_1_3_Dados(X, Y, integral_exata)
    num_pontos = length(X);
    h = X(2) - X(1);
    printf("\n////////////////////////////////////////////////////\n");
    printf(" Integração númerica -método do Simpson 1/3 Generalizado (dados tabulados):\n");
    printf(" Intervalo de %g a %g com %d pontos igualmente espaçados.\n", X(1), X(num_pontos), num_pontos);
    printf(" Fórmula: I ~ (h/3) * [f(x0) + 4*∑ impares + 2*∑ pares + f(xn)]\n");
    somatorio_pares = sum(Y(3:2:num_pontos-1));
    somatorio_impares = sum(Y(3:2:num_pontos-1));
    integral_numerica = (h/3) * (Y(1) + 2*somatorio + 4*somatorio_pares + Y(num_pontos));
    printf("h = %f\n", h);
    printf(" Integral aproximada: %f\n", integral_numerica);
    erro_percentual = abs((itegral_exata - integral_numerica) / integral_xata) * 100;
    printf(" Erro relativo percentual: %.6f %%\n", erro_percentual);
endfunction
