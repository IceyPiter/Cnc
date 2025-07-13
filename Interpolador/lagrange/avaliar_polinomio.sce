function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_real)
    
    // Avalia o polinomio interpolador no ponto especifico
    valor_aprox = horner(POL, ponto)
    
    // Verifica se o valor real foi fornecido (terceiro argumento)
    if argn(2) == 3 then
        // Se sim, calcula o erro percentual relativo
        erro_percentual = abs((valor_aprox - valor_real) / valor_real) * 100
    else
        // Caso contrário, atribui NaN ao erro
        erro_percentual = %nan
    end
endfunction
