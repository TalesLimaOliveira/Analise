# Função 1: Inserir itens de menor peso
function mochila_menor_peso(I, C, P, V)
    indices_ordenados = sortperm(P)
    
    capacidade_restante = C
    result = zeros(Int, I)
    valor_total = 0
    
    for i in indices_ordenados
        if P[i] <= capacidade_restante
            result[i] = 1
            capacidade_restante -= P[i]
            valor_total += V[i]
        end
    end
    
    return result, valor_total
end