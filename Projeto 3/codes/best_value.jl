# Função 2: Inserir itens com melhor relação benefício/custo
function mochila_beneficio_custo(I, C, P, V)
    beneficio_custo = [V[i] / P[i] for i in 1:I]
    indices_ordenados = sortperm(beneficio_custo, rev=true)
    
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