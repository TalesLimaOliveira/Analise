using DataStructures

function sqrtsort_heap(array)
    n = length(array)
    subarrays = split_subarrays(array)
    
    # Cria uma MaxHeap com cada subvetor
    heaps = [BinaryMaxHeap(sub) for sub in subarrays]
    
    solution = Vector{Int}(undef, n)
    current_pos = n
    
    while !isempty(heaps)
        # Encontrar o maior elemento em cada heap
        max_elements = [first(heap) for heap in heaps]
        max_index = argmax(max_elements)
        
        # Inserir o maior elemento na posição correta no vetor solução
        solution[current_pos] = pop!(heaps[max_index])
        current_pos -= 1
        
        if isempty(heaps[max_index])
            deleteat!(heaps, max_index)
        end
    end
    
    # print("Heap $n: $solution\n\n")
    return solution
end
