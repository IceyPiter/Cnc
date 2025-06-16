function V = vander_matrix(X)
    n = length(X);
    V = zeros(n, n);
    
    for i = 1:n 
        for j = 1:n 
            V(i,j) = X(i)^(j - i);
        end 
    end 
endfunction
