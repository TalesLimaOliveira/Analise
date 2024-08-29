using DataStructures

function sqrtsort_heap(array)
    n = length(array)
    sqrt_n = floor(Int, sqrt(n))
    subarrays = [array[i:min(i+sqrt_n-1, n)] for i in 1:sqrt_n:n]
    
    heaps = [BinaryMaxHeap(sub) for sub in subarrays]
    
    solution = Vector{Int}(undef, n)  # Cria um vetor de tamanho n
    
    for i in n:-1:1
        max_elements = [first(heap) for heap in heaps]
        max_index = argmax(max_elements)
        solution[i] = pop!(heaps[max_index])  # Insere o maior elemento na posição correta
        
        if isempty(heaps[max_index])
            deleteat!(heaps, max_index)
        end
    end
    
    # print("Heap $n: $solution\n\n")
    return solution
end
