function bubblesort!(sub)
    n = length(sub)
    for i in 1:n-1
        for j in 1:n-i
            if sub[j] > sub[j+1]
                sub[j], sub[j+1] = sub[j+1], sub[j]
            end
        end
    end
end


function sqrtsort_bubble(array)
    n = length(array)
    subarrays = split_subarrays(array)
    
    # Ordenar cada subvetor usando Bubble Sort
    [bubblesort!(sub) for sub in subarrays]

    solution = Vector{Int}(undef, n)
    current_pos = n
    
    while !isempty(subarrays)
        # Encontrar o maior elemento em cada subvetor
        max_elements = [last(sub) for sub in subarrays]
        max_index = argmax(max_elements)
        
        # Inserir o maior elemento na posição correta no vetor solução
        solution[current_pos] = pop!(subarrays[max_index])
        current_pos -= 1       
        
        if isempty(subarrays[max_index])
            deleteat!(subarrays, max_index)
        end
    end
    
    # print("Bubble $n: $solution\n\n")
    return solution
end
