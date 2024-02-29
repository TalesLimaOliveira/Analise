using BenchmarkTools
using Plots
using Statistics

# Function to generate a vector of random values
function generate_random_vector(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end

# Function to generate a random key
function generate_random_key(upper_limit::Int)
    return rand(1:upper_limit)
end

# Sequential search function
function sequential_search(vector, key)
    for i in 1:length(vector)
        if vector[i] == key
            return i  # Returns the index where the key was found
        end
    end
    return -1  # Returns -1 if the key is not found
end

# Optimized sequential search function
function optimized_sequential_search(sorted_vector, key)
    for i in 1:length(sorted_vector)
        if key == sorted_vector[i]
            return i  # Returns the index where the key was found
        elseif key < sorted_vector[i]
            return -1  # Returns -1 if the key is not found
        end
    end
    return -1  # Returns -1 if the key is not found
end

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

# Benchmarking the binary search function
function benchmark_search()
    vector_size = 1000  # Adjust the size of the vector for benchmarking
    upper_limit = 1000  # Adjust the upper limit for generating random numbers

    vector = generate_random_vector(vector_size, upper_limit)
    sorted_vector = sort(vector)  # Sort the vector for binary search
    sort_bench = @benchmark sort($vector)

    best_times = Dict()
    best_times["sort"] = minimum(sort_bench.times) / 1e6

    sequential_bench = @benchmark sequential_search($vector, generate_random_key($upper_limit))
    best_times["sequential"] = minimum(sequential_bench.times) / 1e6

    optimized_bench = @benchmark optimized_sequential_search($sorted_vector, generate_random_key($upper_limit))
    best_times["optimized"] = minimum(optimized_bench.times) / 1e6

    binary_bench = @benchmark binary_search($sorted_vector, generate_random_key($upper_limit))
    best_times["binary"] = minimum(binary_bench.times) / 1e6
    
    gr()
    t = sequential_bench.times / 1e6 # times in milliseconds
    m, o = minimum(t), std(t)

    histogram(t, bins=500,
        xlim=(m - 0.01, m + o),
        xlabel="milliseconds", ylabel="count", label="")

    for (key, value) in sort(collect(best_times), by=last)
        println(rpad(key, 25, "."), lpad(round(value; digits=1), 6, "."))
    end

end

# Run the benchmark
benchmark_search()
