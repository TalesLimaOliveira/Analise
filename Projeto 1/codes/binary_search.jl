using BenchmarkTools

# Binary search function
function binary_search(sorted_vector, key)
    low = 1
    high = length(sorted_vector)
    
    while low <= high
        mid = (low + high) ÷ 2
        if sorted_vector[mid] == key
            return mid  # Returns the index where the key was found
        elseif sorted_vector[mid] < key
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return -1  # Returns -1 if the key is not found
end

# Binary search - Benchmarking
function binary_benchmark(vector_list, key_list)
    for i in 1:length(vector_list)   # For each vector size
        for j in 1:length(key_list)  # For each key numbers
            bench_binary = @benchmark [binary_search($vector_list[$i], k) for k in $key_list[$j]]
            time_binary_search[i, j] = median(bench_binary).time / 1e9
        end
    end
    return time_binary_search
end
