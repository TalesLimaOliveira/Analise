using BenchmarkTools

# Simple linear search function
function simple_search(vector, key)
    for i in 1:eachind(vector)
        if vector[i] == key
            return i  # Returns the index where the key was found
        end
    end
    return -1  # Returns -1 if the key is not found
end


# Simple linear search - Benchmarking
function simple_benchmark(vector_list, key_list)
    for i in 1:length(vector_list)  # For each vector size
        for j in 1:length(key_list)  # For each key numbers
            bench_simple = @benchmark [simple_search($vector_list[$i], k) for k in $key_list[$j]]
            time_simple_search[i, j] = median(bench_simple).time / 1e9
        end
    end 
    return time_simple_search
end
