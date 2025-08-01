// progressiva
function Erro_Truncamento_P(h, derivada_2a_exata)
    erro_trunc = abs(- (h/2) * derivada_2a_exata)
    printf("Erro de truncamento (progressiva 1a ordem) : |-(h/2)*segunda derivada| = %.6f\n", erro_trunc)
endfunction

// regressiva
function Erro_Truncamento_R(h, derivada_2a_exata)
    erro_trunc = abs((h/2) * derivada_2a_exata)
    printf("Erro de truncamento (regressiva 1a ordem) : |(h/2)*segunda derivada| = %.6f\n", erro_trunc)
endfunction

// Erro truncamento C21 Centrada de 2a ordem para a 1a derivada
function Erro_Truncamento_C21(h, derivada_3a_exata)
    erro_trunc = abs((h^2 / 6) * derivada_3a_exata)
    printf("Erro de truncamento (centrada 2a ordem 1a derivada) : |(h^2 / 6)*terceira derivada| = %.6f\n", erro_trunc)
endfunction

// Erro truncamento Centrada de 2a ordem para a 2a derivada
function Erro_Truncamento_C(h, derivada_4a_exata)
    erro_trunc = abs((h / 12) * derivada_4a_exata)
    printf("Erro de truncamento (centrada 2a ordem 2a derivada) : |(h / 12)*quarta derivada| = %.6f\n", erro_trunc)
endfunction
