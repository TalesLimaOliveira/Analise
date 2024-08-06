using BenchmarkTools

# Optimized linear search function
function optimized_search(sorted_vector, key)
    for i in eachindex(sorted_vector)
        if key == sorted_vector[i]
            return i  # Returns the index where the key was found
        elseif key < sorted_vector[i]
            return -1  # Returns -1 if the key is not found
        end
    end
    return -1  # Returns -1 if the key is not found
end

# Optimized Linear search - Benchmarking
function optimized_benchmark(vector_list, key_list)  
    for i in 1:length(vector_list)   # For each vector size
        for j in 1:length(key_list)  # For each key numbers
            bench_optimized = @benchmark [optimized_search($vector_list[$i], k) for k in $key_list[$j]]
            time_optimized_search[i, j] = median(bench_optimized).time / 1e9
        end
    end
    return time_optimized_search
end