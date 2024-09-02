function insertion_sort!(arr)
    n = length(arr)
    for i in 2:n
        key = arr[i]
        j = i - 1
        while j > 0 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
    return arr
end


function sqrtsort_insertion!(array)
    n = length(array)
    subarrays = split_subarrays(array)

    # Ordenar cada subvetor usando Insertion Sort
    [insertion_sort!(sub) for sub in subarrays]

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

    # print("Insertion $n: $solution\n\n")
    return solution
end
