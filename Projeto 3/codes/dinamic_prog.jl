# Função 3: Programação Dinâmica
function mochila_programacao_dinamica(I, C, P, V)
    dp = zeros(Int, I + 1, C + 1)
    
    for i in 1:I
        for c in 0:C
            if P[i] <= c
                dp[i + 1, c + 1] = max(dp[i, c + 1], dp[i, c - P[i] + 1] + V[i])
            else
                dp[i + 1, c + 1] = dp[i, c + 1]
            end
        end
    end
    
    result = zeros(Int, I)
    capacidade_restante = C
    for i in I:-1:1
        if dp[i + 1, capacidade_restante + 1] != dp[i, capacidade_restante + 1]
            result[i] = 1
            capacidade_restante -= P[i]
        end
    end
    
    valor_total = dp[I + 1, C + 1]
    
    return result, valor_total
end
