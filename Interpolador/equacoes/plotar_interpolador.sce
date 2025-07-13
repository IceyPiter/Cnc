function plotar_interpolador(X, Y, COEF, Xint)
  
  if typeof(COEF) == "polynomial" then
    COEF = coeff(COEF)
  end
  Pol = poly(COEF, 'x', 'c')

  xx = linspace(X(1), X($), 300)
  yy = horner(Pol, xx)

  clf()
  plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3)
  xgrid()
  xtitle("Polinômio interpolador: pₙ(x) = " + pol2str(Pol), "x", "f(x)")
  a = gca()
  a.title.font_size = 4
  a.x_label.font_size = 4
  a.y_label.font_size = 4

  if argn(2) >= 4 then
    Yint = horner(Pol, Xint)

    //pontos interpolados destacados
    plot(Xint, Yint, 'gs', 'LineWidth', 12)
    legend(["Pontos dados", "Interpolador", "Pontos interpolados"], 2)


    //retas verticais pontilhadas conectando cada ponto ao eixo x
    for k = 1:length(Xint)
      xi = Xint(k)
      yi = Yint(k)
      plot([0 xi], [yi yi], 'k--', 'LineWidth', 1)
    end
  end
endfunction
