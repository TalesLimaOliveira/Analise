using Statistics

function split_subarrays(array)
    n = length(array)
    sqrt_n = floor(Int, sqrt(n))
    subarrays = [array[i:min(i+sqrt_n-1, n)] for i in 1:sqrt_n:n]
    return subarrays
end


function my_benchmark(dummy_func, dummy_time)
    for i in 1:length(array_list)
        median_time = zeros(benchmark_count)
        for c in 1:benchmark_count
            array_copy = copy(array_list[i])
            start = time_ns()
            dummy_func(array_copy)
            final = time_ns()
            median_time[c] = (final - start) / 1e9
        end
        dummy_time[i] = median(median_time)
    end
end