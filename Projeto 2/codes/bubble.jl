function bubblesort!(sub_array)
    n = length(sub_array)
    for i in 1:n-1
        for j in 1:n-i
            if sub_array[j] > sub_array[j+1]
                sub_array[j], sub_array[j+1] = sub_array[j+1], sub_array[j]
            end
        end
    end
end

function sqrtsort_bubble(array)
    n = length(array)
    sqrt_n = floor(Int, sqrt(n))
    subarrays = [array[i:min(i+sqrt_n-1, n)] for i in 1:sqrt_n:n]
    
    # Ordenar cada subvetor
    for sub in subarrays
        bubblesort!(sub)
    end

    solution = Vector{Int}(undef, n)  # Cria um vetor de tamanho n
    current_pos = n  # Posição inicial para inserção na solução
    
    while !isempty(subarrays)
        # Encontrar o maior elemento em cada subvetor
        max_elements = [last(sub) for sub in subarrays]
        max_index = argmax(max_elements)
        
        # Inserir o maior elemento na posição correta no vetor solução
        solution[current_pos] = max_elements[max_index]
        current_pos -= 1
        
        # Remover o maior elemento do subvetor correspondente
        pop!(subarrays[max_index])
        
        if isempty(subarrays[max_index])
            deleteat!(subarrays, max_index)
        end
    end
    
    # print("Bubble $n: $solution\n\n")
    return solution
end
